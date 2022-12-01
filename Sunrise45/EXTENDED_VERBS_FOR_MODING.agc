### FILE="Main.annotation"
## Copyright:	Public domain.
## Filename:	EXTENDED_VERBS_FOR_MODING.agc
## Purpose:	Part of the source code for Solarium build 55. This
##		is for the Command Module's (CM) Apollo Guidance
##		Computer (AGC), for Apollo 6.
## Assembler:	yaYUL --block1
## Contact:	Jim Lawton <jim DOT lawton AT gmail DOT com>
## Website:	www.ibiblio.org/apollo/index.html
## Mod history:	2009-10-08 JL	Created.
##		2009-08-19 RSB	Typos.
##		2016-08-23 RSB	More of the same.
## 		2016-12-28 RSB	Proofed comment text using octopus/ProoferComments,
##				and fixed errors found.
##		2021-05-30 ABS	Fixed capitalization of various page marker comments.
##				OCT1DNV -> OCTIDNV


# VERB PLEASE PERFORM AND VERB PLEASE MARK ----- FLASH SHOULD BE TURNED ON
# (FLASHON) BY ROUTINE PASTING EITHER UP. FLASH IS TURNED OFF BY ENTER OF
# PLEASE PERFORM, OR ENTER OF PLEASE MARK.
#
# BOTH FLASHON AND FLASHOFF MUST NOT BE USED IN INTERRUPTED STATE.
#
# PLEASE PERFORM VERB AND PLEASE MARK VERB-----
# PRESSING ENTER INDICATES ACTION REQUESTED HAS
# BEEN PERFORMED, AND DOES SAME RECALL AS A COMPLETED LOAD. OPERATOR
# SHOULD DO VERB PROCEED WITHOUT DATA IF WISHES NOT TO PERFORM THE
# REQUESTED ACTION.



# FAN-OUT

		SETLOC	13740
		
PINTEST		EQUALS			# THIS MUST = 05,6000 FOR PINBALL
					# VERIFICATION.  DO NOT MOVE WITHOUT
					# INFORMING ALAN GREEN.

LST2FAN		TC	VBZERO		# VB40 ZERO(USED WITH NOUN ICDU OR OCDU)
		TC	VBCOARK		# VB41 COARSE ALIGN(USED WITH NOUN ICDU
					#            OR OCDU)
		TC	IMUFINEK	# VB42 FINE ALIGN IMU
		TC	IMULOCKK	# VB43 LOCK IMU
		TC	IMUATTCK	# VB44 SET IMU TO ATTITUDE CONTROL
		TC	IMUREENK	# VB45 SET IMU TO RE-ENTRY CONTROL
		TC	IMUCORK		# VB46  RETURN IMU TO COARSE ALIGN
		TC	ALM/END		# VB47 OPTICAL TRACKER ON(NOT IN USE YET)
		TC	GOLOADLV	# VB50 PLEASE PERFORM
		TC	ALM/END		# VB51 PLEASE MARK(NOT IN USE YET)
		TC	DOMKACPT	# VB52 MARK ACCEPT
		TC	RELO/IK		# VV53 FREE  (USED WITH NOUN ICDU OR OCDU)
		TC	TORQGYRS	# VB54 PULSE TORQUE GYROS
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		TC	ALM/END		# ILLEGAL VERB.
		TC	DOGDRIFT	# FIXME
		TC	DOPIPTST	# FIXME
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		NOOP			# ILLEGAL VERB.
		TC	ALM/END		# ILLEGAL VERB.

		SETLOC	ENDMARK

ALM/END		TC	FALTON
		TC	ENDOFJOB
		
		
VBZERO		TC	OP/INERT
		TC	IMUZEROK	# RETURN HERE IF NOUN = ICDU(20)
		TC	ALM/END		# RETURN HERE IF NOUN = OCDU(55)
					#         (NOT IN USE YET)
		
VBCOARK		TC	OP/INERT
		TC	IMUCOARK	# RETURN HERE IF NOUN = ICDU(20)
		TC	OPTCOARK	# RETURN HERE IF NOUN = OCDU(55)


#	SUBROUTINE FOR CHECKING GIVEN NOUN IF APPROPRIATE.

OP/INERT	XCH	Q		# RETURNS TO L+1 IF NOUN=ICDU(20)
		TS	WDRET		# RETURNS TO L+2 IF NOUN = OCDU(55)
		CS	NNICDU		#   ALARMS IF ANY OTHER NOUN
		AD	NOUNREG
		CCS	A
		TC	+4		# NN G/ 20
NNICDU		OCT	20
		TC	ALM/END		# NN L/ 20
		TC	WDRET		# NN = 20
		CS	NNOCDU
		AD	NOUNREG
		CCS	A
		TC	ALM/END		# NN G/ 55
NNOCDU		OCT	55
		TC	ALM/END		# NN L/ 55
		INDEX	WDRET		# NN = 55
		TC	1
		

# KEYBOARD REQUEST TO ZERO IMU ENCODERS

IMUZEROK	TC	BANKCALL	# ZERO ENCODERS.
		CADR	IMUZERO +4
		
		TC	BANKCALL	# STALL
		CADR	IMUSTALL
		TC	+1
		TC	ENDMZERO
		

# KEYBOARD REQUEST TO COARSE ALIGN THE IMU

IMUCOARK	TC	GRABDSP		# COARSE ALIGN FROM KEYBOARD.
		TC	PREGBSY
		CAF	VNLODCDU	# CALL FOR THETAD LOAD
		TC	NVSUB
		TC	PRENVBSY
		TC	ENDIDLE		# STALL WAITING FOR THE LOAD
		TC	TERMEXTV
		TC	ICSDEL		# PROCEED - ASK FOR INCREMENTAL LOAD.
		
ICORK2		CAF	IMUCOARV	# RE-DISPLAY COARSE ALIGN VERB.
		TC	NVSUB
		TC	PRENVBSY
		TC	FREEDSP		# RELEASE THE DISPLAYS

		CAF	KGCOARSE
		TS	KG
		CAF	ZERO
		TS	KH
		
		TC	BANKCALL	# CALL MODE SWITCHING PROG
		CADR	IMUCOARS
		
		TC	BANKCALL	# STALL
		CADR	IMUSTALL
		TC	ENDOFJOB
		TC	ENDOFJOB
		
KGCOARSE	DEC	.18
VNLODCDU	OCT	02522
IMUCOARV	OCT	04100


# KEYBOARD REQUEST TO FINE ALIGN AND GYRO TORQUE IMU

IMUFINEK	TC	GRABDSP		# FINE ALIGN WITH GYRO TORQUING.
		TC	PREGBSY
		CAF	VNLODGYR	# CALL FOR LOAD OF GYRO COMMANDS
		TC	NVSUB
		TC	PRENVBSY
		TC	ENDIDLE		# HOLD UP FOR THE DATA LOAD
		TC	TERMEXTV
		TC	+1		# PROCEED WITHOUT A LOAD
		
		CAF	IMUFINEV	# RE-DISPLAY OUR OWN VERB
		TC	NVSUB
		TC	PRENVBSY
		TC	FREEDSP		# RELEASE DISPLAYS
		
		TC	BANKCALL	# CALL MODE SWITCH PROG
		CADR	IMUFINE
		
		TC	BANKCALL	# HIBERNATION
		CADR	IMUSTALL
		TC	ENDOFJOB
		TC	BANKCALL	# PINBALL LEFT COMMANDS IN OGC REGIST5RS
		CADR	IMUPULSE
		TC	BANKCALL	# WAIT FOR PULSES TO GET OUT.
		CADR	IMUSTALL
		TC	ENDOFJOB
		TC	ENDOFJOB
		
VNLODGYR	OCT	02567
IMUFINEV	OCT	04200		# FINE ALIGN VERB


# KEYBOARD REQUEST TO LOCK THE IMU CDUS

IMULOCKK	TC	BANKCALL
		CADR	IMULOCK
		
		TC	BANKCALL	# STALL
		CADR	IMUSTALL
		TC	ENDOFJOB
		TC	ENDOFJOB
		

# KEYBOARD REQUEST TO PUT IMU IN ATTITUDE CONTROL MODE

IMUATTCK	TC	GRABDSP		# ATTITUDE CONTROL.
		TC	PREGBSY
		CAF	DELLOAD		# ASK FOR DELTA ANGLE LOAD.
		TC	NVSUB
		TC	PRENVBSY
		TC	ENDIDLE		# STALL WAITING FOR LOAD
		TC	TERMEXTV
		TC	ATTCABS		# PROCEED - ASK FOR ABSOLUTE ANGLES.
		TC	INCLOOP		# ADD INCREMENTS TO DESIRED ANGLES.
		TC	ATTCK2
		TC	PRENVBSY
		
ATTCK3		TC	FREEDSP		# LET THE DISPLAYS GO
		
		TC	BANKCALL	# CALL THE MODE SWITCH PROG
		CADR	IMUATTC
		
		TC	BANKCALL	# STALL
		CADR	IMUSTALL
		TC	ENDOFJOB
		TC	ENDOFJOB
		
IMUATTCV	OCT	04400


# KEYBOARD REQUEST TO PUT THE IMU IN RE-ENTRY CONTROL MODE

IMUREENK	TC	GRABDSP		# RE-ENTRY.
		TC	PREGBSY
		CAF	VNLODCDU
		TC	NVSUB
		TC	PRENVBSY
		TC	ENDIDLE		# STALL FOR THE LOAD
		TC	TERMEXTV
		TC	+1		# PROCEED
		
		CAF	IMUREENV	# RE-DISPLAY VERB.
		TC	NVSUB
		TC	PRENVBSY
		TC	FREEDSP		# LET THE DISPLAYS GO
		
		TC	BANKCALL	# CALL MODE SWITCH PROG
		CADR	IMUREENT
		
		TC	BANKCALL	# STALL
		CADR	IMUSTALL
		TC	ENDOFJOB
		TC	ENDOFJOB
		
IMUREENV	OCT	04500


# KEYBOARD REQUEST TO RETURN THE IMU TO COARSE ALIGN

IMUCORK		TC	BANKCALL	# BACK TO COARSE ALIGN (FROM FINE).
		CADR	IMURECOR
		
		TC	BANKCALL
		CADR	IMUSTALL
		TC	ENDOFJOB
		TC	ENDOFJOB
		

# KEYBOARD REQUEST TO ZERO OPTICS CDUS

OPTZEROK	TC	BANKCALL	# CALL MODE PROG
		CADR	OPTZERO
		
		TC	BANKCALL	# STALL
		CADR	OPTSTALL
		TC	ENDOFJOB
		TC	ENDOFJOB
		
OPTZERO		=			# INTERFACES NOT CURRENTLY WIRED *********


# TEMPORARY ROUTINE TO RUN THE OPTICS CDUS FROM THE KEYBOARD

OPTCOARK	TC	GRABDSP		# SNATCH THEM DISPLAYS
		TC	PREGBSY
		CAF	VNLDOCDU	# VERB-NOUN TO LOAD OPTICS CDUS
		TC	NVSUB
		TC	PRENVBSY
		TC	ENDIDLE		# WAIT FOR THE LOAD
		TC	TERMEXTV
		TC	+1		# PROCEED
		
		CAF	OPTCOARV	# RE-DISPLAY OUR OWN VERB
		TC	NVSUB
		TC	PRENVBSY
		TC	FREEDSP		# LET IT GO

		CCS	OPTIND
		TC	ENDOFJOB
		TC	ENDOFJOB
		TC	ENDOFJOB
		
		TS	OPTIND		# SNATCH OPTICS
		
		TC	ENDOFJOB
		
VNLDOCDU	OCT	02457
OPTCOARV	OCT	04100


# KEYBOARD REQUEST TO ACTIVATE THE OPTICAL STAR TRACKER

OPTTRONK	TC	BANKCALL
		CADR	OPTTRKON	# CALL MODE SWITCHER
		
		TC	BANKCALL	# STALL
		CADR	OPTSTALL
		TC	ENDOFJOB
		TC	ENDOFJOB
		
OPTTRKON	=			# NOT AVAILABLE JUST NOW

DOMKACPT	INHINT
		CAF	ONE
		TC	WAITLIST
		CADR	MKACCEPT	# (CALLED IN KEYRUPT WHEN BUTTON AVAIL.)
		TC	ENDOFJOB
		
# PLEASE PERFORM VERB AND PLEASE MARK VERB ----- PRESSING ENTER INDICATES
# ACTION REQUESTED HAS BEEN PERFORMED, AND DOES SAME RECALL AS A COMPLETED
# LOAD.  OPERATOR SHOULD DO VB PROCEED WITHOUT DATA IF HE WISHES NOT TO
# PERFORM THE REQUESTED ACTION.

GOLOADLV	TC	BANKCALL
		CADR	FLASHOFF
		TC	POSTJUMP
		CADR	LOADLV
		

# KEYBOARD REQUEST TO RELEASE IMU OR OPTICS

RELO/IK		TC	OP/INERT
		TC	IMURELK		# RETURN HERE IF IMU
		CS	ZERO		# RETURN HERE IF OPTICS
		TS	OPTIND
		TC	ENDOFJOB
		
IMURELK		CS	ZERO
		TS	CDUIND
		TC	ENDOFJOB
		

# KEYBOARD REQUEST TO PULSE TORQUE IRIGA



TORQGYRS	TC	GRABDSP		# GYRO TORQUING WITH NO MODE-SWITCH.
		TC	PREGBSY
		CAF	VNLODGYR
		TC	NVSUB
		TC	PRENVBSY
		TC	ENDIDLE
		TC	TERMEXTV
		TC	+1
		CAF	TORQGYRV	# RE-DISPLAY OUR OWN VERB
		TC	NVSUB
		TC	PRENVBSY
		TC	FREEDSP
		TC	BANKCALL
		CADR	IMUPULSE
		TC	BANKCALL	# WAIT FOR PULSES TO GET OUT.
		CADR	IMUSTALL
		TC	ENDOFJOB
		TC	ENDOFJOB
		
TORQGYRV	OCT	05400

DOGDRIFT	TC	TESTMODE
		INHINT
		CAF	TESTPRIO
		TC	FINDVAC
		CADR	LGNTEST1
		TC	ENDOFJOB

TESTPRIO	OCT	23000

DOPIPTST	TC	TESTMODE
		INHINT
		CAF	TESTPRIO
		TC	FINDVAC
		CADR	PIPTEST1
		TC	ENDOFJOB

TESTMODE	CAF	FIVE
		MASK	MODREG
		CCS	A
		TC	ALM/END

		XCH	Q
		TS	QPLACE

		CAF	FOUR
		AD	MODREG
		TS	MODREG
		TC	BANKCALL
		CADR	DSPMM

		TC	QPLACE

ENDEXTVS	=

#	PROVISION FOR COARSE ALIGN TO INCREMENTAL ANGLES.
		SETLOC	ENDSELFC

ICSDEL		CAF	DELLOAD
		TC	NVSUB		# REQUEST LOAD OF DELTA ICDU ANGLES.
		TC	PRENVBSY
		TC	ENDIDLE
		TC	TERMEXTV
		TC	ICORK2		# PROCEED WITHOUT DATA HERE TOO.
		TC	INCLOOP		# LOOP TO INCREMENT THETAD FROM DSPTEM2.
		TC	ICORK2		# RE-DISPLAY COARSE ALIGN VERB.
		
INCLOOP		XCH	Q		# INCREMENTS THETADS IN 2S COMPLEMENT FROM
		TS	MPAC		#  THREE ANGLE INCREMENTS IN DSPTEM2S.
		CAF	LTHD+2
		TS	BUF		# SET UP FOR CDUINC.
		CAF	TWO		# THREE TIMES THROUGH.
		
INCLOOP2	TS	MPAC +1
		INDEX	A
		XCH	DSPTEM2		# INCREMENT TO TEM2 FOR CDUINC.
		TS	TEM2
		TC	BANKCALL
		CADR	CDUINC
		CCS	BUF
		TS	BUF
		CCS	MPAC +1
		TC	INCLOOP2
		
		TC	MPAC		# RETURN WHEN FINISHED.

# PROVISIONS FOR ABSOLUTE LOAD FOR IMU CDUS IN ATTITUDE CONTROL.

ATTCABS		CAF	VNLODCDU	# ASK FOR ABSOLUTE CDU ANGLES.
		TC	NVSUB
		TC	PRENVBSY
		TC	ENDIDLE
		TC	TERMEXTV
		TC	ATTCK2

ATTCK2		CAF	IMUATTCV
		TC	NVSUB
		TC	PRENVBSY
		TC	ATTCK3
		
DELLOAD		OCT	02523
LTHD+2		ADRES	THETAD +2

ENDMZERO	INHINT
		CS	ZLITBITS	# TURN OFF ZEROING LIGHT TO SHOW COMPLETE.
		MASK	DSPTAB +11D
		AD	BIT15
		TS	DSPTAB +11D
		TC	ENDOFJOB
