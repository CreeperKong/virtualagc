### FILE="Main.annotation"
## Copyright:	Public domain.
## Filename:	R36.agc
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
## Mod history:	2024-02-26 MAS  Created.

## All code in this file was part of the P34-P35, P74-P75 log section in Artemis.
## It has been moved to its own log section to match Skylark bank ordering.

# PROGRAM DESCRIPTION
# SUBROUTINE NAME	R36  OUT-OF-PLANE RENDEZVOUS ROUTINE
# MOD NO.  3	  DATE    18 NOVEMBER 1969
# MOD BY   T.E.CROCKER
#
# FUNCTIONAL DESCRIPTION
#
# TO DISPLAY AT ASTRONAUT REQUEST LGC CALCULATED RENDEZVOUS
# 	OUT-OF-PLANE PARAMETERS (YDOT CSM,YDOT LEM,Y).  
#
# CALLING SEQUENCE
#
# ASTRONAUT REQUEST THROUGH DSKY  V 90 E
#
# SUBROUTINES CALLED
#
# EXDSPRET  TIMEOPT
# GOMARKF   VEHOPT
# CSMCONIC
# LEMCONIC
# LOADTIME
#
# NORMAL EXIT MODES
#
# ASTRONAUT REQUEST THROUGH DSKY TO TERMINATE PROGRAM V 34 E
#
# ALARM OR ABORT EXIT MODES
#
# NONE
#
# OUTPUT
# 
# DECIMAL DISPLAY OF YDOT CSM, YDOT LEM, Y, TIME.
# DISPLAYED VALUES YDOT, YDOT, Y ARE STORED IN ERASABLE
# REGISTERS RRATE, RRATE2, RANGE RESPECTIVELY.
#
# ERASABLE INITIALIZATION REQUIRED
#
# CSM AND LEM STATE VECTORS
#
# DEBRIS
#
# CENTRALS A,Q,L
#
# OTHER  THOSE USED BY THE ABOVE LISTED SUBROUTINES

		SETLOC	R36CM
		BANK

		EBANK=	TIG
		COUNT*	$$/R36

R36		TC	INTPRET

		DLOAD	CALL
			TIG
			TIMEOPT
R36A		CALL
			LEMPREC
		VLOAD	PDVL		# VL TO PDLO
			VATT
			RATT
		UNIT	PDVL		# UNIT RL TO PDL0, VL TO MPAC
		STADR
		STORE	VPASS36		# VL TO VPASS36
		VXV	UNIT		# VL(MPAC) X RL(PDL0)
		STADR
		STODL	UNP36		# UNIT(VL X RL) TO UNP36
			TAT
		STCALL	TDEC1
			CSMPREC
		VLOAD	PDVL		# VC TO PDL0
			VATT
			RATT
		STORE	6D		# RC TO PDL6
		UNIT	PDVL		# UNIT(RC) TO PDL0, VC TO MPAC
		STADR
		STORE	12D		# VC TO PDL12
		VXV	UNIT		# VC(MPAC) X RC(PDL0)
		STADR
		STOVL	UNA36		# UNIT(VC X RC) TO UNA36
			6D		# RC TO MPAC
		DOT	SL1
			UNP36		# RC . UNIT(VL X RL)
		STOVL	RANGE		#  EQUALS RANGE
			12D		# VC TO MPAC
		DOT	SL1
			UNP36		# VC . UNIT(VL X RL)
		STOVL	RRATE		#  EQUALS R. RATE OF CSM
			VPASS36		# VL TO MPAC
		DOT	SL1
			UNA36
		STORE	RRATE2		# VL . UNIT(VC X RC)
		EXIT			#  EQUALS R. RATE OF LEM
		CAF	V06N96		# DISPLAY Y, YDOTCM,YDOTLM
		TC	BANKCALL
		CADR	GOMARKF
		TCF	ENDEXT		# T OR
		TCF	ENDEXT		#  P....EXIT R36
					#   R...DISPLAY TIME
		TC	INTPRET
		CALL
			TIMEOPT	+1
		GOTO
			R36A
V06N16N		VN	0616
VEHOPT		STQ	EXIT		# ALLOW VEHICLE OPTION
			VEHRET
		EXTEND
		DCA	TWO
		DXCH	OPTIONX
		CAF	OPTIONVN
		TC	BANKCALL
		CADR	GOXDSPF
		TC	ENDEXT
		TC	+2
		TC	-5

		TC	INTPRET
		GOTO
			VEHRET
OPTIONVN	VN	0412
V06N96		VN	0696

