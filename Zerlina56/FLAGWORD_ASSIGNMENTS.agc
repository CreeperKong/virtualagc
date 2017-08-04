### FILE="Main.annotation"
## Copyright:   Public domain.
## Filename:    FLAGWORD_ASSIGNMENTS.agc
## Purpose:     A log section of Zerlina 56, the final revision of
##              Don Eyles's offline development program for the variable 
##              guidance period servicer. It also includes a new P66 with LPD 
##              (Landing Point Designator) capability, based on an idea of John 
##              Young's. Neither of these advanced features were actually flown,
##              but Zerlina was also the birthplace of other big improvements to
##              Luminary including the terrain model and new (Luminary 1E)
##              analog display programs. Zerlina was branched off of Luminary 145,
##              and revision 56 includes all changes up to and including Luminary
##              183. It is therefore quite close to the Apollo 14 program,
##              Luminary 178, where not modified with new features.
## Reference:   pp. 62-89
## Assembler:   yaYUL
## Contact:     Ron Burkey <info@sandroid.org>.
## Website:     www.ibiblio.org/apollo/index.html
## Mod history: 2017-07-28 MAS  Created from Luminary 210.

## NOTE: Page numbers below have not yet been updated to reflect Zerlina 56.

## Page 63
#         FLAGWORDS 0-11 ARE DOWNLINKED AND CAN BE SET AND CLEARED BY UP-FLAG AND DOWN-FLAG INSTRUCTIONS IN THE
#                        INTERPRETER. THESE WERE PREVIOUSLY LISTED UNDER "INTERPRETIVE SWITCH BIT ASSIGNMENTS" IN
#                        THE ERASABLE LOG SECTION. FLAGWORDS 12 & 13 WEREPREVIOUSLY RADMODES AND DAPBOOLS AND
#                        ARE STILL DOWNLINKED UNDER THOSE NAMES.

#

#         ALPHABETICAL LIST OF FLAGWORDS


# 9             25              41                      61        COLUMN NO.
# FLAGWORD      DEC. NUMBER     BIT AND FLAG            BIT NAME

# ABTTGFLG      143             BIT 7 FLAG 9            ABTTGBIT
# ACCOKFLG      207             BIT 3  FLAG 13          ACCSOKAY
# ACC4-2FL      199             BIT 11 FLAG 13          ACC4OR2X
# ACMODFLG      032             BIT 13 FLAG 2           ACMODBIT
# ALTSCALE      186             BIT 9  FLAG 12          ALTSCBIT
# ANTENFLG      183             BIT 12 FLAG 12          ANTENBIT
# AORBSFLG      085             BIT 5 FLAG 5            AORBSYST
# AORBTFLG      200             BIT 10 FLAG 13          AORBTRAN
# APSESW        130             BIT 5  FLAG 8           APSESBIT
# APSFLAG       152             BIT 13 FLAG 10          APSFLBIT
# ASTNFLAG      108             BIT 12 FLAG 7           ASTNBIT
# ATTFLAG       104             BIT 1  FLAG 6           ATTFLBIT
# AUTOMODE      193             BIT 2  FLAG 12          AUTOMBIT
# AUTR1FLG      209             BIT 1  FLAG 13          AUTRATE1
# AUTR2FLG      208             BIT 2  FLAG 13          AUTRATE2
# AUXFLAG       103             BIT 2  FLAG 6           AUXFLBIT
# AVEGFLAG      115             BIT 5  FLAG 7           AVEGFBIT
# AVEMIDSW      149             BIT 1  FLAG 9           AVEMDBIT
# AVFLAG        040             BIT 5  FLAG 2           AVFLBIT
# CALCMAN2      043             BIT 2  FLAG 2           CALC2BIT
# CALCMAN3      042             BIT 3  FLAG 2           CALC3BIT
# CDESFLAG      180             BIT 15 FLAG 12          CDESBIT
# CMOONFLG      123             BIT 12 FLAG 8           CMOONBIT
# COGAFLAG      131             BIT 4  FLAG 8           COGAFBIT
# CONTRLFL      163             BIT2 FLAG 10            CONTRLBT
# CSMDKFLG      197             BIT 13 FLAG 13          CSMDOCKD
# CULTFLAG      053             BIT 7  FLAG 3           CULTBIT
# DAPBOOLS                      FLGWRD13
# DBSELFLG      206             BIT 4  FLAG 13          DBSELECT
# DBSL2FLG      205             BIT 5 FLAG 13           DBSLECT2
# DESIGFLG      185             BIT 10 FLAG 12          DESIGBIT
# DIDFLAG       016             BIT 14 FLAG 1           DIDFLBIT
# DIMOFLAG      059             BIT 1  FLAG 3           DIMOBIT

## Page 64
# DMENFLG       081             BIT 9  FLAG 5           DMENFBIT
# DRIFTDFL      202             BIT 8  FLAG 13          DRIFTBIT
# DRIFTFLG      030             BIT 15 FLAG 2           DRFTBIT
# DSKYFLAG      075             BIT 15 FLAG 5           DSKYFBIT
# D6OR9FLG      058             BIT 2  FLAG 3           D6OR9BIT
# ENGONFLG      083             BIT 7  FLAG 5           ENGONBIT
# ERADFLAG      017             BIT 13 FLAG 1           ERADFBIT
# ETPIFLAG      038             BIT 7  FLAG 2           ETPIBIT
# FINALFLG      039             BIT 6  FLAG 2           FINALBIT
# FLAGWRD0      (000-014)       (STATE +0)
# FLAGWRD1      (015-029)       (STATE +1)
# FLAGWRD2      (030-044)       (STATE +2)
# FLAGWRD3      (045-059)       (STATE +3)
# FLAGWRD4      (060-074)       (STATE +4)
# FLAGWRD5      (075-089)       (STATE +5)
# FLAGWRD6      (090-104)       (STATE +6)
# FLAGWRD7      (105-119)       (STATE +7)
# FLAGWRD8      (120-134)       (STATE +8D)
# FLAGWRD9      (135-149)       (STATE +9D)
# FLAP          142             BIT 8  FLAG 9           FLAPBIT
# FLGWRD10      (150-164)       (STATE +10D)
# FLGWRD11      (165-179)       (STATE +11D)
# FLGWRD12      (180-194)       (STATE +12D)
# FLGWRD13      (195-209)       (STATE +13D)
# FLPC          138             BIT 12 FLAG 9           FLPCBIT
# FLPI          139             BIT 11 FLAG 9           FLPIBIT
# FLRCS         149             BIT 10 FLAG 9           FLRCSBIT
# FLT59FLG      146             BIT 4 FLAG 9            FLT59BIT
# FLUNDISP      125             BIT 10 FLAG 8           FLUNDBIT
# FLVR          136             BIT 14 FLAG 9           FLVRBIT
# FREEFLAG      012             BIT 3  FLAG 0           FREEFBIT
# FRSTIME       026             BIT 4 FLAG1             FRSTMBIT
# FSPASFLG      005             BIT 10 FLAG 0           FSPASBIT
# GLOKFAIL      046             BIT 14 FLAG 3           GLOKFBIT
# GMBDRVSW      095             BIT 10 FLAG 6           GMBDRBIT
# GUESSW        028             BIT 2  FLAG 1           GUESSBIT
# HFAILFLG      167             BIT 13 FLAG 11          HFAILBIT
# HFLSHFLG      179             BIT 1  FLAG 11          HFLSHBIT
# IDLEFLAG      113             BIT 7  FLAG 7           IDLEFBIT
# IGNFLAG       107             BIT 13 FLAG 7           IGNFLBIT
# IMPULSW       036             BIT 9  FLAG 2           IMPULBIT
# IMUSE         007             BIT 8  FLAG 0           IMUSEBIT
# INFINFLG      128             BIT 7  FLAG 8           INFINBIT
# INITALGN      133             BIT 2  FLAG 8           INITABIT
# INTFLAG       151             BIT 14 FLAG 10          INTFLBIT
# INTYPFLG      056             BIT 4  FLAG 3           INTYPBIT
# ITSWICH       105             BIT 15 FLAG 7           ITSWBIT
# JSWITCH       001             BIT 14 FLAG 0           JSWCHBIT
# LETABORT      141             BIT 9  FLAG 9           LETABBIT
# LMOONFLG      124             BIT 11 FLAG 8           LMOONBIT

## Page 65
# LOKONSW       010             BIT 5  FLAG 0           LOKONBIT
# LOSCMFLG      033             BIT 12 FLAG 2           LOSCMBIT
# LRALTFLG      190             BIT 5  FLAG 12          LRALTBIT
# LRBYPASS      165             BIT 15 FLAG 11          LRBYBIT
# LRINH         172             BIT 8  FLAG 11          LRINHBIT
# LRPOSFLG      189             BIT 6  FLAG 12          LRPOSBIT
# LRVELFLG      187             BIT 8  FLAG 12          LRVELBIT
# LUNAFLAG      048             BIT 12 FLAG 3           LUNABIT
# MANUFLAG      106             BIT 14 FLAG 7           MANUFBIT
# MGLVFLAG      088             BIT 2  FLAG 5           MGLVFBIT
# MIDAVFLG      148             BIT 2  FLAG 9           MIDAVBIT
# MIDFLAG       002             BIT 13 FLAG 0           MIDFLBIT
# MID1FLAG      147             BIT 3  FLAG 9           MID1BIT
# MKOVFLAG      072             BIT 3  FLAG 4           MKOVBIT
# MOONFLAG      003             BIT 12 FLAG 0           MOONBIT
# MRKIDFLG      060             BIT 15 FLAG 4           MRKIDBIT
# MRKNVFLG      066             BIT 9  FLAG 4           MRKNVBIT
# MRUPTFLG      070             BIT 5 FLAG 4            MRUPTBIT
# MUNFLAG       097             BIT 8 FLAG 6            MUNFLBIT
# MWAITFLG      064             BIT 11 FLAG 4           MWAITBIT
# NEEDLFLG      011             BIT 4  FLAG 0           NEEDLBIT
# NEED2FLG      000             BIT 15 FLAG 0           NEED2BIT
# NEWIFLG       122             BIT 13 FLAG 8           NEWIBIT
# NJETSFLG      015             BIT 15 FLAG 1           NJETSBIT
# NODOFLAG      044             BIT 1  FLAG 2           NODOBIT
# NODOPC7       049             BIT 11 FLAG 3           NOPO7BIT
# NOLRREAD      170             BIT 10 FLAG 11          NOLRRBIT
# NORMSW        110             BIT 10 FLAG 7           NORMSBIT
# NORRMON       086             BIT 4  FLAG 5           NORRMBIT
# NOTERFLG      019             BIT 11 FLAG 1           NOTERBIT
# NOTHROTL      078             BIT 12 FLAG 5           NOTHRBIT
# NOUPFLAG      024             BIT 6  FLAG 1           NOUPFBIT
# NPGNCSFL      164             BIT  1 FLAG 10          NPGNCSBY
# NRMNVFLG      067             BIT 8  FLAG 4           NRMNVBIT
# NRMIDFLG      062             BIT 13 FLAG 4           NRMIDBIT
# NRUPTFLG      071             BIT 4  FLAG 4           NRUPTBIT
# NTARGFLG      102             BIT 3  FLAG 6           NTARGBIT
# NWAITFLG      065             BIT 10 FLAG 4           NWAITBIT
# ORBWFLAG      054             BIT 6  FLAG 3           ORBWFBIT
# ORDERSW       129             BIT 6  FLAG 8           ORDERBIT
# OURRCFLG      198             BIT 12 FLAG 13          OURRCBIT
# PDSPFLAG      076             BIT 14 FLAG 5           PDSPFBIT
# PFRATFLG      041             BIT 4  FLAG 2           PFRATBIT
# PINBRFLG      069             BIT 6  FLAG 4           PINBRBIT
# POOHFLAG      045             BIT 15 FLAG 3           POOHBIT
# PRECIFLG      052             BIT 8  FLAG 3           PRECIBIT
# PRIODFLG      061             BIT 14 FLAG 4           PRIODBIT
# PRONVFLG      068             BIT 7  FLAG 4           PRONVBIT
# PSTHIGAT      169             BIT 11 FLAG 11          PSTHIBIT
# PULSEFLG      195             BIT 15 FLAG 13          PULSES

## Page 66
# P21FLAG       004             BIT 11 FLAG 0           P21FLBIT
# P25FLAG       006             BIT 9  FLAG 0           P25FLBIT
# P66PROFL      014D            BIT 1 FLAG 0            P66PROBT
# P7071FLG      137             BIT 13 FLAG 9           P7071BIT
# QUITFLAG      145             BIT 5  FLAG 9           QUITBIT
# RADMODES                      FLGWRD12
# RASFLAG                       FLGWRD10
# RCDUFAIL      188             BIT 7  FLAG 12          RCDUFBIT
# RCDU0FLG      182             BIT 13 FLAG 12          RCDU0BIT
# REDFLAG       099             BIT 6  FLAG 6           REDFLBIT
# REFSMFLG      047             BIT 13 FLAG 3           REFSMBIT
# REINTFLG      158             BIT 7  FLAG 10          REINTBIT
# REMODFLG      181             BIT 14 FLAG 12          REMODBIT
# RENDWFLG      089             BIT 1  FLAG 5           RENDWBIT
# REPOSMON      184             BIT 11 FLAG 12          REPOSBIT
# RHCSCFLG      203             BIT 7  FLAG 13          RHCSCALE
# RNDVZFLG      008             BIT 7  FLAG 0           RNDVZBIT
# RNGEDATA      176             BIT 4  FLAG 11          RNGEDBIT
# RNGSCFLG      080             BIT 10 FLAG 5           RNGSCBIT
# RODFLAG       018             BIT 12 FLAG 1           RODFLBIT
# ROTFLAG       144             BIT 6  FLAG 9           ROTFLBIT
# RPQFLAG       120             BIT 15 FLAG 8           RPQFLBIT
# RRDATAFL      191             BIT 4  FLAG 12          RRDATABT
# RRNBSW        009             BIT 6 FLAG 0            RRNBBIT
# RRRSFLAG      192             BIT 3  FLAG 12          RRRSBIT
# RVSW          111             BIT 9  FLAG 7           RVSWBIT
# R04FLAG       051             BIT 9  FLAG 3           R04FLBIT
# R10FLAG       013             BIT 2  FLAG 0           R10FLBIT
# R12RDFLG      177D            BIT 3  FLAG 11          R12RDBIT
# R61FLAG       020             BIT 10 FLAG 1           R61FLBIT
# R77FLAG       079             BIT 11 FLAG 5           R77FLBIT
# SLOPESW       027             BIT 3  FLAG 1           SLOPEBIT
# SNUFFER       077             BIT 13 FLAG 5           SNUFFBIT
# SOLNSW        087             BIT 3  FLAG 5           SOLNSBIT
# SRCHOPTN      031             BIT 14 FLAG 2           SRCHOBIT
# STATEFLG      055             BIT 5  FLAG 3           STATEBIT
# STEERSW       034             BIT 11 FLAG 2           STEERBIT
# SURFFLAG      127             BIT 8  FLAG 8           SURFFBIT
# SWANDISP      109             BIT 11 FLAG 7           SWANDBIT
# S32.1F1       090             BIT 15 FLAG 6           S32BIT1
# S32.1F2       092             BIT 14 FLAG 6           S32BIT2
# S32.1F3A      092             BIT 13 FLAG 6           S32BIT3A
# S32.1F3B      093             BIT 12 FLAG 6           S32BIT3B
# TFFSW         119             BIT 1  FLAG 7           TFFSWBIT
# TRACKFLG      025             BIT 5  FLAG 1           TRACKBIT
# TURNONFL      194             BIT 1  FLAG 12          TURNONBT
# ULLAGFLG      204             BIT 6  FLAG 13          ULLAGER
# UPDATFLG      023             BIT 7  FLAG 1           UPDATBIT
# UPLOCKFL      116             BIT 4  FLAG 7           UPLOCBIT
# USEQRFLG      196             BIT 14 FLAG 13          USEQRJTS

## Page 67
# VEHUPFLG      022             BIT 8  FLAG 1           VEHUPBIT
# VELDATA       173             BIT 7  FLAG 11          VELDABIT
# VERIFLAG      117             BIT 3  FLAG 7           VERIFBIT
# VFAILFLG      166             BIT 14 FLAG 11          VFAILBIT
# VFLAG         050             BIT 10 FLAG 3           VFLAGBIT
# VFLSHFLG      178             BIT 2  FLAG 11          VFLSHBIT
# VINTFLAG      057             BIT 3  FLAG 3           VINTFBIT
# VXINH         168             BIT 12 FLAG 11          VXINHBIT
# V37FLAG       114             BIT 6  FLAG 7           V37FLBIT
# V67FLAG       112             BIT 8  FLAG 7           V67FLBIT
# V82EMFLG      118             BIT 2  FLAG 7           V82EMBIT
# XDELVFLG      037             BIT 8  FLAG 2           XDELVBIT
# XDSPFLAG      074             BIT 1  FLAG 4           XDSPBIT
# XORFLG        171             BIT 9  FLAG 11          XORFLBIT
# XOVINFLG      201             BIT 9  FLAG 13          XOVINHIB
# ZOOMFLAG      082             BIT 8  FLAG 5           ZOOMBIT
# 3AXISFLG      084             BIT 6 FLAG 5            3AXISBIT
# 360SW         134             BIT 1  FLAG 8           360SWBIT
#


#          ASSIGNMENT AND DESCRIPTION OF FLAGWORDS

FLAGWRD0        =               STATE           +0      #       (000-014)

                                                        #       (SET)                   (RESET)
# BIT 15 FLAG 0 (S)
NEED2FLG        =               000D                    #       DISPLAY DAP RATES       CHECK BIT 4 OF THIS
NEED2BIT        =               BIT15                   #       ON FDAI NEEDLES.        WORD FOR DISPLAY
                                                        #                               MODES (1 OR 2).

# BIT 14 FLAG 0  (S)
JSWITCH         =               001D                    #       INTEGRATION OF W        INTEGRATION OF STATE
JSWCHBIT        =               BIT14                   #       MATRIX                  VECTOR
#

# BIT 13 FLAG 0 (S)
MIDFLAG         =               002D                    #       INTEGRATION WITH        INTEGRATION WITHOUT
                                                        #       SECONDARY BODY AND      SOLAR PERTURBATIONS
MIDFLBIT        =               BIT13                   #       SOLAR PERTURBATIONS

# BIT 12 FLAG 0 (L)
MOONFLAG        =               003D                    #       MOON IS SPHERE OF       EARTH IS SPHERE OF
MOONBIT         =               BIT12                   #       INFLUENCE               INFLUENCE
#

# BIT 11 FLAG 0

## Page 68
P21FLAG         =               004D                    #       USE BASE VECTORS        1ST PASS -- CALC-
P21FLBIT        =               BIT11                   #       ALREADY CALCULATED      ULATE BASE VECTORS
#

# BIT 10 FLAG 0
FSPASFLG        =               005D                    #       FIRST PASS THROUGH      NOT FIRST PASS THRU
FSPASBIT        =               BIT10                   #       REPOSITION ROUTINE      REPOSITION ROUTINE
#

# BIT 9 FLAG 0  (S)
P25FLAG         =               006D                    #       P25 OPERATING           P25 NOT OPERATING
P25FLBIT        =               BIT9
#

# BIT 8 FLAG 0  (S)
IMUSE           =               007D                    #       IMU IN USE              IMU NOT IN USE
IMUSEBIT        =               BIT8
#

# BIT 7 FLAG 0  (S)
RNDVZFLG        =               008D                    #       P20 RUNNING (RADAR      P20 NOT RUNNING
RNDVZBIT        =               BIT7                    #       IN USE)
#

# BIT 6 FLAG 0  (S)
RRNBSW          =               009D                    #       RADAR TARGET IN         RADAR TARGET IN
RRNBBIT         =               BIT6                    #       NB COORDINATES          SM COORDINATES
#

# BIT 5 FLAG 0  (S)
LOKONSW         =               010D                    #       RADAR LOCK-ON           RADAR LOCK-ON NOT
LOKONBIT        =               BIT5                    #       DESIRED                 DESIRED
#

# BIT 4 FLAG 0  (S)
NEEDLFLG        =               011D                    #       TOTAL ATTITUDE          A/P FOLLOWING
NEEDLBIT        =               BIT4                    #       ERROR DISPLAYED         ERROR DISPLAYED
#

# BIT 3 FLAG 0
FREEFLAG        =               012D                    # (USED BY P51-53 TEMP IN MANY DIFFERENT
                                                        # ROUTINES & BY LUNAR + SOLAR EPHEMERIDES)
FREEFBIT        =               BIT3
#

# BIT 2 FLAG 0
R10FLAG         =               013D                    #       R10 OUTPUTS DATA TO     BESIDES OUTPUT WHEN
R10FLBIT        =               BIT2                    #       ALTITUDE & ALTITUDE     SET, R10 ALSO OUTPUT
                                                        #       RATE METERS ONLY        TO FORWARD & LATERAL
                                                        #                               VELOCITY CROSSPOINTR

## Page 69
#
#
P66PROFL        =               014D                    #       CONTINUE P66            STOP P66
P66PROBT        =               BIT1                    #       HORIZONTAL              HORIZONTAL VEL
                                                        #       VELOCITY NULLING        NULLING
#
#

FLAGWRD1        =               STATE           +1      #       (015-029)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 1 (S)
NJETSFLG        =               015D                    #       TWO JET RCS BURN        FOUR JET RCS BURN
NJETSBIT        =               BIT15
#

# BIT 14 FLAG 1 (L)
DIDFLAG         =               016D                    #       INERTIAL DATA IS        PERFORM DATA DISPLAY
DIDFLBIT        =               BIT14                   #       AVAILABLE               INITIALIZATION FUNCS
#

# BIT 13 FLAG 1 (S)
ERADFLAG        =               017D                    #       COMPUTE REARTH          USE CONSTANT REARTH
ERADFBIT        =               BIT13                   #       FISCHER ELLIPSOID       PAD RADIUS
#

# BIT 12 FLAG 1
RODFLAG         =               018D                    #       IF IN P66, NORMAL       IF IN P66, RE-INIT-
RODFLBIT        =               BIT12                   #       OPERATION CONTINUES.     IALIZATION IS PER-
                                                        #       RESTART CLEARS FLAG      FORMED AND FLAG IS

# BIT 11 FLAG 1
NOTERFLG        =               019D                    #       TERRAIN MODEL           TERRAIN MODEL
NOTERBIT        =               BIT11                   #       INHIBITED               PERMITTED
#

# BIT 10 FLAG 1 (L)
R61FLAG         =               020D                    #       RUN R61 LEM             RUN R65 LEM
R61FLBIT        =               BIT10

# BIT 9 FLAG 1
#               =               021D
#               =               BIT9

# BIT 8 FLAG 1  (S)

## Page 70
VEHUPFLG        =               022D                    #       CSM STATE VECTOR        LEM STATE VECTOR
VEHUPBIT        =               BIT8                    #       BEING UPDATED           BEING UPDATED
#

# BIT 7 FLAG 1  (S)
UPDATFLG        =               023D                    #       UPDATING BY MARKS       UPDATING BY MARKS
UPDATBIT        =               BIT7                    #       ALLOWED                 NOT ALLOWED
#

# BIT 6 FLAG 1  (S)
NOUPFLAG        =               024D                    #       NEITHER CSM             EITHER STATE
                                                        #       NOR LM STATE VECTOR     VECTOR MAY BE
NOUPFBIT        =               BIT6                    #       MAY BE UPDATED          UPDATED
#

# BIT 5 FLAG 1  (S)
TRACKFLG        =               025D                    #       TRACKING ALLOWED        TRACKING NOT ALLOWED
TRACKBIT        =               BIT5
#

# BIT 4 FLAG 1
FRSTIME         =               026D                    #       FIRST TIME THRU         NOT FIRST TIME THRU
FRSTMBIT        =               BIT4                    #       PREPOSITION             PREPOSITION
#

# BIT 3 FLAG 1  (S)
SLOPESW         =               027D                    #       ITERATE WITH BIAS       ITERATE WITH REGULAR
                                                        #       METHOD IN ITERATOR      FALSI METHOD IN
SLOPEBIT        =               BIT3                    #                               ITERATOR
#

# BIT 2 FLAG 1  (S)
GUESSW          =               028D                    #       NO STARTING VALUE       STARTING VALUE FOR
GUESSBIT        =               BIT2                    #       FOR ITERATION           ITERATION EXISTS
#

# BIT 1 FLAG 1
#               =               029D


FLAGWRD2        =               STATE           +2      #       (030-044)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 2 (S)
DRIFTFLG        =               030D                    #       T3RUPT CALLS GYRO       T3RUPT DOES NO GYRO
DRFTBIT         =               BIT15                   #       COMPENSATION            COMPENSATION
#
## Note: for the above flag/bit definition there is a blue vertical line separating the set and reset description
## in the comments extending from between (SET) (RESET) down to the line of BIT 14 FLAG 2.
# BIT 14 FLAG 2 (S)

## Page 71
SRCHOPTN        =               031D                    #       RADAR IN AUTOMATIC      RADAR NOT IN AUTO-
SRCHOBIT        =               BIT14                   #       SEARCH OPTION (R24)     MATIC SEARCH OPTION
#

# BIT 13 FLAG 2 (S)
ACMODFLG        =               032D                    #       MANUAL ACQUISITION      AUTO ACQUISITION
ACMODBIT        =               BIT13                   #       BY RENDESVOUS RADAR     BY RENDESVOUS RADAR
#

# BIT 12 FLAG 2 (S)
LOSCMFLG        =               033D                    #       LINE OF SIGHT BEING     LINE OF SIGHT NOT
                                                        #       COMPUTED (R21)          BEING COMPUTED
LOSCMBIT        =               BIT12
#

# BIT 11 FLAG 2 (S)
STEERSW         =               034D                    #       SUFFICIENT THRUST       INSUFFICIENT THRUST
STEERBIT        =               BIT11                   #       IS PRESENT              IS PRESENT

# BIT 10 FLAG 2 (S)
#

# BIT 9 FLAG 2 (S)
IMPULSW         =               036D                    #       MINIMUM IMPULSE         STEERING BURN (NO
                                                        #       BURN (CUTOFF TIME       CUTOFF TIME YET
IMPULBIT        =               BIT9                    #       SPECIFIED)              AVAILABLE)
#

# BIT 8 FLAG 2 (S)
XDELVFLG        =               037D                    #       EXTERNAL DELTAV VG      LAMBERT (AIMPOINT)
XDELVBIT        =               BIT8                    #       COMPUTATION             VG COMPUTATION
#

# BIT 7 FLAG 2 (S)
ETPIFLAG        =               038D                    #       ELEVATION ANGLE         TPI TIME SUPPLIED
                                                        #       SUPPLIED FOR            FOR P34,74 TO COMPUT
ETPIBIT         =               BIT7                    #       P34,74                  ELEVATION
#

# BIT 6 FLAG 2 (S)
FINALFLG        =               039D                    #       LAST PASS THROUGH       INTERIM PASS THROUGH
                                                        #       RENDEZVOUS PROGRAM      RENDEZVOUS PROGRAM
FINALBIT        =               BIT6                    #       COMPUTATIONS            COMPUTATIONS
#

# BIT 5 FLAG 2 (S)
AVFLAG          =               040D                    #       LEM IS ACTIVE           CSM IS ACTIVE
AVFLBIT         =               BIT5                    #       VEHICLE                 VEHICLE
#

## Page 72
# BIT 4 FLAG 2 (S)
PFRATFLG        =               041D                    #       PREFERRED ATTITUDE      PREFERRED ATTITUDE
PFRATBIT        =               BIT4                    #       COMPUTED                NOT COMPUTED
#

# BIT 3 FLAG 2 (S)
CALCMAN3        =               042D                    #       NO FINAL ROLL           FINAL ROLL IS
CALC3BIT        =               BIT3                    #                               NECESSARY
#

# BIT 2 FLAG 2 (S)
CALCMAN2        =               043D                    #       PERFORM MANEUVER        BYPASS STARTING
CALC2BIT        =               BIT2                    #       STARTING PROCEDURE      PROCEDURE
#

# BIT 1 FLAG 2 (S)
NODOFLAG        =               044D                    #       V37 NOT PERMITTED       V37 PERMITTED
NODOBIT         =               BIT1
#

FLAGWRD3        =               STATE           +3      #       (045-059)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 3
POOHFLAG        =               045D                    #       INHIBIT BACKWARDS       ALLOW BACKWARDS
POOHBIT         =               BIT15                   #       INTEGRATION             INTEGRATION
#

# BIT 14 FLAG 3 (S)
GLOKFAIL        =               046D                    #       GIMBAL LOCK HAS         NOT IN GIMBAL LOCK
GLOKFBIT        =               BIT14                   #       OCCURRED

# BIT 13 FLAG 3 *** PROTECTED FROM FRESH START ***
REFSMFLG        =               047D                    #       REFSMMAT GOOD           REFSMMAT NO GOOD
REFSMBIT        =               BIT13
#

# BIT 12 FLAG 3 (S)
LUNAFLAG        =               048D                    #       LUNAR LAT-LONG          EARTH LAT-LONG
LUNABIT         =               BIT12
#

# BIT 11 FLAG 3 (L)
NODOPO7        =               049D                    #       SYSTEM TESTS             SYSTEM TESTS
NOP07BIT       =               BIT11                   #       NOT ALLOWED              ALLOWED

# BIT 10 FLAG 3 (S)

## Page 73
VFLAG           =               050D                    #       LESS THAN TWO STARS     TWO STARS IN FIELD
VFLAGBIT        =               BIT10                   #       IN FIELD OF VIEW        OF VIEW
#

# BIT 9 FLAG 3  (S)
R04FLAG         =               051D                    #       R04 RUNNING             R04 NOT RUNNING
R04FLBIT        =               BIT9
#

# BIT 8 FLAG 3  (S)
PRECIFLG        =               052D                    #       NORMAL INTEGRATION      ENGAGES 4-TIME STEP
                                                        #       IN POO                  (POO) LOGIC IN INTE-
PRECIBIT        =               BIT8                    #                               GRATION
#

# BIT 7 FLAG 3  (S)
CULTFLAG        =               053D                    #       STAR OCCULTED           STAR NOT OCCULTED
CULTBIT         =               BIT7
#

# BIT 6 FLAG 3  (S)
ORBWFLAG        =               054D                    #       W MATRIX VALID FOR      W MATRIX INVALID FOR
ORBWFBIT        =               BIT6                    #       ORBITAL NAVIGATION      ORBITAL NAVIGATION
#

# BIT 5 FLAG 3  (S)
STATEFLG        =               055D                    #       PERMANENT STATE         PERMANENT STATE
STATEBIT        =               BIT5                    #       VECTOR UPDATED          VECTOR NOT UPDATED
#

# BIT 4 FLAG 3  (S)
INTYPFLG        =               056D                    #       CONIC INTEGRATION       ENCKE INTEGRATION
INTYPBIT        =               BIT4
#

# BIT 3 FLAG 3  (S)
VINTFLAG        =               057D                    #       CSM STATE VECTOR        LEM STATE VECTOR
VINTFBIT        =               BIT3                    #       BEING INTEGRATED        BEING INTEGRATED
#

# BIT 2 FLAG 3 (S)
D6OR9FLG        =               058D                    #       DIMENSION OF W IS 9     DIMENSION OF W IS 6
D6OR9BIT        =               BIT2                    #       FOR INTEGRATION         FOR INTEGRATION
#

# BIT 1 FLAG 3  (S)
DIM0FLAG        =               059D                    #       W MATRIX IS TO BE       W MATRIX IS NOT TO
DIM0BIT         =               BIT1                    #       USED                    BE USED
#

## Page 74
FLAGWRD4        =               STATE           +4      #       (060-074)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 4 (S)
MRKIDFLG        =               060D                    #       MARK DISPLAY IN         NO MARK DISPLAY IN
MRKIDBIT        =               BIT15                   #       ENDIDLE                 ENDIDLE
#

# BIT 14 FLAG 4 (S)
PRIODFLG        =               061D                    #       PRIORITY DISPLAY IN     NO PRIORITY DISPLAY
PRIODBIT        =               BIT14                   #       ENDIDLE                 IN ENDIDLE
#

# BIT 13 FLAG 4 (S)
NRMIDFLG        =               062D                    #       NORMAL DISPLAY IN       NO NORMAL DISPLAY
NRMIDBIT        =               BIT13                   #       ENDIDLE                 IN ENDIDLE
#

# BIT 12 FLAG 4 (S)
# CODE IN        =               063D
# DISPLAY AREA   REFERS TO THIS BIT; CHANGES NEEDED IF USED IN FUTURE.

# BIT 11 FLAG 4 (S)
MWAITFLG        =               064D                    #       HIGHER PRIORITY         NO HIGHER PRIORITY
                                                        #       DISPLAY OPERATING       DISPLAY OPERATING
MWAITBIT        =               BIT11                   #       WHEN MARK DISPLAY       WHEN MARK DISPLAY
                                                        #       INITIATED       	INITIATED

# BIT 10 FLAG 4 (S)
NWAITFLG        =               065D                    #       HIGHER PRIORITY         NO HIGHER PRIORITY
                                                        #       DISPLAY OPERATING       DISPLAY OPERATING
NWAITBIT        =               BIT10                   #       WHEN NORMAL             WHEN NORMAL DISPLAY
                                                        #       DISPLAY INITIATED       INITIATED

# BIT 9 FLAG 4  (S)
MRKNVFLG        =               066D                    #       ASTRONAUT USING         ASTRONAUT NOT USING
                                                        #       KEYBOARD WHEN MARK      KEYBOARD WHEN MARK
MRKNVBIT        =               BIT9                    #       DISPLAY INITIATED       DISPLAY INITIATED
#

# BIT 8 FLAG 4  (S)
NRMNVFLG        =               067D                    #       ASTRONAUT USING         ASTRONAUT NOT USING
                                                        #       KEYBOARD WHEN           KEYBOARD WHEN
NRMNVBIT        =               BIT8                    #       NORMAL DISPLAY          NORMAL DISPLAY
                                                        #       INITIATED               INITIATED

# BIT 7 FLAG 4  (S)
PRONVFLG        =               068D                    #       ASTRONAUT USING         ASTRONAUT NOT USING

## Page 75
                                                        #       KEYBOARD WHEN           KEYBOARD WHEN
PRONVBIT        =               BIT7                    #       PRIORITY DISPLAY        PRIORITY DISPLAY
                                                        #       INITIATED               INITIATED

# BIT 6 FLAG 4  (S)
PINBRFLG        =               069D                    #       ASTRONAUT HAS           ASTRONAUT HAS NOT
                                                        #       INTERFERED WITH         INTERFERED WITH
PINBRBIT        =               BIT6                    #       EXISTING DISPLAY        EXISTING DISPLAY
#

# BIT 5 FLAG 4  (S)
MRUPTFLG        =               070D                    #       MARK DISPLAY            MARK DISPLAY NOT
                                                        #       INTERRUPTED BY          INTERRUPTED BY
MRUPTBIT        =               BIT5                    #       PRIORITY DISPLAY        PRIORITY DISPLAY
#

# BIT 4 FLAG 4  (S)
NRUPTFLG        =               071D                    #       NORMAL DISPLAY          NORMAL DISPLAY NOT
                                                        #       INTERRUPTED BY          INTERRUPTED BY
NRUPTBIT        =               BIT4                    #       PRIORITY OR MARK        PRIORITY OR MARK
                                                        #       DISPLAY                 DISPLAY

# BIT 3 FLAG 4  (S)
MKOVFLAG        =               072D                    #       MARK DISPLAY OVER       NO MARK DISPLAY OVER
MKOVBIT         =               BIT3                    #       NORMAL                  NORMAL

# BIT 2 FLAG 4
#               =               073D


# BIT 1 FLAG 4  (S)
XDSPFLAG        =               074D                    #       MARK DISPLAY NOT        NO SPECIAL MARK
XDSPBIT         =               BIT1                    #       TO BE INTERRUPTED       INFORMATION
#

FLAGWRD5        =               STATE           +5      #       (075-089)
                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 5 (S)
DSKYFLAG        =               075D                    #       DISPLAYS SENT TO        NO DISPLAYS TO DSKY
DSKYFBIT        =               BIT15                   #       DSKY

# BIT 14 FLAG 5
PDSPFLAG        =               076D                    #       R60 DOES PRIO DSP.      R60 DOES NORMAL DSP.
PDSPFBIT        =               BIT14                   #       AND IS RESTART          AND IS NOT RESTORTED
                                                        #       PROTECTED.

## Page 76
# BIT 13 FLAG 5 (S,L)
SNUFFER         =               077D                    #       U,V JETS DISABLED       U,V JETS ENABLED
                                                        #       DURING DPS              DURING DPS
SNUFFBIT        =               BIT13                   #       BURNS (V65)             BURNS (V75)
#

# BIT 12 FLAG 5 (S)
NOTHROTL        =               078D                    #       INHIBIT FULL            PERMIT FULL THROTTLE
NOTHRBIT        =               BIT12                   #       THROTTLE
#

# BIT 11 FLAG 5 (S,L)
R77FLAG         =               079D                    #       R77 IS ON,              R77 IS NOT ON.
                                                        #       SUPPRESS ALL RADAR
                                                        #       ALARMS AND TRACKER
R77FLBIT        =               BIT11                   #       FAILS
#

# BIT 10 FLAG 5 (S)
RNGSCFLG        =               080D                    #       SCALE CHANGE HAS        NO SCALE CHANGE HAS
                                                        #       OCCURRED DURING         OCCURRED DURING
RNGSCBIT        =               BIT10                   #       RR READING              RR READING
#

# BIT 9 FLAG 5  (S)
DMENFLG         =               081D                    #       DIMENSION OF W IS 9     DIMENSION OF W IS 6
DMENFBIT        =               BIT9                    #       FOR INCORPORATION       FOR INCORPORATION
#

# BIT 8 FLAG 5  (S)
ZOOMFLAG        =               082D                    #       THROTTLE-UP HAS         THROTTLE-UP HAS NOT
ZOOMBIT         =               BIT8                    #       OCCURRED IN P63.        YET OCCURRED IN P63.
#

# BIT 7 FLAG 5  (S)
ENGONFLG        =               083D                    #       ENGINE TURNED ON        ENGINE TURNED OFF
ENGONBIT        =               BIT7                    #
#

# BIT 6 FLAG 5  (S)
3AXISFLG        =               084D                    #       MANEUVER SPECIFIED      MANEUVER SPECIFIED
                                                        #       BY THREE AXES           BY ONE AXIS; R60
3AXISBIT        =               BIT6                    #                               CALLS VECPOINT.
#

# BIT 5 FLAG 5
AORBSFLG        =               085D                    #       PREFER PAXIS JET        PREFER PAXIS JET
AORBSYST        =               BIT5                    #       PAIRS 7,15 AND 8,16     PAIRS 4,12 AND 3,11
#

## Page 77
# BIT 4 FLAG 5  (S)
NORRMON         =               086D                    #       BYPASS RR GIMBAL        PERFORM
NORRMBIT        =               BIT4                    #       MONITOR                 RR GIMBAL MONITOR
#

# BIT 3 FLAG 5  (S)
SOLNSW          =               087D                    #       LAMBERT DOES NOT        LAMBERT CONVERGES OR
                                                        #       CONVERGE, OR TIME-RAD   TIME-RADIUS NON
SOLNSBIT        =               BIT3                    #       NEARLY CIRCULAR         CIRCULAR
#

# BIT 2 FLAG 5  (S)
MGLVFLAG        =               088D                    #       LOCAL VERTICAL          MIDDLE GIMBAL ANGLE
                                                        #       COORDINATES             COMPUTED
MGLVFBIT        =               BIT2                    #       COMPUTED
#

# BIT 1 FLAG 5  (S)
RENDWFLG        =               089D                    #       W MATRIX VALID          W MATRIX INVALID
                                                        #       FOR RENDEZVOUS          FOR RENDEZVOUS
RENDWBIT        =               BIT1                    #       NAVIGATION              NAVIGATION
#

FLAGWRD6        =               STATE           +6      #       (090-104)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 6 (S)
S32.1F1         =               090D                    #       DELTA V AT CSI TIME     DVT1 LESS THEN MAX
S32BIT1         =               BIT15                   #       ONE EXCEEDS MAX
#

# BIT 14 FLAG 6 (S)
S32.1F2         =               091D                    #       FIRST PASS OF           REITERATION OF
S32BIT2         =               BIT14                   #       NEWTON ITERATION        NEWTON
#

# BIT 13 FLAG 6 (S)
S32.1F3A        =               092D                    #       BIT 13 AND BIT 12 FUNCTION AS AN ORDERED
S32BIT3A        =               BIT13                   #       PAIR (13,12) INDICATING THE POSSIBLE OC-
                                                        #       CURRANCE OF 2 NEWTON ITERATIONS FOR S32.1
                                                        #       IN THE PROGRAM IN THE FOLLOWING ORDER:
# BIT 12 FLAG 6                                                 (0,1) (I.E. BIT 13 RESET,BIT 12 SET)
S32.1F3B        =               093D                    #            = FIRST NEWTON ITERATION BEING DONE
S32BIT3B        =               BIT12                   #       (0,0)= FIRST PASS OF SECOND NEWT.ITERAT.
                                                        #       (1,1)= 50 FT/SEC STAGE OF SEC. NEWT.ITER
                                                        #       (1,0)= REMAINDER OF SECOND NEWTON ITERA.


# BIT 11 FLAG 6 (S)

## Page 78
#

# BIT 10 FLAG 6 (S)
GMBDRVSW        =               095D                    #       TRIMGIMB OVER           TRIMGIMB NOT OVER
GMBDRBIT        =               BIT10                   #
#

# BIT 9 FLAG 6
#               =               096D  
#               =               BIT9 
#

# BIT 8 FLAG 6  (S)
MUNFLAG         =               097D                    #       SERVICER CALLS          SERVICER CALLS
MUNFLBIT        =               BIT8                    #       MUNRVG                  CALCRVG
#

# BIT 7 FLAG 6  (L)
                =               098D 
                =               BIT7 
#

# BIT 6 FLAG 6  (L)
REDFLAG         =               099D                    #       LANDING SITE            LANDING SITE
                                                        #       REDESIGNATION           REDESIGNATION NOT
REDFLBIT        =               BIT6                    #       PERMITTED               PERMITTED
#

# BIT 5 FLAG 6
#               =               100D 
#

# BIT 4 FLAG 6
#               =               101D 
#

# BIT 3 FLAG 6  (S)
NTARGFLG        =               102D                    #       ASTRONAUT DID           ASTRONAUT DID NOT
                                                        #       OVERWRITE DELTA         OVERWRITE DELTA
NTARGBIT        =               BIT3                    #       VELOCITY AT TPI         VELOCITY
                                                        #       OR TPM (P34,35)

# BIT 2 FLAG 6
AUXFLAG         =               103D                    #       PROVIDING IDLEFLAG      SERVICER WILL SKIP
AUXFLBIT        =               BIT2                    #       IS NOT SET, SERV-       DVMON ON ITS NEXT
                                                        #       ICER WILL EXERCISE      PASS EVEN IF THE
                                                        #       DVMON ON ITS NEXT       IDLEFLAG IS NOT SET.
                                                        #       PASS.                   IT WILL THEN SET
                                                        #                               AUXFLAG.

# BIT 1 FLAG 6  (L)

## Page 79
ATTFLAG         =               104D                    #       LEM ATTITUDE EXISTS     NO LEM ATTITUDE
                                                        #       IN MOON-FIXED           AVAILABLE IN MOON-
ATTFLBIT        =               BIT1                    #       COORDINATES             FIXED COORDINATES
#

FLAGWRD7        =               STATE           +7      #       (105-119)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 7 (S)
ITSWICH         =               105D                    #       R34;TPI TIME TO BE      TPI HAS BEEN
ITSWBIT         =               BIT15                   #       COMPUTED                COMPUTED
#

# BIT 14 FLAG 7 (S)
MANUFLAG        =               106D                    #       ATTITUDE MANEUVER       NO ATTITUDE MANEUVER
                                                        #       GOING DURING RR         DURING RR SEARCH
MANUFBIT        =               BIT14                   #       SEARCH
#

# BIT 13 FLAG 7 (S)
IGNFLAG         =               107D                    #       TIG HAS ARRIVED         TIG HAS NOT ARRIVED
IGNFLBIT        =               BIT13                   #
#

# BIT 12 FLAG 7 (S)
ASTNFLAG        =               108D                    #       ASTRONAUT HAS           ASTRONAUT HAS NOT
ASTNBIT         =               BIT12                   #       OKAYED IGNITION         OKAYED IGNITION
#

# BIT 11 FLAG 7 (L)
SWANDISP        =               109D                    #       LANDING ANALOG          LANDING ANALOG
SWANDBIT        =               BIT11                   #       DISPLAYS ENABLED        DISPLAYS SUPPRESSED
#

# BIT 10 FLAG 7 (S)
NORMSW          =               110D                    #       UNIT NORMAL INPUT       LAMBERT COMPUTES ITS
NORMSBIT        =               BIT10                   #       TO LAMBERT              OWN UNIT NORMAL
#

# BIT 9 FLAG 7  (S)
RVSW            =               111D                    #       DO NOT COMPUTE          COMPUTE FINAL STATE
                                                        #       FINAL STATE VECTOR      VECTOR IN TIME-THETA
RVSWBIT         =               BIT9                    #       IN TIME-THETA
#

# BIT 8 FLAG 7  (S)
V67FLAG         =               112D                    #       ASTRONAUT OVERWRITE     ASTRONAUT DOES NOT
                                                        #       W-MATRIX INITIAL        OVERWRITE W-MATRIX
V67FLBIT        =               BIT8                    #       VALUES                  INITIAL VALUES

## Page 80
#

# BIT 7 FLAG 7  (S)
IDLEFLAG        =               113D                    #       NO DV MONITOR           CONNECT DV MONITOR
IDLEFBIT        =               BIT7                    #
#

# BIT 6 FLAG 7  (S)
V37FLAG         =               114D                    #       AVERAGEG (SERVICER)     AVERAGEG (SERVICER)
V37FLBIT        =               BIT6                    #       RUNNING                 OFF
#

# BIT 5 FLAG 7  (S)
AVEGFLAG        =               115D                    #       AVERAGEG (SERVICER)     AVERAGEG (SERVICER)
AVEGFBIT        =               BIT5                    #       DESIRED                 NOT DESIRED
#

# BIT 4 FLAG 7  (S)
UPLOCKFL        =               116D                    #       K-KBAR-K FAIL           NO K-KBAR-K FAIL
UPLOCBIT        =               BIT4                    #
#

# BIT 3 FLAG 7  (S)
VERIFLAG        =               117D                    #       CHANGED WHEN V33E OCCURS AT END OF P27
VERIFBIT        =               BIT3                    #
#

# BIT 2 FLAG 7  (L,C)
V82EMFLG        =               118D                    #       MOON VICINITY           EARTH VICINITY
V82EMBIT        =               BIT2                    #
#

# BIT 1 FLAG 7  (S)
TFFSW           =               119D                    #       CALCULATE TPERIGEE      CALCULATE TFF
TFFSWBIT        =               BIT1                    #
#

FLAGWRD8        =               STATE +8D               #       (120-134)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 8 (S)
RPQFLAG         =               120D                    #       RPQ NOT COMPUTED        RPQ COMPUTED
                                                        #       (RPQ = VECTOR BE-
RPQFLBIT        =               BIT15                   #       TWEEN SECONDARY BODY
                                                        #       AND PRIMARY BODY

# BIT 14 FLAG 8
#               =               121D

## Page 81
#               =               BIT14                 

# BIT 13 FLAG 8 (S)
NEWIFLG         =               122D                    #       FIRST PASS THROUGH      SUCCEEDING ITERATION
NEWIBIT         =               BIT13                   #       INTEGRATION             OF INTEGRATION
#

# BIT 12 FLAG 8 *** PROTECTED FROM FRESH START ***
CMOONFLG        =               123D                    #       PERMANENT CSM STATE     PERMANENT CSM STATE
CMOONBIT        =               BIT12                   #       IN LUNAR SPHERE         IN EARTH SPHERE
#

# BIT 11 FLAG 8 *** PROTECTED FROM FRESH START ***
LMOONFLG        =               124D                    #       PERMANENT LM STATE      PERMANENT LM STATE
LMOONBIT        =               BIT11                   #       IN LUNAR SPHERE         IN EARTH SPHERE
#

# BIT 10 FLAG 8 (L)
FLUNDISP        =               125D                    #       CURRENT GUIDANCE        CURRENT GUIDANCE
FLUNDBIT        =               BIT10                   #       DISPLAYS INHIBITED      DISPLAYS PERMITTED
#

# BIT 9 FLAG 8  (L)
#               =               126D 
#               =               BIT9
#

# BIT 8 FLAG 8  *** PROTECTED FROM FRESH START ***
SURFFLAG        =               127D                    #       LM ON LUNAR SURFACE     LM NOT ON LUNAR
SURFFBIT        =               BIT8                    #                               SURFACE
#

# BIT 7 FLAG 8  (S)
INFINFLG        =               128D                    #       NO CONIC SOLUTION       CONIC SOLUTION
                                                        #       (CLOSURE THROUGH        EXISTS
INFINBIT        =               BIT7                    #       INFINITY REQUIRED)
#

# BIT 6 FLAG 8  (S)
ORDERSW         =               129D                    #       ITERATOR USES 2ND       ITERATOR USES 1ST
ORDERBIT        =               BIT6                    #       ORDER MINIMUM MODE      ORDER STANDARD MODE
#

# BIT 5 FLAG 8  (S)
APSESW          =               130D                    #       RDESIRED OUTSIDE        RDESIRED INSIDE
                                                        #       PERICENTER-APOCENTER    PERICENTER-APOCENTER
APSESBIT        =               BIT5                    #       RANGE IN TIME-RADI      RANGE IN TIME-RADIUS
#

## Page 82
# BIT 4 FLAG 8  (S)
COGAFLAG        =               131D                    #       NO CONIC SOLUTION -     CONIC SOLUTION
                                                        #       TOO CLOSE TO RECTI-     EXISTS (COGA DOES NOT
COGAFBIT        =               BIT4                    #       LINEAR (COGA OVRFLWS)   OVERFLOW)
#

# BIT 3 FLAG 8
#               =               132D                   

# BIT 2 FLAG 8  (L)
INITALGN        =               133D                    #       INITIAL PASS THRU       SECOND PASS THRU P57
INITABIT        =               BIT2                    #       P57                     (CHECK RESET-MILLARD)
#

# BIT 1 FLAG 8  (S)
360SW           =               134D                    #       TRANSFER ANGLE NEAR     TRANSFER ANGLE NOT
360SWBIT        =               BIT1                    #       360 DEGREES             NEAR 360 DEGREES
#

FLAGWRD9        =               STATE           +9D     #       (135-149)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 9
#               =               135D                    
#               =               BIT15                   

# BIT 14 FLAG 9 (L)
FLVR            =               136D                    #       VERTICAL RISE           NON-VERTICAL RISE
FLVRBIT         =               BIT14                   #       (ASCENT GUIDANCE)
#

# BIT 13 FLAG 9
P7071FLG        =               137D                    #       P70 OR P71 IS USING     P12 IS USING THE
P7071BIT        =               BIT13                   #       ASCENT GUID. EQS.       ASCENT GUID. EQS.
#

# BIT 12 FLAG 9 (L)
FLPC            =               138D                    #       NO POSITION CONTROL     POSITION CONTROL
FLPCBIT         =               BIT12                   #       (ASCENT GUIDANCE)
#

# BIT 11 FLAG 9 (L)
FLPI            =               139D                    #       PRE-IGNITION PHASE      REGULAR GUIDANCE
FLPIBIT         =               BIT11                   #       (ASCENT GUIDANCE)
#

# BIT 10 FLAG 9 (L)
FLRCS           =               140D                    #       RCS INJECTION MODE      MAIN ENGINE MODE

## Page 83
FLRCSBIT        =               BIT10                   #       (ASCENT GUIDANCE)
#

# BIT 9 FLAG 9  (L)
LETABORT        =               141D                    #       ABORT PROGRAMS          ABORT PROGRAMS
LETABBIT        =               BIT9                    #       ARE ENABLED             ARE NOT ENABLED
#

# BIT 8 FLAG 9  (L)
FLAP            =               142D                    #       APS CONTINUED ABORT     APS ABORT IS NOT A
                                                        #       AFTER DPS STAGING      CONTINUATION
FLAPBIT         =               BIT8                    #       (ASCENT GUIDANCE)
#

# BIT 7 FLAG 9  (L)
ABTTGFLG        =               143D                    #       J2,K2 PARAMETERS        J1,K1 PARAMETERS
ABTTGBIT        =               BIT7                    #       USED FOR ABORT          USED FOR ABORT
                                                        #       TARGETING               TARGETING
#

# BIT 6 FLAG 9  (L)
ROTFLAG         =               144D                    #       P70 AND P71 WILL        P70 AND P71 WILL NOT
ROTFLBIT        =               BIT6                    #       FORCE VEHICLE           FORCE VEHICLE
                                                        #       ROTATION IN THE         ROTATION IN THE
                                                        #       PREFERRED DIRECTION.     PREFERRED DIRECTION

# BIT 5 FLAG 9  (S)
QUITFLAG        =               145D                    #       DISCONTINUE INTEGR.     CONTINUE INTEGRATION
QUITBIT         =               BIT5                    #

# BIT 4 FLAG 9
FLT59FLG        =               146D                    #       LUNAR SURFACE MARK      NORMAL MARKING TO BE
FLT59BIT        =               BIT4                    #       PROCEDURE USED          USED DURING INFLITE
                                                        #       DURING INFLITE ALGN     ALIGNMENT
# BIT 3 FLAG 9  (L)
MID1FLAG        =               147D                    #       INTEGRATE TO TDEC       INTEGRATE TO THE
MID1FBIT        =               BIT3                    #                               THEN-PRESENT TIME
#

# BIT 2 FLAG 9  (L)
MIDAVFLG        =               148D                    #       INTEGRATION ENTERED     INTEGRATION WAS
                                                        #       FROM ONE OF MIDTOAV     NOT ENTERED VIA
MIDAVBIT        =               BIT2                    #       PORTALS                 MIDTOAV

# BIT 1 FLAG 9  (S)
AVEMIDSW        =               149D                    #       AVETOMID CALLING        NO AVETOMID W INTEGR
                                                        #       FOR W.MATRIX INTEGR     ALLOW SET UP RM, VN,
AVEMDBIT        =               BIT1                    #       DONT WRITE OVER RN,     PIPTIME
                                                        #       VN,PIPTIME

## Page 84
#

RASFLAG         EQUALS          FLGWRD10                #       WAS ONLY AN INSTALL -ERASTALL FLAG
#

FLGWRD10        =               STATE           +10D    #       (150-164)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 10
#               =               150D                   

# BIT 14 FLAG 10 (L,C)
INTFLAG         =               151D                    #       INTEGRATION IN          INTEGRATION NOT IN
INTFLBIT        =               BIT14                   #       PROGRESS                PROGRESS
#

# BIT 13 FLAG 10 (S,L)
APSFLAG         =               152D                    #       ASCENT STAGE            DESCENT STAGE
APSFLBIT        =               BIT13                   #       *** PROTECTED FROM FRESH START ***

# BIT 12 FLAG 10
#               =               153D                    

# BIT 11 FLAG 10
#               =               154D                    

# BIT 10 FLAG 10
#               =               155D                    

# BIT 9 FLAG 10
#               =               156D                    

# BIT 8 FLAG 10
#               =               157D                    

# BIT 7 FLAG 10 (L,C)
REINTFLG        =               158D                    #       INTEGRATION ROUTINE     INTEGRATION ROUTINE
REINTBIT        =               BIT7                    #       TO BE RESTARTED         NOT TO BE RESTARTED

# BIT 6 FLAG 10
#               =               159D                   

## Page 85

# BIT 5 FLAG 10
#               =               160D                    

# BIT 4 FLAG 10
#               =               161D                    

# BIT 3 FLAG 10
#               =               162D                    

# BIT 2 FLAG 10
CONTRLFL        =               163D                    #       DAP CONTROLLING         DAP NOT CONTROLLING
CONTRLBT        =               BIT2                    #       VEHICLE ATTITUDE        VEHICLE ATTITUDE
#

# BIT 1 FLAG 10
NPGNCSFL        =               164D                    #       LAST ACTIVE DAP         LAST ACTIVE DAP
NPGNCSBT        =               BIT1                    #       PASS DONE WITH AN       PASS DONE WITH A
                                                        #       AGS INDICATION          PGNCS INDICATION
#


FLGWRD11        =               STATE           +11D    #       (165-179)

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 11 (L)(R12)
LRBYPASS        =               165D                    #       BYPASS ALL LANDING      DO NOT BYPASS LR
LRBYBIT         =               BIT15                   #       RADAR UPDATES           UPDATES
#

# BIT 14 FLAG 11
VFAILFLG        =               166D                    #       LANDING RADAR VEL       LANDING RADAR VEL
VFAILBIT        =               BIT14                   #       FAILED REAS TEST        PASS REAS TEST
#

# BIT 13 FLAG 11
HFAILFLG        =               167D                    #       LANDING RADAR ALT       LANDING RADAR VEL
HFAILBIT        =               BIT13                   #       FAILED REAS TEST        PASS REAS TEST
#

# BIT 12 FLAG 11 (L)(R12)
VXINH           =               168D                    #       IF Z VELOCITY DATA      UPDATE X AXIS
                                                        #       UNREASONABLE,           VELOCITY
VXINHBIT        =               BIT12                   #       BYPASS X VELOCITY
                                                        #       UPDATE ON NEXT PASS

## Page 86
# BIT 11 FLAG 11 (L)(R12)
PSTHIGAT        =               169D                    #       PAST HIGATE             PREHIGATE
PSTHIBIT        =               BIT11                   #
#

# BIT 10 FLAG 11 (L)(R12)
NOLRREAD        =               170D                    #       LANDING RADAR           LR NOT REPOSITIONING
                                                        #       REPOSITIONING;
NOLRRBIT        =               BIT10                   #       BYPASS UPDATE
#

# BIT 9 FLAG 11 (L)(R12)
XORFLG          =               171D                    #       BELOW LIMIT             ABOVE LIMIT DO
                                                        #       INHIBIT X AXIS          NOT INHIBIT
XORFLBIT        =               BIT9                    #       OVERRIDE
#

# BIT 8 FLAG 11
LRINH           =               172D                    #       LANDING RADAR UP-       LR UPDATES INHIBITED
LRINHBIT        =               BIT8                    #       DATES PERMITTED         BY ASTRONAUT
                                                        #       BY ASTRONAUT

# BIT 7 FLAG 11 (L)(R12)
VELDATA         =               173D                    #       LR VELOCITY             LR VELOCITY MEASURE
VELDABIT        =               BIT7                    #       MEASUREMENT MADE        NOT MADE
#

# BIT 6 FLAG 11
#               =               174D
#               =               BIT6
#

# BIT 5 FLAG 11 (L)(R12)
#               =               175D
#               =               BIT5
#

# BIT 4 FLAG 11 (L)(R12)
RNGEDATA        =               176D                    #       LR ALTITUDE             LR ALTITUDE MEASURE
RNGEDBIT        =               BIT4                    #       MEASUREMENT MADE        NOT MADE
#

# BIT 3 FLAG 11
R12RDFLG        =               177D                    #       WAIT UNTIL ALL VEL      ALLOW R12 PROCESS-
R12RDBIT        =               BIT3                    #       READS DONE BEFORE       ING OF VELDATA;
                                                        #       R12 PROCESSING          LR VEL READ DONE
#

# BIT 2 FLAG 11 (L)(R12)

## Page 87
VFLSHFLG        =               178D                    #       LR VELOCITY FAIL        LR VEL FAIL LAMP
VFLSHBIT        =               BIT2                    #       LAMP SHOULD BE          SHOULDN'T FLASH
                                                        #       FLASHING

# BIT 1 FLAG 11 (L)(R12)
HFLSHFLG        =               179D                    #       LR ALTITUDE FAIL        LR ALTITUDE FAIL
HFLSHBIT        =               BIT1                    #       LAMP SHOULD BE          LAMP SHOULD NOT BE
                                                        #       FLASHING                FLASHING

RADMODES        EQUALS          FLGWRD12                #       RADAR FLAG WORD


FLGWRD12        =               STATE           +12D    #       (180-194)       WAS RADMODES

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 12
CDESFLAG        =               180D                    #       CONTINUOUS DESIG-       LGC CHECKS FOR LOCK-
CDESBIT         =               BIT15                   #       NATE. LGC COMMANDS      ON WHEN ANTENNA
                                                        #       RR REGARDLESS OF        BEING DESIGNATED
                                                        #       LOCK-ON

# BIT 14 FLAG 12
REMODFLG        =               181D                    #       CHANGE IN ANTENNA       NO REMODE REQUESTED
REMODBIT        =               BIT14                   #       MODE BEEN REQUESTED     OR OCCURRING
                                                        #       I.E., REMODE

# BIT 13 FLAG 12
RCDU0FLG        =               182D                    #       RR CDU'S BEING          RR CDU'S NOT BEING
RCDU0BIT        =               BIT13                   #       ZEROED                  ZEROED
#

# BIT 12 FLAG 12
ANTENFLG        =               183D                    #       RR ANTENNA MODE IS      RR ANTENNA IN MODE 1
ANTENBIT        =               BIT12                   #       MODE 2
#

# BIT 11 FLAG 12
REPOSMON        =               184D                    #       REPOSITION MONITOR.     NO REPOSITION TAKING
REPOSBIT        =               BIT11                   #       RR REPOSITION IS        PLACE
                                                        #       TAKING PLACE

# BIT 10 FLAG 12
DESIGFLG        =               185D                    #       RR DESIGNATE            RR DESIGNATE NOT
DESIGBIT        =               BIT10                   #       REQUESTED OR IN         REQUESTED OR IN

## Page 88
                                                        #       PROGRESS                PROGRESS

# BIT 9 FLAG 12
ALTSCALE        =               186D                    #       LR ALTITUDE READING     LR ALTITUDE READING
ALTSCBIT        =               BIT9                    #       IS ON HIGH SCALE        IS ON LOW SCALE
#

# BIT 8 FLAG 12
LRVELFLG        =               187D                    #       LR VELOCITY DATA        NO LR VELOCITY DATA
LRVELBIT        =               BIT8                    #       FAIL                    FAIL
#

# BIT 7 FLAG 12
RCDUFAIL        =               188D                    #       RR CDU FAIL HAS         RR CDU FAIL OCCURRED
RCDUFBIT        =               BIT7                    #       NOT OCCURRED
#

# BIT 6 FLAG 12
LRPOSFLG        =               189D                    #       LANDING RADAR           LR POSITION 1
LRPOSBIT        =               BIT6                    #       POSITION 2
#

# BIT 5 FLAG 12
LRALTFLG        =               190D                    #       LR ALTITUDE DATA        NO LR ALTITUDE DATA
LRALTBIT        =               BIT5                    #       FAIL.  COULD NOT BE     FAIL
                                                        #       READ SUCCESSFULLY.
#

# BIT 4 FLAG 12
RRDATAFL        =               191D                    #       RR DATA FAIL.           NO RR DATA FAIL.
RRDATABT        =               BIT4                    #       DATA COULD NOT BE
                                                        #       READ SUCCESSFULLY
#

# BIT 3 FLAG 12
RRRSFLAG        =               192D                    #       RR RANGE READING        RR RANGE READING ON
RRRSBIT         =               BIT3                    #       ON THE HIGH SCALE       THE LOW SCALE
#

# BIT 2 FLAG 12
AUTOMODE        =               193D                    #       RR NOT IN AUTO MODE.    RR IN AUTO MODE
AUTOMBIT        =               BIT2                    #       AUTO MODE DISCRETE
                                                        #       IS NOT PRESENT
#

# BIT 1 FLAG 12
TURNONFL        =               194D                    #       RR TURN-ON SEQUENCE     NO RR TURN-ON
TURNONBT        =               BIT1                    #       IN PROGRESS. (ZERO      SEQUENCE IN PROGRESS
                                                        #       CDU'S, FIX ANTENNA

## Page 89
                                                        #       MODE)
#

DAPBOOLS        EQUALS          FLGWRD13                #       DIGITAL AUTOPILOT FLAGWORD

FLGWRD13        =               STATE           +13D    #       (195 - 209)	    WAS DAPBOOLS

                                                        #       (SET)                   (RESET)

# BIT 15 FLAG 13
PULSEFLG        =               195D                    #       MINIMUM IMPULSE         NOT IN MINIMUM
PULSES          =               BIT15                   #       COMMAND MODE IN         IMPULSE COMMAND MODE
                                                        #       "ATT HOLD" (V76)        (V77)
#

# BIT 14 FLAG 13
USEQRFLG        =               196D                    #       GIMBAL UNUSABLE.        TRIM GIMBAL MAY BE
USEQRJTS        =               BIT14                   #       USE JETS ONLY.          USED.
#

# BIT 13 FLAG 13
CSMDKFLG        =               197D                    #       CSM DOCKED. USE         CSM NOT DOCKED TO LM
CSMDOCKD        =               BIT13                   #       BACKUP DAP
#

# BIT 12 FLAG 13
OURRCFLG        =               198D                    #       CURRENT DAP PASS        CURRENT DAP PASS IS
OURRCBIT        =               BIT12                   #       IS RATE COMMAND         NOT RATE COMMAND
#

# BIT 11 FLAG 13
ACC4-2FL        =               199D                    #       4 JET X-AXIS TRANS-     2 JET X-AXIS TRANS-
ACC4OR2X        =               BIT11                   #       LATION REQUESTED        LATION REQUESTED
#

# BIT 10 FLAG 13
AORBTFLG        =               200D                    #       B SYSTEM FOR X-         A SYSTEM FOR X-
AORBTRAN        =               BIT10                   #       TRANSLATION             TRANSLATION PREFER'D
#

# BIT 9 FLAG 13
XOVINFLG        =               201D                    #       X-AXIS OVERRIDE         X-AXIS OVERRIDE OKAY
XOVINHIB        =               BIT9                    #       LOCKED OUT

# BIT 8 FLAG 13
DRIFTDFL        =               202D                    #       ASSUME 0 OFFSET         USE OFFSET ACCELERA-
DRIFTBIT        =               BIT8                    #       DRIFTING FLIGHT.        TION ESTIMATE

## Note: The above comment BIT 8 FLAG 13 and subsequent labels DRIFTDFL, DRIFTBIT
## and their assigned values are circled in with a blue pen.

## Page 90
# BIT 7 FLAG 13
RHCSCFLG        =               203D                    #       NORMAL RHC SCALING      FINE RHC SCALING
RHCSCALE        =               BIT7                    #       REQUESTED               REQUESTED
#

# BIT 6 FLAG 13
ULLAGFLG        =               204D                    #       ULLAGE REQUEST BY       NO INTERNAL ULLAGE
ULLAGER         =               BIT6                    #       MISSION PROGRAM         REQUEST
#

# BIT 5 FLAG 13
DBSL2FLG        =               205D                    #       5 DEG DEADBAND          1 OR .3 DEG DEADBAND
DBSLECT2        =               BIT5                    #       SELECTED BY CREW        SELECTED BY CREW
                                                        #                               (SEE BIT4 DAPBOOLS)
#

# BIT 4 FLAG 13
DBSELFLG        =               206D                    #       1 DEG DEADBAND          MIN DB SELECTED BY
DBSELECT        =               BIT4                    #       SELECTED BY CREW        CREW (0.3 DEG)
#

# BIT 3 FLAG 13
ACCOKFLG        =               207D                    #       CONTROL AUTHORITY       RESTART OR FRESH ST.
ACCSOKAY        =               BIT3                    #       VALUES FROM 1/ACCS      SINCE LAST 1/ACCS;
                                                        #       USABLE                  OUTPUTS SUSPECT.
#

# BIT 2 FLAG 13
AUTR2FLG        =               208D                    #       THESE FLAGS ARE USED TOGETHER TO INDICAT
AUTRATE2        =               BIT2                    #       ASTRONAUT-CHOSEN KALCMANU MANEUVER RATES
                                                        #       (0,0)=(BIT2,BIT1)= 0.2 DEG/SEC
                                                        #       (0,1)=  0.5 DEG/SEC
# BIT 1 FLAG 13
AUTR1FLG        =               209D                    #       (1,0)=  2.0 DEG/SEC
AUTRATE1        =               BIT1                    #       (1,1)= 10.0 DEG/SEC
