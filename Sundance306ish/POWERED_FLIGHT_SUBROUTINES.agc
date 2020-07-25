### FILE="Main.annotation"
## Copyright:   Public domain.
## Filename:    POWERED_FLIGHT_SUBROUTINES.agc
## Purpose:     A section of a reconstructed, mixed version of Sundance
##              It is part of the reconstructed source code for the Lunar
##              Module's (LM) Apollo Guidance Computer (AGC) for Apollo 9.
##              No original listings of this program are available;
##              instead, this file was created via disassembly of dumps
##              of various revisions of Sundance core rope modules.
## Assembler:   yaYUL
## Contact:     Ron Burkey <info@sandroid.org>.
## Website:     www.ibiblio.org/apollo/index.html
## Mod history: 2020-06-17 MAS  Created from Luminary 69.

## Sundance 302

                BANK    14              # SAME FBANK AS THE FINDCDUD SUB-PROGRAM
                SETLOC  POWFLITE
                BANK

                EBANK=  DEXDEX
                COUNT*  $$/POWFL

#     CDUTRIG, CDUTRIG1, CDUTRIG2, AND CD*TR*GS ALL COMPUTE THE SINES AND
# COSINES OF THREE 2'S COMPLEMENT ANGLES AND PLACE THE RESULT, DOUBLE
# PRECISION, IN THE SAME ORDER AS THE INPUTS, AT SINCDU AND COSCDU.   AN
# ADDITIONAL OUTPUT IS THE 1'S COMPLEMENT ANGLES AT CDUSPOT.   THESE
# ROUTINES GO OUT OF THEIR WAY TO LEAVE THE MPAC AREA AS THEY FIND IT,
# EXCEPT FOR THE GENERALLY UNIMPORTANT MPAC +2.  THEY DIFFER ONLY IN
# WHERE THEY GET THE ANGLES, AND IN METHOD OF CALLING.
#
#     CDUTRIG (AND CDUTRIG1, WHICH CAN BE CALLED IN BASIC) COMPUTE THE
# SINES AND COSINES FROM THE CURRENT CONTENTS OF THE CDU REGISTERS.
# THE CONTENTS OF CDUTEMP, ETC., ARE NOT TOUCHED SO THAT THEY MAY
# CONTINUE TO FORM A CONSISTENT SET WITH THE LATEST PIPA READINGS.
#
#     CDUTRIG1 IS LIKE CDUTRIG EXCEPT THAT IT CAN BE CALLED IN BASIC.
#
#     CD*TR*GS FINDS CDU VALUES IN CDUSPOT RATHER THAN IN CDUTEMP.   THIS
# ALLOWS USERS TO MAKE TRANSFORMATIONS USING ARBITRARY ANGLES, OR REAL
# ANGLES IN AN ORDER OTHER THAN X Y Z.   A CALL TO THIS ROUTINE IS
# NECESSARY IN PREPARATION FOR A CALL TO AX*SR*T IN EITHER OF ITS TWO
# MODES (SMNB OR NBSM).   SINCE AX*SR*T EXPECTS TO FIND THE SINES AND
# COSINES IN THE ORDER Y Z X THE ANGLES MUST HAVE BEEN PLACED IN CDUSPOT
# IN THIS ORDER.   CD*TR*GS NEED NOT BE REPEATED WHEN AX*SR*T IS CALLED
# MORE THAN ONCE, PROVIDED THE ANGLES HAVE NOT CHANGED.   NOTE THAT SINCE
# IT CLOBBERS BUF2 (IN THE SINE AND COSINE ROUTINES) CD*TR*GS CANNOT BE
# CALLED USING BANKCALL.   SORRY.
#
#     CD*TR*G IS LIKE CD*TR*GS EXCEPT THAT IT CAN BE CALLED IN
# INTERPRETIVE.

CDUTRIG         EXIT
                TC      CDUTRIGS
                TC      INTPRET
                RVQ

CD*TR*G         EXIT
                TC      CD*TR*GS
                TC      INTPRET
                RVQ

CDUTRIGS        CA      CDUX
                TS      CDUSPOT +4
                CA      CDUY
                TS      CDUSPOT
                CA      CDUZ
                TS      CDUSPOT +2

CD*TR*GS        EXTEND
                QXCH    TEM2
                CAF     FOUR
TR*GL**P        MASK    SIX             # MAKE IT EVEN AND SMALLER
                TS      TEM3
                INDEX   TEM3
                CA      CDUSPOT
                DXCH    MPAC            # STORING 2'S COMP ANGLE, LOADING MPAC
                DXCH    VBUF    +4      # STORING MPAC FOR LATER RESTORATION
                TC      USPRCADR
                CADR    CDULOGIC
                EXTEND
                DCA     MPAC
                INDEX   TEM3
                DXCH    CDUSPOT         # STORING 1'S COMPLEMENT ANGLE
                TC      USPRCADR
                CADR    COSINE
                DXCH    MPAC
                INDEX   TEM3
                DXCH    COSCDU          # STORING COSINE
                EXTEND
                INDEX   TEM3
                DCA     CDUSPOT         # LOADING 1'S COMPLEMENT ANGLE
                TC      USPRCADR
                CADR    SINE    +1      # SINE +1 EXPECTS ARGUMENT IN A AND L
                DXCH    VBUF    +4      # BRINGING UP PRIOR MPAC TO BE RESTORED
                DXCH    MPAC
                INDEX   TEM3
                DXCH    SINCDU
                CCS     TEM3
                TCF     TR*GL**P
                TC      TEM2
# ****************************************************************************************************************
#     QUICTRIG, INTENDED FOR GUIDANCE CYCLE USE WHERE TIME IS CRITICAL, IS A MUCH FASTER VERSION OF CD*TR*GS.
# QUICTRIG COMPUTES AND STORES THE SINES AND COSINES OF THE 2'S COMPLEMENT ANGLES AT CDUSPOT, CDUSPOT +2,
# AND CDUSPOT +4.   UNLIKE CD*TR*GS, QUICTRIG DOES NOT LEAVE THE 1'S COMPLEMENT VERSIONS OF THE ANGLES IN
# CDUSPOT.   QUICTRIG'S EXECUTION TIME IS 4.1 MS;  THIS IS 10 TIMES AS FAST AS CD*TR*GS.    QUICTRIG MAY BE
# CALLED FROM INTERPRETIVE AS AN RTB OP-CODE, OR FROM BASIC VIA BANKCALL OR IBNKCALL.

QUICTRIG        EXTEND
                QXCH    TEM2
                CAF     FOUR
 +4             MASK    SIX
                TS      TEM3
                INDEX   TEM3
                CA      CDUSPOT
                TC      SPSIN
                EXTEND
                MP      BIT14           # SCALE DOWN TO MATCH INTERPRETER OUTPUTS
                INDEX   TEM3
                DXCH    SINCDU
                INDEX   TEM3
                CA      CDUSPOT
                TC      SPCOS
                EXTEND
                MP      BIT14
                INDEX   TEM3
                DXCH    COSCDU
                CCS     TEM3
                TCF     QUICTRIG +3
                TC      TEM2

# ****************************************************************************************************************
#     THESE INTERFACE ROUTINES MAKE IT POSSIBLE TO CALL AX*SR*T, ETC., IN
# INTERPRETIVE.  LATER, WHERE POSSIBLE, THEY WILL BE ELIMINATED.

#     NBSM WILL BE THE FIRST TO GO.   IT SHOULD NOT BE USED.

NBSM            STQ
                        X2
                LXC,1   VLOAD*  
                        S1              # BASE ADDRESS OF THE CDU ANGLES IS IN S1
                        0,1
                STOVL   CDUSPOT
                        32D             # VECTOR TO BE TRANSFORMED IS IN 32D
                CALL
                        TRG*NBSM
                STCALL  32D             # SINCE THERE'S NO STGOTO
                        X2

#     THESE INTERFACE ROUTINES ARE PERMANENT.   ALL RESTORE USER'S EBANK
# SETTING.   ALL ARE STRICT INTERPRETIVE SUBROUTINES, CALLED USING "CALL",
# RETURNING VIA QPRET.   ALL EXPECT AND RETURN THE VECTOR TO BE TRANSFOR-
# MED INTERPRETER-STYLE IN MPAC; COMPONENTS AT MPAC, MPAC +3, AND MPAC +5.
#
#      TRG*SMNB AND TRG*NBSM BOTH EXPECT TO SEE THE 2'S COMPLEMENT ANGLES
# AT CDUSPOT (ORDER Y Z X, AT CDUSPOT, CDUSPOT +2, AND CDUSPOT +4; ODD
# LOCATIONS NEED NOT BE ZEROED).   TRG*NBSM DOES THE NB TO SM TRANSFOR-
# MATION;  TRG*SMNB, VICE VERSA.
#
#     CDU*NBSM DOES ITS TRANSFORMATION USING THE PRESENT CONTENTS OF
# THE CDU COUNTERS.   OTHERWISE IT IS LIKE TRG*NBSM.
#
#     CDU*SMNB IS THE COMPLEMENT OF CDU*NBSM.

CDU*SMNB        EXIT
                TC      CDUTRIGS
                TCF     C*MM*N1

TRG*SMNB        EXIT
                TC      CD*TR*GS
C*MM*N1         TC      MPACVBUF        # AX*SR*T EXPECTS VECTOR IN VBUF
                CS      THREE           # SIGNAL FOR SM TO NB TRANSFORMATION
C*MM*N2         TC      AX*SR*T
                TC      INTPRET
                VLOAD   RVQ
                        VBUF

CDU*NBSM        EXIT
                TC      CDUTRIGS
                TCF     C*MM*N3

TRG*NBSM        EXIT
                TC      CD*TR*GS
C*MM*N3         TC      MPACVBUF        # FOR AX*SR*T
                CA      THREE           # SIGNAL FOR NB TO SM TRANSFORMATION
                TCF     C*MM*N2

#     *NBSM* AND *SMNB* EXPECT TO SEE THE SINES AND COSINES (AT SINCDU
# AND COSCDU) RATHER THAN THE ANGLES THEMSELVES.   OTHERWISE THEY ARE
# LIKE TRG*NBSM AND TRG*SMNB.
#
#      NOTE THAT JUST AS CD*TR*GS NEED BE CALLED ONLY ONCE FOR EACH SERIES
# OF TRANSFORMATIONS USING THE SAME ANGLES, SO TOO ONLY ONE OF TRG*NBSM
# AND TRG*SMNB NEED BE CALLED FOR EACH SERIES.   FOR SUBSEQUENT TRANSFOR-
# MATIONS USE *NBSM* AND *SMNB*.

*SMNB*          EXIT
                TCF     C*MM*N1

*NBSM*          EXIT
                TCF     C*MM*N3

#       AX*SR*T COMBINES THE OLD SMNB AND NBSM.   FOR THE NB TO SM
# TRANSFORMATION, ENTER WITH +3 IN A.   FOR SM TO NB, ENTER WITH -3.
# THE VECTOR TO BE TRANSFORMED ARRIVES, AND IS RETURNED, IN VBUF.
# AX*SR*T EXPECTS TO FIND THE SINES AND COSINES OF THE ANGLES OF ROTATION
# AT SINCDU AND COSCDU, IN THE ORDER Y Z X.  A CALL TO CD*TR*GS, WITH
# THE 2'S COMPLEMENT ANGLES (ORDER Y Z X) AT CDUSPOT, WILL TAKE CARE OF
# THIS.  HERE IS A SAMPLE CALLING SEQUENCE:-
#               TC      CDUTRIGS
#               CS      THREE           ("CA THREE" FOR NBSM)
#               TC      AX*SR*T
# THE CALL TO CD*TR*GS NEED NOT BE REPEATED, WHEN AX*SR*T IS CALLED MORE
# THAN ONCE, UNLESS THE ANGLES HAVE CHANGED.
#
#     AX*SR*T IS GUARANTEED SAFE ONLY FOR VECTORS OF MAGNITUDE LESS THAN
# UNITY.   A LOOK AT THE CASE IN WHICH A VECTOR OF GREATER MAGNITUDE
# HAPPENS TO LIE ALONG AN AXIS OF THE SYSTEM TO WHICH IT IS TO BE TRANS-
# FORMED CONVINCES ONE THAT THIS IS A RESTRICTION WHICH MUST BE ACCEPTED.

AX*SR*T         TS      DEXDEX          # WHERE IT BECOMES THE INDEX OF INDEXES
                EXTEND
                QXCH    RTNSAVER

R*TL**P         CCS     DEXDEX          #               +3 --> 0        -3 --> 2
                CS      DEXDEX          # THUS:         +2 --> 1        -2 --> 1
                AD      THREE           #               +1 --> 2        -1 --> 0
                EXTEND
                INDEX   A
                DCA     INDEXI
                DXCH    DEXI

                CA      ONE
                TS      BUF
                EXTEND
                INDEX   DEX1
                DCS     VBUF
                TCF     LOOP1           # REALLY BE A SUBTRACT, AND VICE VERSA

LOOP2           DXCH    BUF             # LOADING VECTOR COMPONENT, STORING INDEX
LOOP1           DXCH    MPAC
                CA      SINSLOC
                AD      DEX1
                TS      ADDRWD

                TC      DMPSUB          # MULTIPLY BY SIN(CDUANGLE)
                CCS     DEXDEX
                DXCH    MPAC            # NBSM CASE
                TCF     +3
                EXTEND                  # SMNB CASE
                DCS     MPAC
                DXCH    TERM1TMP

                CA      SIX             # SINCDU AND COSCDU (EACH 6 WORDS) MUST
                ADS     ADDRWD          #   BE CONSECUTIVE AND IN THAT ORDER

                EXTEND
                INDEX   BUF
                INDEX   DEX1
                DCA     VBUF
                DXCH    MPAC
                TC      DMPSUB          # MULTIPLY BY COS(CDUANGLE)
                DXCH    MPAC
                DAS     TERM1TMP
                DXCH    TERM1TMP
                DDOUBL
                INDEX   BUF
                INDEX   DEX1
                DXCH    VBUF
                DXCH    BUF             # LOADING INDEX, STORING VECTOR COMPONENT
                
                CCS     A               # 'CAUSE THAT'S WHERE THE INDEX NOW IS
                TCF     LOOP2

                EXTEND
                DIM     DEXDEX          # DECREMENT MAGNITUDE PRESERVING SIGN

TSTPOINT        CCS     DEXDEX          # ONLY THE BRANCHING FUNCTION IS USED
                TCF     R*TL**P
                TC      RTNSAVER
                TCF     R*TL**P
                TC      RTNSAVER

SINSLOC         ADRES   SINCDU          # FOR USE IN SETTING ADDRWD

INDEXI          DEC     4               # **********   DON'T   **********
                DEC     2               # **********   TOUCH   **********
                DEC     0               # **********   THESE   **********
                DEC     4               # ********** CONSTANTS **********

# ****************************************************************************************************************
# THIS SUBROUTINE COMPUTES INCREMENTAL CHANGES IN CDU(GIMBAL) ANGLES FROM INCREMENTAL CHANGES ABOUT SM AXES. IT
# REQUIRES SM INCREMENTS AS A DP VECTOR SCALED AT ONE REVOLUTION(DTHETASM,+2,+4).  SIN,COS(CDUY,Z,X) ARE IN
# SINCDU,+2,+4 AND COSCDU,+2,+4 RESPECTIVELY,SCALED TO ONE HALF. CDU INCREENTS ARE PLACED IN DCDU,+2,+4 SCALED TO
# ONE REVOLUTION.

#        *  COS(IGA)SEC(MGA)          0           -SIN(IGA)SEC(MGA) *
#        *                                                          *
#        * -COS(IGA)TAN(MGA)          1            SIN(IGA)TAN(MGA) *
#        *                                                          *
#        *      SIN(IGA)              0                COS(IGA)     *

                BANK    14
                SETLOC  POWFLIT1
                BANK
SMCDURES        DLOAD   DMP
                        DTHETASM
                        COSCDUY

                PDDL    DMP
                        DTHETASM +4
                        SINCDUY

                BDSU
                DDV
                        COSCDUZ
                STORE   DCDU

                DMP     SL1             # SCALE
                        SINCDUZ
                BDSU

                        DTHETASM +2
                STODL   DCDU +2
                        DTHETASM

                DMP     PDDL
                        SINCDUY
                        DTHETASM +4

                DMP     DAD
                        COSCDUY
                SL1
                STORE   DCDU +4
                RVQ
                
