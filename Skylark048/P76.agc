### FILE="Main.annotation"
## Copyright:	Public domain.
## Filename:	P76.agc
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
## Mod history:	2024-02-20 MAS  Created from Artemis 072.
##		2024-03-05 MAS  Updated for Skylark 48.

# 1) PROGRAM NAME - TARGET DELTA V PROGRAM (P76).
# 2) FUNCTIONAL DESCRIPTION - UPON ENTRY BY ASTRONAUT ACTION, P76 FLASHES DSKY REQUESTS TO THE ASTRONAUT
#	TO PROVIDE VIA DSKY (1) THE DELTA V TO BE APPLIED TO THE OTHER VEHICLE STATE VECTOR AND (2) THE
#	TIME (TIG) AT WHICH THE OTHER VEHICLE VELOCITY WAS CHANGED BY  EXECUTION OF A THRUSTING MANEUVER. THE
#	OTHER VEHICLE STATE VECTOR IS INTEGRATED TO TIG AND UPDATED BY THE ADDITION OF DELTA V (DELTA V HAVING
#	BEEN TRANSFORMED FROM LV TO REF COSYS). USING INTEGRVS, THE PROGRAM THEN INTEGRATES THE OTHER
# 	VEHICLE STATE VECTOR TO THE STATE VECTOR OF THIS VEHICLE, THUS INSURING THAT THE W-MATRIX AND BOTH VEHICLE
# 	STATES CORRESPOND TO THE SAME TIME.
# 3) ERASABLE INITIALIZATION REQUIRED - NONE.
# 4) CALLING SEQUENCES AND EXIT MODES - CALLED BY ASTRONAUT REQUEST THRU DSKY V 37 E 76 E.
#	EXITS BY TCF ENDOFJOB.
# 5) OUTPUT - OTHER VEHICLE STATE VECTOR INTEGRATED TO TIG AND INCREMENTED BY DELTA V IN REF COSYS.
#	THE PUSHLIST CONTAINS THE MATRIX BY WHICH THE INPUT DELTA V MUST BE POST-MULTIPLIED TO CONVERT FROM LV
#	TO REF COSYS.
# 6) DEBRIS - OTHER VEHICLE STATE VECTOR.
# 7) SUBROUTINES CALLED - BANKCALL,GOXDSPF,CSMPREC (OR LEMPREC),ATOPCSM (OR ATOPLEM),INTSTALL,INTWAKE, PHASCHNG
#	INTPRET, INTEGRVS, AND MINIRECT.
# 8) FLAG USE - MOONFLAG,CMOONFLAG,INTYPFLG,RASFLAG, AND MARKCTR.

		SETLOC	P76LOC
		BANK

		COUNT*	$$/P7677
		EBANK=	TIG

P77		EXTEND
		DCA	NOMTIG
		DXCH	TIG

		CAF	V06N33          
		TC      BANKCALL        # AND WAIT FOR KEYBOARD ACTION
		CADR    GOFLASH
		TCF     ENDP76	
		TC	+2		# PROCEED
		TC	-5		# STORE DATA AND REPEAT FLASHING
		CAF	V06N81		# FLASH V06 N81
		TC	BANKCALL	# AND WAIT FOR KEYBOARD ACTION.
		CADR	GOFLASH
		TCF	ENDP76
		TC	+2
		TC	-5		# STORE DATA AND REPEAT FLASHING
		TC	INTPRET		# RETURN TO INTERPRETIVE CODE
		DLOAD	SET             # SET D(MPAC)=TIG IN CSEC B28
			TIG
			NODOFLAG	# DISALLOW V37
		STCALL	TDEC1
			CSMPREC
COMPMAT		VLOAD	UNIT
			RATT
		VCOMP			# U(-R)
		STORE	24D		# U(-R) TO 24D
		VXV	UNIT		# U(-R)XV = U(VXR)
			VATT
		STORE	18D
		VXV	UNIT		# U(VXR)XU(-R) = U((RXV)XR)
			24D
		STOVL	12D
			DELVLVC		# FROM CSM
DVTRANS		VXM	VSL1		# V(MPAC)=DELTA-V IN REFCOSYS
			12D
		VAD
			VATT
		STORE	6		# V(PD6)=VATT + DELTA V
		CALL			# PREVENT WOULD-BE USER OF ORBITAL
			INTSTALL	# INTEG FROM INTERFERING WITH UPDATING
		VLOAD
			6
		STOVL	VCV
			RATT
		STODL	RCV
			TIG
		STORE	TET
		CLEAR	DLOAD
			INTYPFLG
			TETTHIS
INTOTHIS	STCALL	TDEC1
			INTEGRVS
		CALL
			INTSTALL
		VLOAD
			RATT1
		STORE	RRECT
		STODL	RCV
			TAT
		STOVL	TET
			VATT1
		CALL
			MINIRECT
		EXIT
		TC	PHASCHNG
		OCT	04024

		TC	INTPRET
		SET	CALL
			REINTFLG
			ATOPCSM
		CALL
			INTWAKE0	# PERMIT USE OF ORBITAL INTEGRATION
OUT		CLEAR	EXIT		# ALLOW V37, NO NEED TO CLEAR NODOFLAG AT
			NODOFLAG	#  ENDP76 SINCE FLAG NOT SET WHEN DISPLAY
					#  RESPONSES TRANSFER THERE FROM P76+.
		CAF	NEGONE
		TS	MRKBUF1
		TCF	MNKGOPOO

ENDP76		CAF	NEGONE
		TS	MRKBUF1		# INVALIDATE MARK BUFFER

		TCF	GOTOPOOH
