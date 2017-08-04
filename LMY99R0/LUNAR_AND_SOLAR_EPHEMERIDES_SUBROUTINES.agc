### FILE="Main.annotation"
## Copyright:	Public domain.
## Filename:	ASSEMBLY_AND_OPERATION_INFORMATION.agc
## Purpose:	Part of the reconstructed source code for LMY99 Rev 0,
##		otherwise known as Luminary Rev 99, the second release
##		of the Apollo Guidance Computer (AGC) software for Apollo 11.
##		It differs from LMY99 Rev 1 (the flown version) only in the
##		placement of a single label. The corrections shown here have
##		been verified to have the same bank checksums as AGC developer
##		Allan Klumpp's copy of Luminary Rev 99, and so are believed
##		to be accurate. This file is intended to be a faithful 
##		recreation, except that the code format has been changed to 
##		conform to the requirements of the yaYUL assembler rather than 
##		the original YUL assembler.
##
## Assembler:	yaYUL
## Contact:	Hartmuth Gutsche <hgutsche@xplornet.com>.
## Website:	www.ibiblio.org/apollo.
## Pages:	984-987
## Mod history:	2009-05-24 HG	Transcribed from page images.
##		2016-12-17 RSB	Proofed text comments with octopus/ProoferComments
##				and corrected the errors found.
##		2017-03-13 RSB	Comment-text fixes noted in proofing Luminary 116.
##		2017-08-01 MAS	Created from LMY99 Rev 1.

## This source code has been transcribed or otherwise adapted from
## digitized images of a hardcopy from the MIT Museum.  The digitization
## was performed by Paul Fjeld, and arranged for by Deborah Douglas of
## the Museum.  Many thanks to both.  The images (with suitable reduction
## in storage size and consequent reduction in image quality as well) are
## available online at www.ibiblio.org/apollo.  If for some reason you
## find that the images are illegible, contact me at info@sandroid.org
## about getting access to the (much) higher-quality images which Paul
## actually created.
##
## The code has been modified to match LMY99 Revision 0, otherwise
## known as Luminary Revision 99, the Apollo 11 software release preceeding
## the listing from which it was transcribed. It has been verified to
## contain the same bank checksums as AGC developer Allan Klumpp's listing
## of Luminary Revision 99 (for which we do not have scans).
##
## Notations on Allan Klumpp's listing read, in part:
##
##	ASSEMBLE REVISION 099 OF AGC PROGRAM LUMINARY BY NASA 2021112-51

## Page 984
# NAME - LSPOS - LOCATE SUN AND MOON			DATE - 25 OCT 67
# MOD NO. 1
# MOD BY NEVILLE					ASSEMBLY SUNDANCE
#
# FUNCTIONAL DESCRIPTION
#
#        COMPUTES UNIT POSITION VECTOR OF THE SUN AND MOON IN THE BASIC REFERENCE SYSTEM. THE SUN VECTOR S IS
# LOCATED VIA TWO ANGLES. THE FIRST ANGLE(OBLIQUITY) IS THE ANGLE BETWEEN THE EARTH EQUATOR AND THE ECLIPTIC. THE
# SECOND ANGLE IS THE LONGITUDE OF THE SUN MEASURED IN THE ECLIPTIC.
# THE POSITION VECTOR OF THE SUN IS
#	-
#	S = (COS(LOS), COS(OBL)*SIN(LOS), SIN(OBL)*SIN(LOS)), WHERE
#
#	LOS = LOS +LOS *T-(C *SIN(2PI*T)/365.24 +C *COS(2PI*T)/365.24)
#	         0    R     0                     1
#	LOS  (RAD) IS THE LONGITUDE OF THE SUN FOR MIDNIGHT JUNE 30TH OF THE PARTICULAR YEAR.
#          0
#	LOS  (RAD/DAY) IS THE MEAN RATE FOR THE PARTICULAR YEAR.
#    	   R
#
# LOS  AND LOS  ARE STORED AS LOSC AND LOSR IN RATESP.
#    0        R
# COS(OBL) AND SIN(OBL) ARE STORED IN THE MATRIX KONMAT.
#
# T, TIME MEASURED IN DAYS (24 HOURS), IS STORED IN TIMEP.
#
# C  AND C  ARE FUDGE FACTORS TO MINIMIZE THE DEVIATION.  THEY ARE STORED AS ONE CONSTANT (CMOD), SINCE
#  0      1                               2  2 1/2
# C *SIN(X)+C *COS(X) CAN BE WRITTEN AS (C +C )   *SIN(X+PHI), WHERE PHI=ARCTAN(C /C ).
#  0         1                            0  1                                   1  0
#
# THE MOON IS LOCATED VIA FOUR ANGLES, THE FIRST IS THE OBLIQUITY. THE SECOND IS THE MEAN LONGITUDE OF THE MOON,
# MEASURED IN THE ECLIPTIC FROM THE MEAN EQUINOX TO THE MEAN ASCENDING NODE OF THE LUNAR ORBIT, AND THEN ALONG THE
# ORBIT.  THE THIRD ANGLE IS THE ANGLE BETWEEN THE ECLIPTIC AND THE LUNAR ORBIT.  THE FOURTH ANGLE IS THE LONGITUDE
# OF THE NODE OF THE MOON, MEASURED IN THE LUNAR ORBIT.  LET THESE ANGLES BE OBL,LOM,IM, AND LON RESPECTIVELY.
#
# THE SIMPLIFIED POSITION VECTOR OF THE MOON IS
#	-
#	M=(COS(LOM), COS(OBL)*SIN(LOM)-SIN(OBL)*SIN(IM)*SIN(LOM-LON), SIN(OBL)*SIN(LOM)+COS(OBL)*SIN(IM)*SIN(LOM-LON))
#
# WHERE
#	LOM=LOM +LOM *T-(A *SIN 2PI*T/27.5545+A *COS(2PI*T/27.5545)+B *SIN 2PI*T/32+B *COS(2PI*T/32)), AND
#	       0    R     0                    1                     0               1
#	LON=LON +LON
#	       0    R
# A , A , B  AND B  ARE STORED AS AMOD AND BMOD (SEE DESCRIPTION OF CMOD, ABOVE).  COS(OBL), SIN(OBL)*SIN(IM),
#  0   1   0      1
# SIN(OBL), AND COS(OBL)*SIN(IM) ARE STORED IN KONMAT AS K1, K2, K3 AND K4, RESPECTIVELY.  LOM , LOM , LON , LON                                   
# ARE STORED AS LOM0, LOMR, LON0, AND LONR IN RATESP.                                         0     R     0     R
# THE THREE PHIS ARE STORED AS AARG, BARG, AND CARG(SUN).  ALL CONSTANTS ARE UPDATED BY YEAR.
#
# CALLING SEQUENCE
## Page 985
#	CALL LSPOS.  RETURN IS VIA CPRET.
#
# ALARMS OR ABORTS
#	NONE
#
# ERASABLE INITIALIZATION REQUIRED
#	TEPHEM - TIME FROM MIDNIGHT 1 JULY PRECEDING THE LAUNCH TO THE TIME OF THE LAUNCH (WHEN THE AGC CLOCK WENT
#	TO ZERO).  TEPHEM IS TP WITH UNITS OF CENTI-SECONDS.
#
#	TIME2 AND TIME1 ARE IN MPAC AND MPAC +1 WHEN PROGRAM IS CALLED.
#
# OUTPUT
#	UNIT POSITIONAL VECTOR OF SUN IN VSUN.  (SCALED B-1)
#	UNIT POSITIONAL VECTOR OF MOON IN VMOON.  (SCALED B-1)
#
# SUBROUTINES USED
#	NONE
#
# DEBRIS
#	CURRENT CORE SET, WORK AREA AND FREEFLAG

		BANK	04
		SETLOC	EPHEM
		BANK

		EBANK=	VSUN
		COUNT*	$$/EPHEM
LUNPOS		EQUALS	LSPOS

LSPOS		SETPD	SR
			0
			14D		# TP
		TAD	DDV
## The hand-written notation "in centisec B 42" appears to the right.	
			TEPHEM		# TIME OF LAUNCH
			CSTODAY		# 24 HOURS-8640000 CENTI-SECS/DAY B-33
## The hand-written notation "@ B 9 = 512 days" appears to the right.
		STORE	TIMEP		# T IN DAYS
## The hand-written notation "&there4; granularity &asymp; 0.164 sec" appears to the right.
		AXT,1	AXT,2
			0
			0
		CLEAR
			FREEFLAG	# SWITCH BIT
POSITA		DLOAD
			KONMAT +2	# ZEROS
		STORE	GTMP
POSITB		DLOAD	DMP*
			TIMEP		# T
			VAL67 +4,1	# 1/27 OR 1/32 OR 1/365
## Page 986
		SL	DAD*
			8D
			VAL67 +2,1	# AARG
		SIN	DMP*		# SIN(T/27+PHI) OR T/32 OR T/365
			VAL67,1		# (A0**2+A1**2)**1/2 SIN(X+PHIA)
		DAD	INCR,1		# PLUS
			GTMP		# (B0**2+B1**2)**1/2 SIN(X+PHIB)
		DEC	-6
		STORE	GTMP		# OR (C0**2+C1**2)**1/2 SIN(X+PHIC)
		BOFSET
			FREEFLAG
			POSITB
POSITD		DLOAD	DMP*
			TIMEP		# T
			RATESP,2	# LOMR,LOSR,LONR
		SL	DAD*
			5D
			RATESP +6,2	# LOMO,LOSO,LONO
		DSU
			GTMP
		STORE	STMP,2		# LOM,LOS,LON
		SLOAD	INCR,2
			X2
		DEC	-2
		DAD	BZE
			RCB-13		# PLUS 2
			POSITE		# 2ND
		BPL
			POSITA		# 1ST
POSITF		DLOAD	DSU		# 3RD
			STMP		# LOM
			STMP +4		# LON
		SIN	PDDL		# SIN(LOM-LON)
			STMP
		SIN	PDDL		# SIN LOM
			STMP
		COS	VDEF		# COS LOM
		MXV	UNIT
			KONMAT		# K1,K2,K3,K4,
		STORE	VMOON
		DLOAD	PDDL
			KONMAT +2	# ZERO
			STMP +2
		SIN	PDDL		# SIN LOS
			STMP +2
		COS	VDEF		# COS LOS
		MXV	UNIT
			KONMAT
		STORE	VSUN
		RVQ
## Page 987
POSITE		DLOAD
			KONMAT +2	# ZEROS
		STORE	GTMP
		GOTO
			POSITD
LUNVEL		RVQ			#        TO FOOL INTEGRATION
		SETLOC	EPHEM1
		BANK

		COUNT*	$$/EPHEM
STMP		EQUALS	16D
GTMP		EQUALS	22D
TIMEP		EQUALS	24D

