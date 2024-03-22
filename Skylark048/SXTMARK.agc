### FILE="Main.annotation"
## Copyright:	Public domain.
## Filename:	SXTMARK.agc
## Purpose:	A section of Skylark revision 048.
##		It is part of the source code for the Apollo Guidance Computer (AGC)
##		for Skylab-2, Skylab-3, Skylab-4, and ASTP. No original listings of
##		this software are available; instead, this file was created via
##		disassembly of dumps of the core rope modules actually flown on
##		Skylab-2. Access to these modules was provided by the New Mexico
##		Museum of Space History.
## Assembler:	yaYUL
## Contact:	Ron Burkey <info@sandroid.org>.
## Website:	www.ibiblio.org/apollo/index.html
## Mod history:	2023-09-04 MAS  Created from Artemis 072.
##		2024-03-05 MAS  Updated for Skylark 48.


# PROGRAM NAME     -     SXTMARK
#
# MOD. 1	8 AUG. 69	BY P.RYE
#
# FUNCTIONAL DESCRIPTION
#
#	SXTMARK IS CALLED BY P03 AND BY P22, P23, P51, AND P52 VIA R53.
#	THE REGISTER MARKINDX IS SET TO 5 IF THE CALLING PROGRAM IS P22, OR TO 1 FOR OTHER USERS.
#	   THIS REGISTER INDICATES THE NUMBER OF MARKS DESIRED.
#	THE REGISTER EXTVBACT IS CHECKED (SUBROUTINE TESTMARK) TO INSURE THAT THE MARK DISPLAY SYSTEM
#	   IS FREE.  IF NOT, BAILOUT (31211) IS DONE.
#	BIT 2 OF THE REGISTER EXTVBACT IS SET BY SXTMARK, RESERVING THE MARKING AND EXTENDED VERB SYSTEM.
#	SXTMARK DISPLAYS A FLASHING VERB 51, CALLING FOR MARKS.  A PROCEED RESPONSE TO THIS DISPLAY
#	   WILL RELEASE THE MARKING SYSTEM (SUBROUTINES MKRELEAS, CLEARMARK) AND RETURN TO THE
#	   CALLING PROGRAM.
#
#	WHEN SUFFICIENT MARKS HAVE BEEN MADE (MARKINDX = 0) A FLASHING V50N25, R1 = 16, IS DISPLAYED.
#	   A PROCEED RESPONSE TO THIS DISPLAY WILL RETURN TO THE CALLING PROGRAM AFTER RELEASING THE
#	   MARKING SYSTEM.
#
#	MARKS ARE PROCESSED BY THE ROUTINE MARKRUPT AS FOLLOWS:
#		IF NO MARKS ARE CALLED FOR, ALARM CODE 114 IS SENT AND THE MARKRUPT ROUTINE EXITS.
#		IF A MARK IS ACCEPTED, MARKFLG IS SET TO ENABLE A REJECT.
#		IF R21(P20) IS RUNNING, DATA IS MOVED FROM STORAGE MRKBUF1 INTO MRKBUF2.  NEW MARK DATA
#			IS STORED INTO MRKBUF1.
#		IF P22 IS RUNNING, MARK DATA IS STORED INTO SVMRKDAT, USING THE REGISTER P22DEX AS AN
#			INDEX AND THE REGISTER 8NN AS A COUNTER.  MARKINDX IS DECREMENTED.
#		IF R57 IS RUNNING, MARK DATA IS STORED INTO MARKDOWN FOR DOWNLINK, THEN PROCESSED AS FOR
#			R21.  MARKRUPT THEN CALLS MARKDISP (IN R57).
#		FOR OTHER USERS, MARK DATA IS STORED INTO MRKBUF1 AND MARKINDX IS DECREMENTED.
#
#	MARK REJECTS ARE PROCESSED BY THE ROUTINE MARKRUPT AS FOLLOWS:
#		IF MARKFLG IS CLEAR (I.E., NO MARK WAS TAKEN), ALARM CODE 110 IS SENT AND THE ROUTINE EXITS.
#		OTHERWISE, MARKINDX IS INCREMENTED, THE P22 INDICATORS 8NN AND P22DEX ARE DECREMENTED
#			(IF THE USER IS P22), AND THE V51FL DISPLAY IN SXTMARK IS REESTABLISHED.
#
#	IF THE ERASABLE REGISTER CDUCHKWD IS SET TO A NON-ZERO VALUE, VALIDITY OF THE MARKS IS CHECKED
#	   BY THE MARKRUPT ROUTINE AS FOLLOWS:
#		IF THE CDU'S CHANGE BY MORE THAN 3 BITS OVER THE TIME PERIOD INDICATED BY THE VALUE OF
#			CDUCHKWD, ALARM CODE 121 IS SENT AND THE ROUTINE EXITS.
#
# CALLING SEQUENCE -
#
#	TC	BANKCALL
#	CADR	SXTMARK
#


# NORMAL EXIT MODE -
#
#	RETURN TO USER VIA BANKJUMP (RETURN ADDRESS IN OPTCADR).
#
#
# ALARM OR ABORT EXIT MODES
#
#	1. ALARM 110 - MARK REJECT WITH NO MARK
#	2. ALARM 113 - NO INBITS
#	3. ALARM 121 - CDU'S NO GOOD AT MARK TIME
#	4. ALARM 114 - MARK MADE BUT NOT DESIRED
#	5. BAILOUT 31211 - MARK DISPLAY SYSTEM BUSY
#
#
# ERASABLE INITIALIZATION REQUIRED -
#
#	NONE
#
#
# OUTPUT -
#
#	FOR P22:
#		MARK DATA IN SVMRKDAT
#		MARKINDX DECREMENTED BY ONE FOR EACH MARK TAKEN
#		NO. OF MARKS IN 8NN
#	FOR R57:
#		MARK DATA IN MARKDOWN AND MRKBUF1
#	FOR OTHER USERS:
#		MARKINDX DECREMENTED TO ZERO IF A MARK WAS TAKEN
#		MARK DATA IN MRKBUF1
#
#
# CONDITIONS AT EXIT -
#
#	MARKINDX = INITIAL VALUE - NO. MARKS TAKEN
#	MARKING SYSTEM IS RELEASED :
#		EXTVBACT = 0
#		BIT 9 OPTMODES = 0
#		OPTIND = -1
#		BIT 2 CHAN12 = 0
#	MARKFLG = 0
#	OPTCADR CONTAINS CADR OF SXTMARK CALLER
#

		SETLOC	SXTMARKE
		BANK

		EBANK=	MRKBUF1
		COUNT*	$$/SXTMK
SXTMARK		TC	TESTMARK
SETMRK		CAF	ONE			# INITIALIZE MARK COUNTER
		TS	MARKINDX

		TC	MAKECADR		# STORE RETURN TO USER WHO CALLED
		TS	OPTCADR			#    SXTMARK IN OPTCADR

MKVB51		TC	BANKCALL		# CLEAR DISPLAY FOR MARK VERB
		CADR	KLEENEX
MKVBDSP		CAF	VB51			# DISPLAY MARK VERB 51
 +1		TC	BANKCALL
		CADR	GOMARK4
		TCF	TERMSXT			# VB34-TERMINATE
		TCF	ENTANSWR		# V33-PROCEED-MARKING DONE
		TCF	MKVB5X			# ENTER-RECYCLE TO INITIAL MARK DISPLAY

TERMSXT		TC	CLEARMRK		# CLEAR MARK ACTIVITY.

		TC	MKRLEES

		TC	CHECKMM
		MM	03
		TCF	+2
		TC	TERMP03
		TC	GOTOPOOH

TERMP03		TC	POSTJUMP
		CADR	GCOMP5

ENTANSWR	CAF	PRIO24
		TC	NOVAC
		EBANK=	WHOCARES
		2CADR	ENDEXT

		CAF	PRIO13			# ALLOW LEFTOVER SLEEPING JOB IF ANY
		TC	PRIOCHNG

MKVRET		CA	OPTCADR			# OPTCADR HAS RETURN CADR OF USER WHO
		TC	BANKJUMP		#    CALLED SXTMARK

MKVB5X		CCS	MARKINDX		# REDISPLAY VB51 IF MORE MARKS WANTED
		TCF	MKVB51
MKVB50		CAF	R1D1			# OCT 16
		TS	DSPTEM1
		CAF	V50N25			# DISPLAY V50N25 IF MARKING DONE.
		TCF	MKVBDSP +1
V50N25		VN	5025
VB51		VN	5100

TESTMARK	CAF	SIX
		MASK	EXTVBACT
		CCS	A
		TCF	MKABORT
		CAF	BIT2
		ADS	EXTVBACT
		TC	Q

MKABORT		TC	BAILOUT
		OCT	31211

MKRELEAS	EQUALS	MKRLEES

MKRLEES		INHINT
		CA	NEGONE
		TS	OPTIND			# KILL COARS OPTICS

		CAF	ZERO
		TS	MARKINDX

		CS	MARKBIT
		MASK	FLAGWRD1
		TS	FLAGWRD1

		RELINT

		TC	Q


MARKRUPT	TS	BANKRUPT		# STORE CDUS AND OPTICS NOW
		CA	CDUT
		TS	MKCDUT
		CA	CDUS
		TS	MKCDUS
		CA	CDUY
		TS	MKCDUY
		CA	CDUZ
		TS	MKCDUZ
		CA	CDUX
		TS	MKCDUX
		EXTEND
		DCA	TIME2			# GET TIME
		DXCH	MKT2T1
		EXTEND
		DCA	MKT2T1
		DXCH	SAMPTIME		# RUPT TIME FOR NOUN 65.

		XCH	Q
		TS	QRUPT

		CAF	BIT6			# SEE IF MARK OR MKREJECT
		EXTEND
		RAND	NAVKEYIN
		CCS	A
		TC	MARKIT			# ITS A MARK

		CAF	BIT7			# NOT A MARK, SEE IF MKREJECT
		EXTEND
		RAND	NAVKEYIN
		CCS	A
		TC	MKREJECT		# ITS A MARK REJECT

KEYCALL		CAF	OCT37			# NOT MARK OR MKREJECT, SEE IF KEYCODE
		EXTEND
		RAND	NAVKEYIN
		EXTEND
		BZF	+3			# IF NO INBITS
		TC	POSTJUMP
		CADR	KEYCOM			# IT,S A KEY CODE, NOT A MARK.

 +3		TC	ALARM			# ALARM IF NO INBITS
		OCT	113
		TC	RESUME


# PROGRAM NAME - MARKIT					DATE- 19 SEPT 1967
#
# CALLING SEQUENCE
#	FROM MARKRUPT IF CHAN 16 BIT 6 = 1
#
# EXIT
#	RESUME
#
# INPUT
#	CDUCHKWD. ALSO ALL INITIALIZATION FOR MARKCONT
#
# OUTPUT
#	MKT2T1,MKCDUX,MKCDUY,MKCDUZ,MKCDUS,MKCDUT
#
# ALARM EXIT
#	NONE

MARKIT		CCS	CDUCHKWD
		TCF	+3			# DELAY OF CDUCHKWD CS IF PNZ
		TCF	+2
		CAF	ZERO
		AD	ONE			# 10 MS IF NO CHECK
		TC	WAITLIST
		EBANK=	MRKBUF1
		2CADR	MARKDIF

		TCF	RESUME

MARKDIF		CA	CDUCHKWD		# IF DELAY CHECK IS ZERO OR NEG, ACP MARK
		EXTEND
		BZMF	MARKCONT
		CS	BIT1
		TS	MKNDX			# SET INDEX -1
		CA	MKCDUX
		TC	DIFCHK			# SEE IF VEHICLE RATE TO MUCH AT MARK
		CA	MKCDUY
		TC	DIFCHK
		CA	MKCDUZ
		TC	DIFCHK

MARKCONT	CAF	R21BIT			# R21 MARKING
		MASK	FLAGWRD2
		CCS	A
		TCF	PUTMARK			# YES

		CCS	MARKINDX		# MARKS CALLED FOR
		TCF	MARK2			# YES

114ALM		TC	ALARM
		OCT	114			# MARKS NOT CALLED FOR
		TC	TASKOVER

MARK2		TS	MARKINDX		# DECREMENT NO. MARKS WANTED

		TC	UPFLAG
		ADRES	MARKFLG			# SET FLAG TO ENABLE REJECT

		TCF	PUTMARK

MARKDONE	CCS	MARKINDX		# ANY MORE MARKS TO BE TAKEN
		TCF	TASKOVER
		CAF	PRIO22
		TC	FINDVAC
		EBANK=	MRKBUF1
		2CADR	MKVB5X

		TCF	TASKOVER

PUTMARK		CAF	SIX
		TC	GENTRAN
		ADRES	MKT2T1
		ADRES	MRKBUF1

		CAF	R21BIT			# DONT CALL VB50 DISPLAY FOR R21
		MASK	FLAGWRD2
		CCS	A
		TCF	TASKOVER

		TCF	MARKDONE

DIFCHK		INCR	MKNDX			# INCREMENT INDEX

		EXTEND
		INDEX	MKNDX
		MSU	CDUX			# GET MARK(ICDU) - CURRENT(ICDU)
		CCS	A
		TCF	+4
		TC	Q
		TCF	+2
		TC	Q
		AD	NEG2			# SEE IF DIFFERENCE GREATER THAN 3 BITS
		EXTEND
		BZMF	-3			# NOT GREATER

		TC	ALARM			# COUPLED WITH PROGRAM ALARM
		OCT	00121

		TCF	TASKOVER		# DO NOT ACCEPT

MKREJECT	CAF	R21BIT
		MASK	FLAGWRD2		# R21 MARK (SPECIAL MARKING FOR R21)
		EXTEND
		BZF	MRKREJCT		# NOT SET THEREFORE REGULAR REJECT
		CA	MRKBUF1			# IS THERE A MARK IN THE BUFFER?
		EXTEND
		BZF	+3			# YES - REJECT MARK IN BUFFER

		EXTEND
		BZMF	REJCTR22		# NO,SET FLAG TO REJECT MARK PROCESSED-R22

		CA	NEGONE			# -1 (FOR R22)
		TS	MRKBUF1			# -0 IN TIME IS FLAG TO R22 SIGNIFYING A
		TC	RESUME

REJCTR22	CAF	R22CABIT		# IS R22 PROCESSING A MARK?
		MASK	FLAGWRD9
		EXTEND
		BZF	RESUME			# NO IGNORE MARK REJECT

		TC	UPFLAG
		ADRES	REJCTFLG		# YES - SET FLAG FOR R22
		TC	RESUME

MRKREJCT	CAF	MARKBIT
		MASK	FLAGWRD1
		CCS	A
		TC	REJECT3

		TC	ALARM			# DONT ACCEPT TWO REJECTS TOGETHER
		OCT	110
		TC	RESUME

REJECT3		TC	DOWNFLAG
		ADRES	MARKFLG

REJECT4		INCR	MARKINDX		# CALL FOR ANOTHER MARK

REJEXIT		CAF	PRIO22
		TC	FINDVAC
		EBANK=	MRKBUF1
		2CADR	MKVBDSP

		TCF	RESUME