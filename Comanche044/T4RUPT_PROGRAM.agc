### FILE="Main.annotation"
## Copyright:   Public domain.
## Filename:    T4RUPT_PROGRAM.agc
## Purpose:     A section of Comanche revision 044.
##              It is part of the reconstructed source code for the
##              original release of the flight software for the Command
##              Module's (CM) Apollo Guidance Computer (AGC) for Apollo 10.
##              The code has been recreated from a copy of Comanche 055. It
##              has been adapted such that the resulting bugger words
##              exactly match those specified for Comanche 44 in NASA drawing
##              2021153D, which gives relatively high confidence that the
##              reconstruction is correct.
## Assembler:   yaYUL
## Contact:     Ron Burkey <info@sandroid.org>.
## Website:     www.ibiblio.org/apollo/index.html
## Mod history: 2020-12-03 MAS  Created from Comanche 51.

## Page 133
		BANK	12
		SETLOC	T4RUP
		BANK

		COUNT	06/T4RPT

T4RUPT		TS	BANKRUPT
		EXTEND
		QXCH	QRUPT

		CCS	DSRUPTSW	# GOES 7(-1)0 AROUND AND AROUND
		TCF	NORMT4 +1
		TCF	NORMT4

		TCF	QUIKDSP

NORMT4		CAF	SEVEN
		TS	RUPTREG1
		TS	DSRUPTSW

		COUNT	02/T4RPT

74K		=	HIGH4

# RELTAB IS A PACKED TABLE. RELAYWORD CODE IN UPPER 4 BITS, RELAY CODE
# IN LOWER 5 BITS.

		BLOCK	02
		SETLOC	FFTAG12
		BANK

RELTAB		OCT	04025
		OCT	10003
		OCT	14031
		OCT	20033
		OCT	24017
		OCT	30036
		OCT	34034
		OCT	40023
		OCT	44035
		OCT	50037
		OCT	54000
RELTAB11	OCT	60000

## Page 134
# SWITCHED-BANK PORTION.

		BANK	12
		SETLOC	T4RUP
		BANK

		COUNT	06/T4RPT

CDRVE		CCS	DSPTAB +11D
		TC	DSPOUT
		TC	DSPOUT

		XCH	DSPTAB +11D
		MASK	LOW11
		TS	DSPTAB +11D
		AD	RELTAB11
		EXTEND
		WRITE	OUT0
		TC	HANG20

## Page 135
# DSPOUT PROGRAM. PUTS OUT DISPLAYS.

DSPOUTSB	TS	NOUT
		CS	ZERO
		TS	DSRUPTEM	# SET TO -0 FOR 1ST PASS THRU DSPTAB
		XCH	DSPCNT
		AD	NEG0		# TO PREVENT +0
		TS	DSPCNT
DSPSCAN		INDEX	DSPCNT
		CCS	DSPTAB
		CCS	DSPCNT		# IF DSPTAB ENTRY +, SKIP
		TCF	DSPSCAN	-2	# IF DSPCNT +, AGAIN
		TCF	DSPLAY		# IF DSPTAB ENTRY -, DISPLAY
TABLNTH		OCT	12		# DEC 10 LENGTH OF DSPTAB
		CCS	DSRUPTEM	# IF DSRUPTEM=+0, 2ND PASS THRU DSPTAB
120MRUPT	DEC	16372		# (DSPCNT = 0).  +0 INTO NOUT.
		TS	NOUT
		TC	Q
		TS	DSRUPTEM	# IF DSRUPTEM=-0, 1ST PASS THRU DSPTAB
		CAF	TABLNTH		# (DSPCNT=0).+0 INTO DSRUPTEM. PASS AGAIN
		TCF	DSPSCAN -1

DSPLAY		AD	ONE
		INDEX	DSPCNT
		TS	DSPTAB		# REPLACE POSITIVELY
		MASK	LOW11		# REMOVE BITS 12 TO 15
		TS	DSRUPTEM
		CAF	HI5
		INDEX	DSPCNT
		MASK	RELTAB		# PICK UP BITS 12 TO 15 OF RELTAB ENTRY
		AD	DSRUPTEM
		EXTEND
		WRITE	OUT0		# WRITE CHANNEL 10
		TCF	Q+1		# *** NORMAL RETURN SKIPS ONE

DSPOUT		CCS	FLAGWRD5	# DONT DISPLAY UNLESS DSKY FLAG ON
		CAF	ZERO
		TCF	NODSPOUT
		CCS	NOUT
		TC	DSPOUTSB
		TCF	NODSPOUT	# NO DISPLAY REQUESTS

HANG20		CS	11,14,9
		ADS	DSRUPTSW

		CAF	20MRUPT

SETTIME4	TS	TIME4

## Page 136
# THE STATUS OF THE PROCEED PUSHBUTTON IS MONITORED EVERY 120 MILLISECONDS VIA THE CHANNEL 32 BIT 14 INBIT.
# THE STATE OF THIS INBIT IS COMPARED WITH ITS STATE DURING THE PREVIOUS T4RUPT AND IS PROCESSED AS FOLLOWS.
#	IF PREV ON AND NOW ON 	- BYPASS
#	IF PREV ON AND NOW OFF	- UPDATE IMODES33
#	IF PREV OFF AND NOW ON	- UPDATE IMODES33 AND PROCESS VIA PINBALL
#	IF PREV OFF AND NOW OFF	- BYPASS
# THE LOGIC EMPLOYED REQUIRES ONLY 9 MCT (APPROX. 108 MICROSECONDS) OF COMPUTER TIME WHEN NO CHANGES OCCUR.

PROCEEDE	CA	IMODES33	# MONITIOR FOR PROCEED BUTTON
		EXTEND
		RXOR	CHAN32		# CHECK IF BIT 14 DIFFERENT
		MASK	BIT14
		EXTEND
		BZF	T4JUMP		# NO CHANGE

		LXCH	IMODES33
		EXTEND
		RXOR	LCHAN
		TS	IMODES33	# UPDATE IMODES33
		MASK	BIT14
		CCS	A
		TCF	T4JUMP		# WAS ON - NOW OFF

		CAF	CHRPRIO		# WAS OFF - NOW ON
		TC	NOVAC
		EBANK=	DSPCOUNT
		2CADR	PROCKEY

## Page 137
# JUMP TO APPROPRIATE ONCE-PER SECOND (.96 SEC ACTUALLY) ACTIVITY

T4JUMP		INDEX	RUPTREG1
		TCF	+1

		TCF	OPTTEST
		TCF	OPTMON
		TCF	IMUMON
		TCF	RESUME
		TCF	OPTTEST
		TCF	OPTMON
		TCF	IMUMON
		TCF	RESUME

OPTTEST		TC	IBNKCALL
		CADR	OPTDRIVE

20MRUPT		=	OCT37776	# (DEC 16382)

NODSPOUT	EXTEND			# TURN OFF RELAYS
		WRITE	OUT0

		CAF	120MRUPT	# SET FOR NEXT CDRVE
		TCF	SETTIME4

QUIKDSP		CAF	BIT14
		MASK	DSRUPTSW
		EXTEND
		BZF	QUIKOFF		# WROTE LAST TIME, NOW TURN OFF RELAYS.

		CCS	NOUT
		TC	DSPOUTSB
		TCF	NODSPY		# NOUT=0 OR BAD RETURN FROM DSPOUTSB
		CS	BIT14		# GOOD RETURN (WE DISPLAYED SOMETHING)
QUIKRUPT	ADS	DSRUPTSW

		CAF	20MRUPT
		TS	TIME4

		CAF	BIT9
		ADS	DSRUPTSW

		TC	RESUME

NODSPY		EXTEND
		WRITE	OUT0

SYNCT4		CAF	20MRUPT
		ADS	TIME4

		CAF	BIT9
## Page 138
		ADS	DSRUPTSW
		CCS	DSRUPTSW
		TC	RESUME
OCT37737	OCT	37737
		TC	SYNCT4
		TC	RESUME

QUIKOFF		EXTEND
		WRITE	OUT0
		CAF	BIT14		# RESET DSRUPTSW TO SEND DISPLAY NEXT PASS
		TCF	QUIKRUPT

11,14,9		OCT	22400

## Page 139
# PROGRAM NAME:  IMUMON
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM IS ENTERED EVERY 480 MS.  IT DETECTS CHANGES OF THE IMU STATUS BITS IN
# CHANNEL 30 AND CALLS THE APPROPRIATE SUBROUTINES.  THE BITS PROCESSED AND THEIR RELEVANT SUBROUTINES ARE:
#
#	FUNCTION		BIT	SUBROUTINE CALLED
#	--------		---	-----------------
#	TEMP IN LIMITS		 15	TLIM
#	ISS TURN-ON REQUEST	 14	ITURNON
#	IMU FAIL		 13	IMUFAIL (SETISSW)
#	IMU CDU FAIL		 12	ICDUFAIL (SETISSW)
#	IMU CAGE		 11	IMUCAGE
#	IMU OPERATE		  9	IMUOP
#
# THE LAST SAMPLED STATE OF THESE BITS IS LEFT IN IMODES30.  ALSO, EACH SUBROUTINE CALLED FINDS THE NEW
# VALUE OF THE BIT IN A, WITH Q SET TO THE PROPER RETURN LOCATION, NXTIFAIL.
#
# CALLING SEQUENCE:  T4RUPT EVERY 480 MILLISECONDS.
#
# JOBS OR TASKS INITIATED:  NONE.
#
# SUBROUTINES CALLED:  TLIM, ITURNON, SETISSW, IMUCAGE, IMUOP.
#
# ERASABLE INITIALIZATION:
#	FRESH START OR RESTART WITH NO GROUPS ACTIVE:  C(IMODES30) = OCT 37411.
#	RESTART WITH ACTIVE GROUPS:	C(IMODES30) = (B(IMODES30)AND(OCT 00035)) PLUS OCT 37400.
#					THIS LEAVES IMU FAIL BITS INTACT.
#
# ALARMS:  NONE.
#
# EXIT:  TNONTEST.
#
# OUTPUT:  UPDATED IMODES30 WITH CHANGES PROCESSED BY APPROPRIATE SUBROUTINE.

IMUMON		CA	IMODES30	# SEE IF THERE HAS BEEN A CHANGE IN THE
		EXTEND			# RELEVANT BITS OF CHAN 30.
		RXOR	CHAN30		# CHECK IF BITS 9,11-15 CHANGED
		MASK	30RDMSK
		EXTEND
		BZF	TNONTEST	# NO CHANGE IN STATUS.

		TS	RUPTREG1	# SAVE BITS WHICH HAVE CHANGED.
		LXCH	IMODES30	# UPDATE IMODES30.
		EXTEND
		RXOR	LCHAN
		TS	IMODES30

		CS	ONE
		XCH	RUPTREG1
		EXTEND
## Page 140
		BZMF	TLIM		# CHANGE IN IMU TEMP.
		TCF	NXTIFBIT	# BEGIN BIT SCAN.

 -1		AD	ONE		# (RE-ENTERS HERE FROM NXTIFAIL.)
NXTIFBIT	INCR	RUPTREG1	# ADVANCE BIT POSITION NUMBER.
 +1		DOUBLE
 		TS	A		# SKIP IF OVERFLOW.
		TCF	NXTIFBIT	# LOOK FOR BIT.

		XCH	RUPTREG2	# SAVE OVERFLOW-CORRECTED DATA.
		INDEX	RUPTREG1	# SELECT NEW VALUE OF THIS BIT.
		CAF	BIT14
		MASK	IMODES30
		INDEX	RUPTREG1
		TC	IFAILJMP

NXTIFAIL	CCS	RUPTREG2	# PROCESS ANY ADDITIONAL CHANGES.
		TCF	NXTIFBIT -1

## Page 141
# PROGRAM NAME:  TNONTEST.
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM HONORS REQUESTS FOR ISS INITIALIZATION.  ISS TURN-ON (CHANNEL 30 BIT 14)
# AND ISS OPERATE (CHANNEL 30 BIT 9) REQUESTS ARE TREATED AS A PAIR AND PROCESSING TAKES PLACE .480 SECONDS
# AFTER EITHER ONE APPEARS.  THIS INITIALIZATION TAKES ON ONE OF THE FOLLOWING THREE FORMS:
#
#	1) ISS TURN-ON:  IN THIS SITUATION THE COMPUTER IS OPERATING WHEN THE ISS IS TURNED ON.  NOMINALLY,
#	BOTH ISS TURN-ON AND ISS OPERATE APPEAR.  THE PLATFORM IS CAGED FOR 90 SECONDS AND THE ICDU'S ZEROED
#	SO THAT AT THE END OF THE PROCESS THE GIMBAL LOCK MONITOR WILL FUNCTION PROPERLY.
#
#	2) ICDU INITIALIZATION:  IN THIS CASE THE COMPUTER WAS PROBABLY TURNED ON WITH THE ISS IN OPERATE OR
#	A FRESH START WAS DONE WITH THE ISS IN OPERATE.  IN THIS CASE ONLY ISS OPERATE IS ON.  THE ICDU'S ARE
#	ZEROED SO THE GIMBAL LOCK MONITOR WILL FUNCTION.  AN EXCEPTION IS IF THE ISS IS IN GIMBAL LOCK AFTER
#	A RESTART, THE ICDU'S WILL NOT BE ZEROED.
#
#	3) RESTART WITH RESTARTABLE PROGRAM USING THE IMU:  IN THIS CASE, NO INITIALIZATION TAKES PLACE SINCE
#	IT IS ASSUMED THAT THE USING PROGRAM DID THE INITIALIZATION AND THEREFORE T4RUPT SHOULD NOT INTERFERE.
#
# IMODES30 BIT 7 IS SET = 1 BY THE FIRST BIT (CHANNEL 30 BIT 14 OR 9) WHICH ARRIVES.  FOLLOWING THIS. TNONTEST IS
# ENTERED, FINDS BIT 7 = 1 BUT BIT 8 = 0, SO IT SETS BIT 8 = 1 AND EXITS.  THE NEXT TIME IT FINDS BIT 8 = 1 AND
# PROCEEDS, SETTING BITS 8 AND 7 = 0.  AT PROCTNON, IF ISS TURN-ON REQUEST IS PRESENT, THE ISS IS CAGED (ZERO +
# COARSE).  IF ISS OPERATE IS NOT PRESENT PROGRAM ALARM 00213 IS ISSUED.  AT THE END OF A 90 SECOND CAGE, BIT 2
# OF IMODES30 IS TESTED.  IF IT IS = 1, ISS TURN-ON WAS NOT PRESENT FOR THE ENTIRE 90 SECONDS.  IN THAT CASE, IF
# THE ISS TURN-ON REQUEST IS PRESENT THE 90 SECOND WAIT IS REPEATED,  OTHERWISE NO ACTION OCCURS UNLESS A PROGRAM
# WAS WAITING FOR THE INITIALIZATION IN WHICH CASE THE PROGRAM IS GIVEN AN IMUSTALL ERROR RETURN.  IF THE DELAY
# WENT PROPERLY, THE ISS DELAY OUTBIT IS SENT AND THE ICDU'S ZEROED.  A TASK IS INITIATED TO REMOVE THE PIPA FAIL
# INHIBIT BIT IN 10.24 SECONDS.  IF A MISSION PROGRAM WAS WAITING IT IS INFORMED VIA ENDIMU.
#
# AT PROCTNON, IF ONLY ISS OPERATE IS PRESENT (OPONLY), THE CDU'S ARE ZEROED UNLESS THE PLATFORM IS IN COARSE
# ALIGN (= GIMBAL LOCK HERE) OR A MISSION PROGRAM IS USING THE IMU (IMUSEFLG = 1).
#
# CALLING SEQUENCE:  T4RUPT EVERY 480 MILLISECONDS AFTER IMUMON.
#
# JOBS OR TASKS INITIATED:  1) ENDTNON, 90 SECONDS AFTER CAGING STARTED.  2) ISSUP, 4 SECONDS AFTER CAGING DONE.
#	3) PFAILOK, 10.24 SECONDS AFTER INITIALIZATION COMPLETED.  4) UNZ2, 320 MILLISECONDS AFTER ZEROING
#	STARTED.
#
# SUBROUTINES CALLED: CAGESUB, CAGESUB2, ZEROICDU, ENDIMU, IMUBAD, NOATTOFF, SETISSW, VARDELAY.
#
# ERASABLE INITIALIZATION:  SEE IMUMON.
#
# ALARMS:  PROGRAM ALARM 00213 IF ISS TURN-ON REQUESTED WITHOUT ISS OPERATE.
#
# EXIT:  ENDTNON EXITS TO C33TEST.  TASKS HAVING TO DO WITH INITIALIZATION EXIT AS FOLLOWS:  MISSION PROGRAM
# WAITING AND INITIALIZATION COMPLETE, EXIT TO ENDIMU, MISSION PROGRAM WAITING AND INITIALIZATION FAILED, EXIT TO
# IMUBAD, IMU NOT IN USE, EXIT TO TASKOVER.
#
# OUTPUT:  ISS INITIALIZED.

TNONTEST	CS	IMODES30	# AFTER PROCESSING ALL CHANGES, SEE IF IT
## Page 142
		MASK	BIT7		# IS TIME TO ACT ON A TURN-ON SEQUENCE.
		CCS	A
		TCF	C33TEST		# NO - EXAMINE CHANNEL 33.

		CAF	BIT8		# SEE IF FIRST SAMPLE OR SECOND.
		MASK	IMODES30
		CCS	A
		TCF	PROCTNON	# REACT AFTER SECOND SAMPLE.

		CAF	BIT8		# IF FIRST SAMPLE, SET BIT TO REACT NEXT
		ADS	IMODES30	# TIME.
		TCF	C33TEST

# PROCESS IMU TURN-ON REQUESTS AFTER WAITING 1 SAMPLE FOR ALL SIGNALS TO ARRIVE.

PROCTNON	CS	BITS7&8
		MASK	IMODES30
		TS	IMODES30
		MASK	BIT14		# SEE IF TURN-ON REQUEST.
		CCS	A
		TCF	OPONLY		# OPERATE ON ONLY.

		CS	IMODES30	# IF TURN-ON REQUEST, WE SHOULD HAVE IMU
		MASK	BIT9		# OPERATE.
		CCS	A
		TCF	+3

		TC	ALARM		# ALARM IF NOT.
		OCT	213

 +3		TC	CAGESUB

 		CAF	90SECS
		TC	WAITLIST
		EBANK=	CDUIND
		2CADR	ENDTNON

		TCF	C33TEST

RETNON		CAF	90SECS
		TC	VARDELAY

ENDTNON		CS	BIT2		# RESET TURN-ON REQUEST FAIL BIT.
		MASK	IMODES30
		XCH	IMODES30
		MASK	BIT2		# IF IT WAS OFF, SEND ISS DELAY COMPLETE.
		EXTEND
		BZF	ENDTNON2
## Page 143
		CAF	BIT14		# IF IT WAS ON AND TURN-ON REQUEST NOW
		MASK	IMODES30	# PRESENT, RE-ENTER 90 SEC DELAY IN WL.
		EXTEND
		BZF	RETNON

		CS	STATE		# IF IT IS NOT ON NOW, SEE IF A PROG WAS
		MASK	IMUSEFLG	# WAITING.
		CCS	A
		TCF	TASKOVER
		TC	POSTJUMP
		CADR	IMUBAD		# UNSUCCESSFUL TURN-ON.

ENDTNON2	CAF	BIT15		# SEND ISS DELAY COMPLETE.
		EXTEND
		WOR	CHAN12		# TURN OFF ISS DELAY COUNTER
		TC 	IBNKCALL	# TURN OFF NO ATT LAMP.
		CADR	NOATTOFF

UNZ2		TC	ZEROICDU

		CS	BITS4&5		# REMOVE ZERO AND COARSE.
		EXTEND
		WAND	CHAN12

		CAF	BIT11		# WAIT 10 SECS FOR CTRS TO FIND GIMBALS
		TC	VARDELAY

ISSUP		CS	OCT54		# REMOVE CAGING, IMU FAIL INHIBIT, AND
		MASK	IMODES30	# ICDUFAIL INHIBIT FLAGS.
		TS	IMODES30

		CS	BIT6		# ENABLE DAP
		MASK	IMODES33
		TS	IMODES33

		TC	SETISSW		# ISS WARNING MIGHT HAVE BEEN INHIBITED.

		CS	BIT15		# REMOVE IMU DELAY COMPLETE DISCRETE.
		EXTEND
		WAND	CHAN12

		CAF	4SECS		# DONT ENABLE PROG ALARM ON PIP FAIL FOR
		TC	WAITLIST	# ANOTHER 4 SECS.
		EBANK=	CDUIND
		2CADR	PFAILOK

		TCF	TASKOVER

OPONLY		CAF	BIT4
## Page 144
		EXTEND			# IF OPERATE ON ONLY AND WE ARE IN COARSE
		RAND	CHAN12		# ALIGN, DONT ZERO THE CDUS BECAUSE WE
		CCS	A		# MIGHT BE IN GIMBAL LOCK. USE V41N20 TO
		TCF	C33TEST		# RECOVER.

		CAF	IMUSEFLG	# OTHERWISE, ZERO THE COUNTERS
		MASK	STATE		# UNLESS SOMEONE IS USING THE IMU.
		CCS	A
		TCF	C33TEST

		TC	CAGESUB2	# SET TURNON FLAGS.

ISSZERO		TC	IBNKCALL	# TURN OFF NO ATT LAMP
		CADR	NOATTOFF	#     IMU CAGE OFF ENTRY

		CAF	BIT5		# ISS CDU ZERO
		EXTEND
		WOR	CHAN12

		TC	ZEROICDU
		CAF	BIT6		# WAIT 300 MS FOR AGS TO RECEIVE SIGNAL.
		TC	WAITLIST
		EBANK=	OPTMODES
		2CADR	UNZ2

		TCF	C33TEST

## Page 145
# PROGRAM NAME:  C33TEST
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM MONITORS THREE FLIP-FLOP INBITS OF CHANNEL 33 AND CALLS THE APPROPRIATE
# SUBROUTINE TO PROCESS A CHANGE.  IT IS ANALOGOUS TO IMUMON, WHICH MONITORS CHANNEL 30, EXCEPT THAT IT READS
# CHANNEL 33 WITH A WAND INSTRUCTION BECAUSE A 'WRITE' PULSE IS REQUIRED TO RESET THE FLIP-FLOPS.  THE BITS
# PROCESSED AND THE SUBROUTINES CALLED ARE:
#	BIT	FUNCTION		SUBROUTINE
#	---	--------		----------
#	 13	PIPA FAIL		PIPFAIL
#	 12	DOWNLINK TOO FAST	DNTMFAST
#	 11	UPLINK TOO FAST		UPTMFAST
#
# UPON ENTRY TO THE SUBROUTINE, THE NEW BIT STATE IS IN A.
#
# CALLING SEQUENCE:  EVERY 480 MILLISECONDS AFTER TNONTEST.
#
# JOBS OR TASKS INITIATED:  NONE.
#
# SUBROUTINES CALLED:  PIPFAIL, DNTMFAST AND UPTMFAST ON BIT CHANGES.
#
# ERASABLE INITIALIZATION:  C(IMODES33) = OCT 16000 ON A FRESH START OR RESTART, THEREFORE, THESE ALARMS WILL
# REAPPEAR IF THE CONDITIONS PERSIST.
#
# ALARMS:  NONE.
#
# EXIT:  GLOCKMON.
#
# OUTPUT:  UPDATED BITS 13, 12 AND 11 OF IMODES33 WITH CHANGES PROCESSED.

C33TEST		CA	IMODES33		# SEE IF RELEVANT CHAN33 BITS HAVE
		MASK	33RDMSK
		TS	L			# CHANGED.
		CAF	33RDMSK
		EXTEND
		WAND	CHAN33			# RESETS FLIP-FLOP INPUTS.
		EXTEND
		RXOR	LCHAN
		EXTEND
		BZF	GLOCKMON		# ON NO CHANGE.

		TS	RUPTREG1		# SAVE BITS WHICH HAVE CHANGED.
		LXCH	IMODES33
		EXTEND
		RXOR	LCHAN
		TS	IMODES33		# UPDATED IMODES33.

		CAF	ZERO
		XCH	RUPTREG1
		DOUBLE
## Page 146
		TCF	NXTIBT +1		# SCAN FOR BIT CHANGES.

 -1		AD	ONE
NXTIBT		INCR	RUPTREG1
 +1		DOUBLE
 		TS	A			# (CODING IDENTICAL TO CHAN 30).
		TCF	NXTIBT

		XCH	RUPTREG2
		INDEX	RUPTREG1		# GET NEW VALUE OF BIT WHICH CHANGED.
		CAF	BIT13
		MASK	IMODES33
		INDEX	RUPTREG1
		TC	C33JMP

NXTFL33		CCS	RUPTREG2		# PROCESS POSSIBLE ADDITIONAL CHANGES.
		TCF	NXTIBT -1

## Page 147
# PROGRAM NAME:  GLOCKMON
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM MONITORS THE CDUZ COUNTER TO DETERMINE WHETHER THE ISS IS IN GIMBAL LOCK
# AND TAKES ACTION IF IT IS.  THREE REGIONS OF MIDDLE GIMBAL ANGLE (MGA) ARE USED:
#
#	1) ABS(MGA) LESS THAN OR EQUAL TO 70 DEGREES - NORMAL MODE.
#	2) ABS(MGA) GREATER THAN 70 DEGREES AND LESS THAN OR EQUAL TO 85 DEGREES - GIMBAL LOCK LAMP TURNED ON.
#	3) ABS(MGA) GREATER THAN 85 DEGREES - ISS PUT IN COARSE ALIGN AND NO ATT LAMP TURNED ON.
#
# CALLING SEQUENCE:  EVERY 480 MILLISECONDS AFTER C33TEST.
#
# JOBS OR TASKS INITIATED:  NONE.
#
# SUBROUTINES CALLED:	1) SETCOARS WHEN ABS(MGA) GREATER THAN 85 DEGREES AND ISS NOT IN COARSE ALIGN.
#			2) LAMPTEST BEFORE TURNING OFF GIMBAL LOCK LAMP.
#
# ERASABLE INITIALIZATION:
#		1) FRESH START OR RESTART WITH NO GROUPS ACTIVE:  C(CDUZ) = 0, IMODES30 BIT 6 = 0, IMODES33 BIT 1 = 0.
#		2) RESTART WITH GROUPS ACTIVE:	SAME AS FRESH START EXCEPT C(CDUZ) NOT CHANGED SO GIMBAL MONITOR
#						PROCEEDS AS BEFORE.
#
# ALARMS:	1) MGA REGION (2) CAUSES GIMBAL LOCK LAMP TO BE LIT.
#		2) MGA REGION (3) CAUSES THE ISS TO BE PUT IN COARSE ALIGN AND THE NO ATT LAMP TO BE LIT IF EITHER NOT
#		   SO ALREADY.

GLOCKMON	CCS	CDUZ
		TCF	GLOCKCHK		# SEE IF MAGNITUDE OF MGA IS GREATER THAN
		TCF	SETGLOCK		# 70 DEGREES.
		TCF	GLOCKCHK
		TCF	SETGLOCK

GLOCKCHK	AD	-70DEGS
		EXTEND
		BZMF	SETGLOCK -1		# NO LOCK.

		AD	-15DEGS			# SEE IF ABS(MGA) GREATER THAN 85 DEGS.
		EXTEND
		BZMF	NOGIMRUN

		CAF	BIT4			# IF SO, SYSTEM SHOULD BE IN COARSE ALIGN
		EXTEND				# TO PREVENT GIMBAL RUN-AWAY.
		RAND	CHAN12
		CCS	A
		TCF	NOGIMRUN

		TC	IBNKCALL		# GO INTO COARSE ALIGN.
		CADR	SETCOARS

		CAF	SIX			# ENABLE ISS ERROR COUNTERS IN 60 MS
		TC	WAITLIST
## Page 148
		EBANK=	CDUIND
		2CADR	CA+ECE

NOGIMRUN	CAF	BIT6			# TURN ON GIMBAL LOCK LAMP.
		TCF	SETGLOCK

 -1		CAF	ZERO
SETGLOCK	AD	DSPTAB +11D		# SEE IF PRESENT STATE OF GIMBAL LOCK LAMP
		MASK	BIT6			# AGREES WITH DESIRED STATE BY HALF ADDING
		EXTEND				# THE TWO.
		BZF	GLOCKOK			# OK AS IS.

		MASK	DSPTAB +11D		# IF OFF, DONT TURN ON IF IMU BEING CAGED.
		CCS	A
		TCF	GLAMPTST		# TURN OFF UNLESS LAMP TEST IN PROGRESS.

		CAF	BIT6
		MASK	IMODES30
		CCS	A
		TCF	GLOCKOK

GLINVERT	CS	DSPTAB +11D		# INVERT GIMBAL LOCK LAMP.
		MASK	BIT6
		AD	BIT15			# TO INDICATE CHANGE IN DSPTAB +11D.
		XCH	DSPTAB +11D
		MASK	OCT37737
		ADS	DSPTAB +11D
		TCF	GLOCKOK

GLAMPTST	TC	LAMPTEST		# TURN OFF UNLESS LAMP TEST IN PROGRESS.
		TCF	GLOCKOK
		TCF	GLINVERT

-70DEGS		DEC	-.38888			# -70 DEGREES SCALED IN HALF-REVOLUTIONS.
-15DEGS		DEC	-.08333

## Page 149
# PROGRAM NAME:  TLIM.
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM MAINTAINS THE TEMP LAMP (BIT 4 OF CHANNEL 11) ON THE DSKY TO AGREE WITH
# THE TEMP SIGNAL FROM THE ISS (BIT 15 OF CHANNEL 30).  HOWEVER, THE LIGHT WILL NOT BE TURNED OFF IF A LAMP TEST
# IS IN PROGRESS.
#
# CALLING SEQUENCE:  CALLED BY IMUMON ON A CHANGE OF BIT 15 OF CHANNEL 30.
#
# JOBS OR TASKS INITIATED:  NONE.
#
# SUBROUTINES CALLED:  LAMPTEST.
#
# ERASABLE INITIALIZATION:  FRESH START AND RESTART TURN THE TEMP LAMP OFF.
#
# ALARMS:  TEMP LAMP TURNED ON WHEN IMU TEMP GOES OUT OF LIMITS.
#
# EXIT:  NXTIFAIL.
#
# OUTPUT:  SERVICE OF TEMP LAMP.		  IN A, EXCEPT FOR TLIM.

TLIM		MASK	POSMAX			# REMOVE BIT FROM WORD OF CHANGES AND SET
		TS	RUPTREG2		# DSKY TEMP LAMP ACCORDINGLY.

		CCS	IMODES30
		TCF	TEMPOK
		TCF	TEMPOK

		CAF	BIT4			# TURN ON LAMP.
		EXTEND
		WOR	DSALMOUT
		TCF	NXTIFAIL

TEMPOK		TC	LAMPTEST		# IF TEMP NOW OK, DONT TURN OFF LAMP IF
		TCF	NXTIFAIL		# LAMP TEST IN PROGRESS.

		CS	BIT4
		EXTEND
		WAND	DSALMOUT		# TURN OFF TEMP CAUTION
		TCF	NXTIFAIL

## Page 150
# PROGRAM NAME:  ITURNON.
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM IS CALLED BY IMUMON WHEN A CHANGE OF BIT 14 OF CHANNEL 30 (ISS TURN-ON
# REQUEST) IS DETECTED.  UPON ENTRY, ITURNON CHECKS IF A TURN-ON DELAY SEQUENCE HAS FAILED, AND IF SO, IT EXITS.
# IF NOT, IT CHECKS WHETHER THE TURN-ON REQUEST CHANGE IS TO ON OR OFF.  IF ON, IT SETS BIT 7 OF IMODES30 TO 1 SO
# THAT TNONTEST WILL INITIATE THE ISS INITIALIZATION SEQUENCE.  IF OFF, THE TURN-ON DELAY SIGNAL, CHANNEL 12 BIT
# 15, IS CHECKED AND IF IT IS ON, ITURNON EXITS.  IF THE DELAY SIGNAL IS OFF, PROGRAM ALARM 00207 IS ISSUED, BIT 2
# OF IMODES30 IS SET TO 1 AND THE PROGRAM EXITS.
#
# THE SETTING OF BIT 2 OF IMODES30 (ISS DELAY SEQUENCE FAIL) INHIBITS THIS ROUTINE AND IMUOP FROM
# PROCESSING ANY CHANGES.  THIS BIT WILL BE RESET BY THE ENDTNON ROUTINE WHEN THE CURRENT 90 SECOND DELAY PERIOD
# ENDS.
#
# CALLING SEQUENCE:  FROM IMUMOM WHEN ISS TURN-ON REQUEST CHANGES STATE.
#
# JOBS OR TASKS INITIATED:  NONE.
#
# SUBROUTINES CALLED:  ALARM, IF THE ISS TURN-ON REQUEST IS NOT PRESENT FOR 90 SECONDS.
#
# ERASABLE INITIALIZATION:  FRESH START AND RESTART SET BIT 15 OF CHANNEL 12 AND BITS 2 AND 7 OF IMODES30 TO 0,
# AND BIT 14 OF IMODES30 TO 1.
#
# ALARMS: PROGRAM ALARM 00207 IS ISSUED IF THE ISS TURN-ON REQUEST SIGNAL IS NOT PRESENT FOR 90 SECONDS.
#
# EXIT:  NXTIFAIL.
#
# OUTPUT:  BIT 7 OF IMODES30 TO START ISS INITIALIZATION, OR BIT 2 OF IMODES30 AND PROGRAM ALARM 00207 TO INDICATE
# A FAILED TURN-ON SEQUENCE.

ITURNON		CAF	BIT2		# IF DELAY REQUEST HAS GONE OFF
		MASK	IMODES30	# PREMATURELY, DO NOT PROCESS ANY CHANGES
		CCS	A		# UNTIL THE CURRENT 90 SEC WAIT EXPIRES.
		TCF	NXTIFAIL

		CAF	BIT14		# SEE IF JUST ON OR OFF.
		MASK 	IMODES30
		EXTEND
		BZF	ITURNON2	# IF JUST ON.

		CAF	BIT15
		EXTEND			# SEE IF DELAY PRESENT DISCRETE HAS BEEN
		RAND	CHAN12		# SENT.  IF SO, ACTION COMPLETE.
		EXTEND
		BZF	+2
		TCF	NXTIFAIL

		CAF	BIT2		# IF NOT, SET BIT TO INDICATE REQUEST NOT
		ADS	IMODES30	# PRESENT FOR FULL DURATION.
		TC	ALARM
		OCT	207
		TCF	NXTIFAIL

## Page 151
ITURNON2	CS	IMODES30	# SET BIT7 TO INDICATE WAIT OF 1 SAMPLE
		MASK	BIT7
		ADS	IMODES30
		TCF	NXTIFAIL

## Page 152
# PROGRAM NAME:  IMUCAGE.
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM PROCESSES CHANGES OF THE IMUCAGE INBIT, CHANNEL 30 BIT 11.  IF THE BIT
# CHANGES TO 0 (CAGE BUTTON PRESSED), THE ISS IS CAGED (ICDU ZERO + COARSE ALIGN + NO ATT LAMP) UNTIL THE
# ASTRONAUT SELECTS ANOTHER PROGRAM TO ALIGN THE ISS.  ANY PULSE TRAINS TO THE ICDU'S AND GYRO'S ARE TERMINATED,
# THE ASSOCIATED OUTCOUNTERS ARE ZEROED AND THE GYRO'S ARE DE-SELECTED.  NO ACTION OCCURS WHEN THE BUTTON IS
# RELEASED (INBIT CHANGES TO 1).
#
# CALLING SEQUENCE:  BY IMUMON WHEN IMU CAGE BIT CHANGES.
#
# JOBS OR TASKS INITIATED:  NONE.
#
# SUBROUTINES CALLED:  CAGESUB.
#
# ERASABLE INITIALIZATION:  FRESH START AND RESTART SET BIT 11 OF IMODES30 TO 1.
#
# ALARMS: NONE.
#
# EXIT:  NXTIFAIL.
#
# OUTPUT:  ISS CAGED, COUNTERS ZEROED, PULSE TRAINS TERMINATED AND NO ATT LAMP LIT.

IMUCAGE		CCS	A		# NO ACTION IF GOING OFF.
		TCF	ISSZERO
		CS	OCT77000	# TERMINATE ICDU, OPTICS, GYRO PULSE TRAINS
		EXTEND
		WAND	CHAN14

		CS	OCT272		# KNOCK DOWN TVC ENABLE, IMU ERROR COUNTER
		EXTEND			#   ENABLE, ZERO ICDU, COARSE ALIGN
		WAND	CHAN12		#   ENABLE, OPTICS ERR CNTR ENABLE

		CS	BIT13		# TURN OFF ENGINE
		EXTEND
		WAND	DSALMOUT

		TC	CAGESUB1

		TC	IBNKCALL	# KNOCK DOWN TRACK, REFSMMAT, DRIFT FLAGS
		CADR	RNDREFDR

		CS	ZERO		# ZERO COMMAND OUT-COUNTERS
		TS	CDUXCMD
		TS	CDUYCMD
		TS	CDUZCMD
		TS	GYROCMD

		CS	OCT740		# HAVING WAITED AT LEAST 27 MCT FROM
		EXTEND			# GYRO PULSE TRAIN TERMINATION, WE CAN
		WAND	CHAN14		# DE-SELECT THE GYROS.
## Page 153
		TCF	NXTIFAIL

## Page 154
# PROGRAM NAME:  IMUOP.
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM PROCESSES CHANGES IN THE ISS OPERATE DISCRETE, BIT 9 OF CHANNEL 30.
# IF THE INBIT CHANGES TO 0, INDICATING ISS ON, IMUOP GENERALLY SETS BIT 7 OF IMODES30 TO 1 TO REQUEST ISS
# INITIALIZATION VIA TNONTEST.  AN EXCEPTION IS DURING A FAILED ISS DELAY DURING WHICH BIT 2 OF IMODES30 IS SET
# TO 1 AND NO FURTHER INITIALIZATION IS REQUIRED.  WHEN THE INBIT CHANGES TO 1, INDICATING ISS OFF, IMUSEFLG IS
# TESTED TO SEE IF ANY PROGRAM WAS USING THE ISS.  IF SO, PROGRAM ALARM 00214 IS ISSUED.
#
# CALLING SEQUENCE:  BY IMUMON WHEN BIT 9 OF CHANNEL 30 CHANGES.
#
# JOBS OR TASKS INITIATED:  NONE.
#
# SUBROUTINES CALLED:  ALARM, IF ISS IS TURNED OFF WHILE IN USE.
#
# ERASABLE INITIALIZATION:  ON FRESH START AND RESTART, BIT 9 OF IMODES30 IS SET TO 1 EXCEPT WHEN THE GIMBAL LOCK
# LAMP IS ON, IN WHICH CASE IT IS SET TO 0.  THIS PREVENTS ICDU ZERO BY TNONTEST WITH THE ISS IN GIMBAL LOCK.
#
# ALARMS:  PROGRAM ALARM 00214 IF THE ISS IS TURNED OFF WHILE IN USE.
#
# EXIT:  NXTIFAIL.
#
# OUTPUT:  ISS INITIALIZATION REQUEST (IMODES30 BIT 7) OR PROGRAM ALARM 00214.

IMUOP		EXTEND				# IF OPERATE JUST ON, WAIT 1 SAMPLE.
		BZF	IMUOP2

		CS	IMODES33		# DISABLE DAP
		MASK	BIT6
		ADS	IMODES33

		TC	IBNKCALL		# KNOCK DOWN TRACK, REFSMMAT, DRIFT FLAGS
		CADR	RNDREFDR

		CS	BITS7&8			# KNOCK DOWN RENDEVOUS, IMUUSE FLAGS
		MASK	STATE
		XCH	STATE			# IF GOING OFF, ALARM IF PROG USING IMU
		COM
		MASK	IMUSEFLG
		CCS	A
		TCF	NXTIFAIL

		TC	ALARM
		OCT	214
		TCF	NXTIFAIL

IMUOP2		CAF	BIT2			# SEE IF FAILED ISS TURN-ON SEQ IN PROG.
		MASK	IMODES30
		CCS	A
		TCF	NXTIFAIL		# IF SO, DONT PROCESS UNTIL PRESENT 90
		TCF	ITURNON2		# SECONDS EXPIRES.

## Page 155
# PROGRAM NAME:  PIPFAIL
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM PROCESSES CHANGES OF BIT 13 OF CHANNEL 33, PIPA FAIL.  IT SETS BIT 10 OF
# IMODES30 TO AGREE.  IT CALLS SETISSW IN CASE A PIPA FAIL NECESSITATES AN ISS WARNING.  IF NOT, I.E., IMODES30
# BIT 1 = 1, AND A PIPA FAIL IS PRESENT AND THE ISS IS NOT BEING INITIALIZED, PROGRAM ALARM 00212 IS ISSUED.
#
# CALLING SEQUENCE:  BY C33TEST ON CHANGES OF CHANNEL 33 BIT 13.
#
# JOBS OR TASKS INITIATED:  NONE.
#
# SUBROUTINES CALLED:  1) SETISSW, AND 2) ALARM (SEE FUNCTIONAL DESCRIPTION).
#
# ERASABLE INITIALIZATION:  SEE IMUMON FOR INITIALIZATION OF IMODES30.  THE RELAVANT BITS ARE 5, 7, 8, 9, AND 10.
#
# ALARMS:  PROGRAM ALARM 00212 IF PIPA FAIL IS PRESENT BUT NEITHER ISS WARNING IS TO BE ISSUED NOR THE ISS IS
# BEING INITIALIZED.
#
# EXIT:  NXTFL33.
#
# OUTPUT:  PROGRAM ALARM 00212 AND ISS WARNING MAINTENANCE.

PIPFAIL		CCS	A			# SET BIT10 IN IMODES30 SO ALL ISS WARNING
		CAF	BIT10			# INFO IS IN ONE REGISTER.
		XCH	IMODES30
		MASK	-BIT10
		ADS	IMODES30

		TC	SETISSW

		CS	IMODES30		# IF PIP FAIL DOESNT LIGHT ISS WARNING, DO
		MASK	BIT1			# A PROGRAM ALARM IF IMU OPERATING BUT NOT
		CCS	A			# CAGED OR BEING TURNED ON.
		TCF	NXTFL33

		CA	IMODES30
		MASK	OCT1720
		CCS	A
		TCF	NXTFL33			# ABOVE CONDITION NOT MET.

		TC	ALARM
		OCT	212
		TCF	NXTFL33

## Page 156
# PROGRAM NAMES:  DNTMFAST, UPTMFAST
#
# FUNCTIONAL DESCRIPTION:  THESE PROGRAMS PROCESS CHANGES OF BITS 12 AND 11 OF CHANNEL 33.  IF A BIT CHANGES TO A
# 0, A PROGRAM ALARM IS ISSUED.  THE ALARMS ARE:
#
#	BIT	ALARM	CAUSE
#	---	-----	-----
#	 12	01105	DOWNLINK TOO FAST
#	 11	01106	UPLINK TOO FAST
#
# CALLING SEQUENCE:  BY C33TEST ON A BIT CHANGE.
#
# SUBROUTINES CALLED:  ALARM, IF A BIT CHANGES TO A 0.
#
# ERASABLE INITIALIZATION:  FRESH START OR RESTART, BITS 12 AND 11 OF IMODES33 ARE SET TO 1.
#
# ALARMS:  SEE FUNCTIONAL DESCRIPTION.
#
# EXIT:  NXTFL33.
#
# OUTPUT:  PROGRAM ALARM ON A BIT CHANGE TO 0.

DNTMFAST	CCS	A			# DO PROG ALARM IF TM TOO FAST.
		TCF	NXTFL33

		TC	ALARM
		OCT	1105
		TCF	NXTFL33

UPTMFAST	CCS	A			# SAME AS DNLINK TOO FAST WITH DIFFERENT
		TCF	NXTFL33			# ALARM CODE.

		TC	ALARM
		OCT	1106
		TCF	NXTFL33

## Page 157
# PROGRAM NAME:  SETISSW
#
# FUNCTIONAL DESCRIPTION:  THIS PROGRAM TURNS THE ISS WARNING LAMP ON AND OFF (CHANNEL 11 BIT 1 = 1 FOR ON,
# 0 FOR OFF) DEPENDING ON THE STATUS OF IMODES30 BITS 13 (IMU FAIL) AND 4 (INHIBIT IMU FAIL), 12 (ICDU FAIL) AND
# 3 (INHIBIT ICDU FAIL), AND 10 (PIPA FAIL) AND 1 (INHIBIT PIPA FAIL).  THE LAMP IS LEFT ON IF A LAMP TEST IS IN
# PROGRESS.
#
# CALLING SEQUENCE:  CALLED BY IMUMON ON CHANGES TO IMU FAIL AND ICDU FAIL.  CALLED BY IFAILOK AND PFAILOK UPON
# REMOVAL OF THE FAIL INHIBITS.  CALLED BY PIPFAIL WHEN THE PIPA FAIL DISCRETE CHANGES.  IT IS CALLED BY PIPUSE
# SINCE THE PIPA FAIL PROGRAM ALARM MAY NECESSITATE AN ISS WARNING, AND LIKEWISE BY PIPFREE WHEN THE ALARM DEPARTS
# AND IT IS CALLED BY IMUZERO3 AND ISSUP AFTER THE FAIL INHIBITS HAVE BEEN REMOVED.
#
# JOBS OR TASKS INITIATED:  NONE.
#
# SUBROUTINES CALLED:  NONE.
#
# ERASABLE INITIALIZATION:
#
#	1) IMODES30 - SEE IMUMON.
#	2) IMODES33 BIT 1 = 0 (LAMP TEST NOT IN PROGRESS).
#
# ALARMS:  ISS WARNING.
#
# EXIT: VIA Q.
#
# OUTPUT: ISS WARNING LAMP SET PROPERLY.

SETISSW		CAF	OCT15			# SET ISS WARNING USING THE FAIL BITS IN
		MASK	IMODES30		# BITS 13, 12, AND 10 OF IMODES30 AND THE
		EXTEND				# FAILURE INHIBIT BITS IN POSITIONS
		MP	BIT10			# 4, 3, AND 1.
		CA	IMODES30
		EXTEND
		ROR	LCHAN			# 0 INDICATES FAILURE.
		COM
		MASK	OCT15000
		CCS	A
		TCF	ISSWON			# FAILURE.

ISSWOFF		CAF	BIT1			# DONT TURN OFF ISS WARNING IF LAMP TEST
		MASK	IMODES33		# IN PROGRESS.
		CCS	A
		TC	Q

		CS	BIT1
		EXTEND
		WAND	DSALMOUT		# TURN OFF ISS WARNING
		TC	Q

ISSWON		EXTEND
## Page 158
		QXCH	ITEMP6
		TC	VARALARM		# TELL EVERYONE WHAT CAUSED THE ISS WARNING
		CAF	BIT1
		EXTEND
		WOR	DSALMOUT		# TURN ON ISS WARNING
		TC	ITEMP6

CAGESUB		CS	BIT15+6			# SET OUTBITS + INTERNAL FLAGS FOR
		EXTEND				# SYSTEM TURN-ON OR CAGE.  DISABLE THE
		WAND	CHAN12			# ERROR COUNTER AND REMOVE IMU DELAY COMP.
		CAF	BITS4&5			# SEND ZERO AND COARSE.
		EXTEND
		WOR	CHAN12

CAGESUB1	CS	DSPTAB +11D		# TURN ON NO ATT LAMP
		MASK	OC40010
		ADS	DSPTAB +11D

CAGESUB2	CS	IMODES30		# SET FLAGS TO INDICATE CAGING OR TURN-ON
		MASK	OCT75			# AND INHIBIT ALL ISS WARNING INFO
		ADS	IMODES30

		CS	IMODES33		# DISABLE DAP AUTO AND HOLD MODES
		MASK	BIT6
		ADS	IMODES33

		TC	Q

IMUFAIL		EQUALS	SETISSW
ICDUFAIL	EQUALS	SETISSW

## Page 159
# JUMP TABLES AND CONSTANTS.

IFAILJMP	TCF	ITURNON			# CHANNEL 30 DISPATCH.
		TCF	IMUFAIL
		TCF	ICDUFAIL
		TCF	IMUCAGE
30RDMSK		OCT	76400			# (BIT 10 NOT SAMPLED HERE).
		TCF	IMUOP

C33JMP		TCF	PIPFAIL			# CHANNEL 33 DISPATCH.
		TCF	DNTMFAST
		TCF	UPTMFAST

# SUBROUTINE TO SKIP IF LAMP TEST NOT IN PROGRESS.

LAMPTEST	CS	IMODES33		# BIT 1 OF IMODES33 = 1 IF LAMP TEST IN
		MASK	BIT1			# PROGRESS.
		TCF	ZOPFIN3

33RDMSK		EQUALS	PRIO16
OC40010		OCT	40010
OCT54		OCT	54
OCT75		OCT	75
OCT272		OCT	00272
BITS7&8		OCT	300
OCT1720		OCT	1720
OCT740		OCT	00740
OCT15000	EQUALS	PRIO15
OCT77000	OCT	77000
-BIT10		OCT	-1000

90SECS		DEC	9000
120MS		=	OCT14			# (DEC12)
GLOCKOK		EQUALS	RESUME

## Page 160
# OPTICS MONITORING AND ZERO ROUTINES
OPTMON		CA	OPTMODES		# MONITOR OPTICS INBITS IN CHAN 30 AND 33
		EXTEND
		RXOR	CHAN30			# LOOK FOR OCDU FAIL BIT CHANGE
		MASK	BIT7
		TS	RUPTREG1		# STORE CHANGE BIT
		CCS	A
		TC	OCDUFTST		# PROCESS OCDUFAIL BIT CHANGE

33OPTMON	CCS	OPTIND			# BYPASS IF TVC TAKEOVER
		TCF	+4
		TCF	+3
		TCF	+2
		TCF	RESUME

		CA	OPTMODES		# LOOK FOR OPTICS MODE SWITCH CHANGE
		EXTEND
		RXOR	CHAN33
		MASK	OCTHIRTY
		ADS	RUPTREG1		# STORE INBIT CHANGES
		LXCH	OPTMODES
		EXTEND
		RXOR	LCHAN
		TS	OPTMODES		# UPDATE OPTMODES TO SHOW BIT CHANGES

		COM				# SAMPLE CURRENT SWITCH SETTING
		MASK	OCTHIRTY
		EXTEND
		BZF	SETSAMP			# MANUAL-SET ZERO IN SWSAMPLE

		MASK	BIT5			# SEE IF CSC
		CCS	A
		TC	+2			# CSC-SET SWSAMPLE POS
		CAF	NEGONE			# ZOPTICS-SET SWSAMPLE (-1)
SETSAMP		TS	SWSAMPLE		# CURRENT OPTICS SWITCH SETTING

PROCESSW	CCS	DESOPMOD		# BRANCH ON PREVIOUS SETTING
		TC	CSCDES			# CSC
		TC	MANUDES			# MANUAL
		TC	ZOPTDES			# ZERO OPTICS
## Page 161
ZOPTDES		CCS	SWSAMPLE		# IS SWITCH STILL AT ZOPTICS
		TC	ZTOCSC			# NOW AT CSC
		TC	ZTOMAN			# MANUAL
		TC	ZOPFINI			# ZOPTICS-SEE IF ZOPT PROCESSING
		TC	SETDESMD		# ZOPT NOT PROCESSING-NO ACTION

		CCS	ZOPTCNT			# ZOPT PROCESSING-CHECK COUNTER
		TC	SETCNT			# 32 SAMPLE NOT FINISHED-SET COUNTER
		TC	SETZOEND		# 32 SAMPLE WAIT COMPLETED-SET UP ZOP END

ZTOMAN		TC	ZOPFINI			# ZOP TO MANUAL-IS ZOPT DONE
		TC	SETDESMD		# YES-NORMAL EXIT

ZOPALARM	TC	ALARM			# ALARM-SWITCHED ALTERED WHILE ZOPTICS
		OCT	00116
		CAF	OCT13			# PROCESSING-SET RETURN OPTION
		TS	WTOPTION

		TC	CANZOPT			# CANCEL ZOPT

		TC	SETDESMD

ZTOCSC		TC	ZOPFINI			# SEE IF ZOPT PROCESSING
		TC	MANTOCSC +3		# NO-CHECK RETURN TO COARS OPT
		TC	ALARM			# ZOPT PROCESSING-ALARM
		OCT	00116
		TC	CANZOPT			# CANCEL ZOPT
		TC	MANTOCSC		# ZERO CNT-LOOK FOR COARS OPT RETURN

COARSLOK	CAF	BIT9			# IF COARS OPT SINCE FSTART GO TO L+2
		TCF	ZOPFIN2			# IF NOT GO TO L+1
ZOPFINI		CAF	BIT1			# SEE IF END ZOPT TASK WORKING
		MASK	OPTMODES
		CCS	A
		TC	RESUME			# ZOPT TASK WORKING-WAIT ONE SAMPLE PERIOD

		CAF	BIT3			# TEST IF ZOPTICS PROCESSING
ZOPFIN2		MASK	OPTMODES		# RETURNS TO L+1 PROCESSING AND
ZOPFIN3		CCS	A
		INCR	Q			# L+2 IF NOT
		TC	Q

CANZOPT		CS	SIX			# CANCEL ZERO OPTICS
		MASK	OPTMODES		# ZERO ZOPT PROCESSING BIT-ENABLE OCDUFAIL
		TS	OPTMODES
		CS	BIT1			# MAKE SURE ZERO OCDU IS OFF
		EXTEND
		WAND	CHAN12
		TC	Q

## Page 162
MANUDES		CCS	SWSAMPLE		# SEE IF SWITCH STILL IN MANUAL MODE
		TC	MANTOCSC		# NOW AT CSC
		TC	MANTOMAN		# STILL MANUAL
		CCS	WTOPTION		# ZOPTICS-LOOK AT ZOPTICS RETURN OPTION
		TC	+2			# 5 SEC RETURN GOOD-CONTINUE ZOPTICS
		TC	OPTZERO			# ZOPTICS MUST START ANEW

		TC	INITZOPT		# SHOW ZERO OPTICS PROCESSING
		TC	SETDESMD		# NORMAL EXIT

MANTOMAN	CCS	WTOPTION		# DECREMENT RETURN OPTION TIME
		TS	WTOPTION
		TC	SETDESMD

MANTOCSC	CAF	ZERO			# CANCEL ZOPT RETURN OPTION IF SET
		TS	WTOPTION
		TS	ZOPTCNT

		TC	COARSLOK		# CHECK FOR COARS OPT RETURN
		TC	SETDESMD		# NO COARS TASK-NO ACTION

		CAF	ONE			# SET COARS OPT WORKING
		TS	OPTIND
		CAF	BIT2			# ENABLE OPTICS CDU ERROR CNTS
		EXTEND
		WOR	CHAN12

		TC	SETDESMD

CSCDES		CCS	SWSAMPLE		# SEE IF SWITCH STILL AT CSC
		TC	SETDESMD		# STILL AT CSC
		TC	CSCTOMAN		# MANUAL
CSCTOZOP	CAF	OCT40			# ZOPTICS-INITIALIZE FOR ZOPT
		TS	ZOPTCNT
		TC	INITZOPT

CSCTOMAN	CCS	OPTIND			# SEE IF COARS WORKING
		TC	CANCOARS		# COARS WORKING-SWITCH NOT CSC-KILL COARS
		TC	CANCOARS
		TC	+1			# NO COARS-NORMAL EXIT
		TC	SETDESMD
## Page 163
CANCOARS	CA	NEGONE
		TS	OPTIND			# SET OPTIND (-1) TO SHOW NOT WORKING
		CS	BIT2			# DISABLE OCDU ERR CNTS
		EXTEND
		WAND	CHAN12
		CS	OPTMODES		# SET RETURN-TO-COARS BIT
		MASK	BIT9
		ADS	OPTMODES

		TC	SETDESMD
OPTZERO		TC	INITZOPT		# INITIALIZE ZERO OPTICS

		CA	OCT40			# SET UP 32 SAMPLE WAIT
SETCNT		TS	ZOPTCNT
SETDESMD	CA	SWSAMPLE		# SET CURRENT SWITCH INDICATION-RESUME
		TS	DESOPMOD
		TC	RESUME

SETZOEND	CAF	BIT1			# SEND ZERO OPTICS CDU
		EXTEND
		WOR	CHAN12
		CA	200MS			# HOLD ZERO CDU FOR 200 MS
		TC	WAITLIST
		EBANK=	OPTMODES
		2CADR	ENDZOPT

		CS	OPTMODES		# SHOW ZOPTICS TASK WORKING
		MASK	BIT1
		ADS	OPTMODES

		TC	SETDESMD

ENDZOPT		TC	ZEROPCDU		# ZERO OCDU COUNTERS
		CS	BIT1			# TURN OFF ZERO OCDU
		EXTEND
		WAND	CHAN12
		CAF	200MS			# DELAY 200MS FOR CDUS TO RESYNCHRONIZE
		TC	VARDELAY

		CS	OPTMODES		# SHOW ZOPTICS SINCE LAST FRESH START
		MASK	BIT10			#	OR RESTART
		ADS	OPTMODES

		CS	SEVEN			# ENABLE OCDUFAIL-SHOW OPTICS COMPLETE
		MASK	OPTMODES
		TS	OPTMODES

		TC	OCDUFTST		# CHECK OCDU FAIL BIT AFTER ENABLE
## Page 164
		TC	TASKOVER

ZEROPCDU	CAF	ZERO
		TS	CDUS			# ZERO IN CDUS,-20 IN CDUT
		TS	ZONE			# INITIALIZE SHAFT MONITOR ZONE
		CS	20DEGS
		TS	CDUT
		TC	Q

INITZOPT	CAF	ZERO			# INITIALIZE ZOPTICS-INHIBIT OCDUFAIL
		TS	WTOPTION		# AND SHOW OPTICS PROCESSING
		CS	OPTMODES		# SET ZERO OPTICS PROCESSING
		MASK	SIX			#	OPTICS CDU FAIL INHIBITED
		ADS	OPTMODES
		TC	Q

## Page 165
OCDUFTST	CAF	BIT7			# SEE IF OCDUFAIL ON OR OFF
		EXTEND
		RAND	CHAN30
		CCS	A
		TCF	OPFAILOF		# OCDUFAIL LIGHT OFF

		CAF	BIT2			# OCDUFAIL LIGHT ON UNLESS INHIBITED
		MASK	OPTMODES
		CCS	A
		TC	Q			# OCDUFAIL INHIBITED

OPFAILON	CAF	BIT8			# ON BIT
		AD	DSPTAB	+11D
		MASK	BIT8
SETOFF		EXTEND
		BZF	TCQ			# NO CHANGE

		TS	L
		CA	DSPTAB	+11D
		EXTEND
		RXOR	LCHAN
		MASK	POSMAX
		AD	BIT15			# SHOW ACTION WANTED
		TS	DSPTAB	+11D
		TC	Q

OPFAILOF	CAF	BIT1			# DONT TURN OFF IF LAMP TEST
		MASK	IMODES33
		CCS	A
		TC	Q			# LAMP TEST IN PROGRESS

		CAF	BIT8			# TURN OFF OCDUFAIL LIGHT
		MASK	DSPTAB	+11D
		TCF	SETOFF

OCT13		=	ELEVEN
OCTHIRTY	EQUALS	BITS4&5
20DEGS		DEC	7199
OCT40		EQUALS	BIT6
200MS		EQUALS	OCT24

## Page 166
# OPTICS CDU DRIVING PROGRAM

		BANK	10
		SETLOC	OPTDRV
		BANK
		COUNT*	$$/SXT

# SHAFT STOP MONITOR-ZONE UPDATE

OPTDRIVE	CA	CDUS			# GRAB OPTIC SHAFT CDU
		TS	L
		CCS	A			# GET ABS(CDUS)
		AD	13,14,15
		TCF	+2			# ABS(CDUS) - 45 DEG
		TCF	-2
		EXTEND
		BZMF	OZONE			# LESS THAN 45 DEG-SET ZONE 0
		CA	ZONE			# IF ZONE ZERO, CHANGE TO + OR - OTHERWISE
		EXTEND				# DONT MESS WITH ZONE
		BZF	+2
		TCF	CONTDRVE		# JUST CONTINUE
		XCH	L			# GREATER THAN 45 DEG-SET ZONE TO SIGN CDU
		TCF	OZONE	+1
OZONE		CAF	ZERO			# ABS(CDUS) LESS THEN 90 DEG-ZONE ZERO
		TS	ZONE
		COUNT*	$$/T4RUPT
CONTDRVE	CCS	OPTIND
		TC	+4			# WORK COARS OPTICS
		TC	+3			# WORK COARS OPTICS
		TC	RESUME			# NO OPT
		TC	RESUME			# NO OPT

		CA	SWSAMPLE		# SEE IF SWITCH AT CMC
		EXTEND
		BZMF	RESUME			# ZERO (-1)	MANUAL (+0)

		CAF	BIT10			# SEE IF OCDUS ZEROED SINCE LAST FSTART
		MASK	OPTMODES
		CCS	A
		TC	+3
		TC	ALARM			# OPTICS NOT ZEROED
		OCT	00120

		CA	BIT2			# SEE IF ERR CNTS ENABLED
		EXTEND
		RAND	CHAN12
		EXTEND
		BZF	SETBIT			# CNTS NOT ENABLED-DO IT AND RESUME

		CAF	ONE			# INITIALIZE OPTIND
## Page 167
OPT2		TS	OPTIND
		EXTEND
		BZF	TRUNCMD			# CHECK TRUNION COMMAND

GETOPCMD	INDEX	OPTIND
		CA	DESOPTT			# PICK UP DESIRED OPT ANGLE
		EXTEND
		INDEX	OPTIND
		MSU	CDUT			# GET DIFFERENCE
		EXTEND
		MP	BIT13
		XCH	L
		DOUBLE
		TS	ITEMP1
		TCF	+2			# NO OVFL

		ADS	L			# WITH OVFL
STORCMD		INDEX	OPTIND
		LXCH	COMMANDO		# STORE COMMAND
		CCS	OPTIND
		TCF	OPT2			# GET NEXT COMMAND

		TS	ITEMP1			# INITIALIZE SEND INDICATOR TO ZERO
		COUNT*	$$/SXT

# SHAFT STOP AVOIDANCE

		CCS	CDUS			# IF CDUS GREATER THAN + OR - 90 DEG CHECK
		AD	NEG1/2			# FOR POSSIBLE STOP PROBLEM
		TCF	+2
		TCF	-2
		EXTEND
		BZMF	CMDSETUP		# CDUS LESS THAN 90 DEG, NO PROBLEMS

		CA	ZONE
		EXTEND
		BZF	CMDSETUP		# ZONE=3, NORMAL COMMAND
		MASK	BIT15			# GRAB SIGN OF ZONE
		TS	L
		CA	COMMANDO +1
		MASK	BIT15			# GRAB SIGN OF SHAFT COMMAND
		EXTEND
		RXOR	LCHAN
		CCS	A
		TCF	CMDSETUP		# SIGN ZONE NOT EQUAL TO SIGN COMMAND
		CCS	DESOPTS			# SEE IF DESOPTS BETWEEN -90 AND +90
		AD	NEG1/2
		TCF	+2			# ABS(DESOPTS) - 90 DEG
		TCF	-2
		EXTEND
## Page 168
		BZMF	+2			# DESOPTS IN FIRST OR FOURTH QUAD
		TCF	CMDSETUP
		CS	COMMANDO +1		# REVERSE REGULAR COMMAND
		TS	COMMANDO +1

		COUNT*	$$/T4RPT

CMDSETUP	CAF	ONE			# SET OPTIND
		TS	OPTIND
		INDEX	A
		CCS	COMMANDO		# GET SIGN OF COMMAND
		TC	POSOPCMD
		TC	NEXTOPT	+1		# ZERO COMMAND-SKIP SEND INDICATOR
		TC	NEGOPCMD
		TC	NEXTOPT	+1		# ZERO COMMAND

TRUNCMD		CS	CDUT			# IF COMMAND GREATER THAN 45 DEG-COMMAND
		AD	DESOPTT			# 45 DEG
		TS	Q
		TC	GETOPCMD		# LESS THAN 45 DEG-NORMAL OPERATION

		CCS	A			# GREATER THAN 45 DEG-USE OPSMAX WITH
		CA	POSMAX			# CORRECT SIGN
		TC	+2
		CS	POSMAX
		TS	L
		TC	STORCMD
POSOPCMD	AD	MAXPLS1
		EXTEND
		BZMF	DELOPCMD		# COMMAND LESS THAN MAX PULSE
		CS	MAXPLS			# GREATER THAN MAX PULSE-USE MAX PULSE

NEXTOPT		INCR	ITEMP1			# SET SEND INDICATOR
		AD	NEG0			# MAKE SURE ZERO COMMAND IS -ZERO
		INDEX	OPTIND
		TS	CDUTCMD			# STORE PULSE IN SEND REG

		CCS	OPTIND
		TC	CMDSETUP +1		# GET NEXT OPT

		CCS	ITEMP1			# ARE ANY PULSES TO GO
		TCF	SENDOCMD		# YES-SEND EM
		TC	RESUME			# NO

NEGOPCMD	AD	MAXPLS1
		EXTEND
		BZMF	DELOPCMD		# LESS THAN MAX PULSE
		CA	MAXPLS			# MAX PULSES
		TCF	NEXTOPT
## Page 169
DELOPCMD	INDEX	OPTIND
		XCH	COMMANDO		# SET UP SMALL COMMAND
		TCF	NEXTOPT

SENDOCMD	CAF	11,12			# SEND OCDU DRIVE COMMANDS
		EXTEND
		WOR	CHAN14
		TC	RESUME

SETBIT		CAF	BIT2			# ENABLE OCDU ERR CNTS
		EXTEND
		WOR	CHAN12
		TC	RESUME			# START COARS NEXT TIME AROUND

MAXPLS		DEC	-165			# WAS -80
MAXPLS1		DEC	-164			# WAS -79
11,12		EQUALS	PRIO6

