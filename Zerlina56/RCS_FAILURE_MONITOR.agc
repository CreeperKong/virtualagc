### FILE="Main.annotation"
## Copyright:   Public domain.
## Filename:    RCS_FAILURE_MONITOR.agc
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
## Reference:   pp. 196-198
## Assembler:   yaYUL
## Contact:     Ron Burkey <info@sandroid.org>.
## Website:     www.ibiblio.org/apollo/index.html
## Mod history: 2017-07-28 MAS  Created from Luminary 210.

## NOTE: Page numbers below have not yet been updated to reflect Zerlina 56.

## Page 201
# PROGRAM DESCRIPTION

# AUTHOR: J S MILLER

# MODIFIED 6 MARCH 1968 BY P S WEISSMAN TO SET UP JOB FOR 1/ACCS WHEN THE MASKS ARE CHANGED.

#      THIS ROUTINE IS ATTACHED TO T4RUPT, AND IS ENTERED EVERY 480 MS.  ITS FUNCTION IS TO EXAMINE THE LOW 8 BITS
# OF CHANNEL 32 TO SEE IF ANY ISOLATION-VALVE CLOSURE BITS HAVE APPEARED OR DISAPPEARED (THE CREW IS WARNED OF JET
# FAILURES BY LAMPS LIT BY THE GRUMMAN FAILURE-DETECTION CIRCUITRY; THEY MAY RESPOND BY OPERATING SWITCHES WHICH
# ISOLATE PAIRS OF JETS FROM THE PROPELLANT TANKS AND SET BITS IN CHANNEL 32).  IN THE EVENT THAT CHANNEL 32 BITS
# DIFFER FROM 'PVALVEST', THE RECORD OF ACTIONS TAKEN BY THIS ROUTINE, THE APPROPRIATE BITS IN 'CH5MASK' &
# 'CH6MASK', USED BY THE DAP JET-SELECTION LOGIC, ARE UPDATED, AS IS 'PVALVEST'.  TO SPEED UP & SHORTEN THE
# ROUTINE, NO MORE THAN ONE CHANGE IS ACCEPTED PER ENTRY.  THE HIGHEST-NUMBERED BIT IN CHANNEL 32 WHICH REQUIRES
# ACTION IS THE ONE PROCESSED.

#      THE CODING IN THE FAILURE MONITOR HAS BEEN WRITTEN SO AS TO HAVE ALMOST COMPLETE RESTART PROTECTION.  FOR
# EXAMPLE, NO ASSUMPTION IS MADE WHEN SETTING A 'CH5MASK' BIT TO 1 THAT THE PREVIOUS STATE IS 0, ALTHOUGH IT OF
# COURSE SHOULD BE.  ONE CASE WHICH MAY BE SEEN TO EVADE PROTECTION IS THE OCCURRENCE OF A RESTART AFTER UPDATING
# ONE OR BOTH DAP MASK-WORDS BUT BEFORE UPDATING 'PVALVEST', COUPLED WITH A CHANGE IN THE VALVE-BIT BACK TO ITS
# FORMER STATE.  THE CONSEQUENCE OF THIS IS THAT THE NEXT ENTRY WOULD NOT SEE THE CHANGE INCOMPLETELY INCORP-
# ORATED BY THE LAST PASS (BECAUSE IT WENT AWAY AT JUST THE RIGHT TIME), BUT THE DAP MASK-WORDS WILL BE INCORRECT.
# THIS COMBINATION OF EVENTS SEEMS QUITE REMOTE, BUT NOT IMPOSSIBLE UNLESS THE CREW OPERATES THE SWITCHES AT HALF-
# SECOND INTERVALS OR LONGER.  IN ANY EVENT, A DISAGREEMENT BETWEEN REALITY AND THE DAP MASKS WILL BE CURED IF
# THE MISINTERPRETED SWITCH IS REVERSED AND THEN RESTORED TO ITS CORRECT POSITION (SLOWLY).

# CALLING SEQUENCE:

#          TCF    RCSMONIT        (IN INTERRUPT MODE, EVERY 480 MS.)

# EXIT:  TCF  RCSMONEX  (ALL PATHS EXIT VIA SUCH AN INSTRUCTION)
RCSMONEX        EQUALS          RESUME

# ERASABLE INITIALIZATION REQUIRED:

#          VIA FRESH START:  PVALVEST          = +0  (ALL JETS ENABLED)
#                            CH5MASK,CH6MASK   = +0  (ALL JETS OK)

# OUTPUT:  CH5MASK & CH6MASK UPDATED  (1'S WHERE JETS NOT TO BE USED, IN CHANNEL 5 & 6 FORMAT)
#          PVALTEST UPDATED  (1'S WHEN VALVE CLOSURES HAVE BEEN TRANSLATED INTO CH5MASK & CH6MASK; CHAN 32 FORMAT)
#          JOB TO DO 1/ACCS.

# DEBRIS:  A, L, Q AND DEBRIS OF NOVAC.

# SUBROUTINE CALLED:  NOVAC.

                EBANK=          CH5MASK

                BANK            23
                SETLOC          RCSMONT
                BANK

## Page 202
                COUNT*          $$/T4RCS

RCSMONIT        EQUALS          RCSMON

RCSMON          CS              ZERO
                EXTEND
                RXOR            CHAN32                  # PICK UP + INVERT INVERTED CHANNEL 32.
                MASK            LOW8                    # KEEP JET-FAIL BITS ONLY.
                TS              Q

                CS              PVALVEST                #       -   -
                MASK            Q                       # FORM PC + PC.
                TS              L                       #   (P = PREVIOUS ISOLATION VALVE STATE,
                CS              Q                       #    C = CURRENT VALVE STATE (CH 32)).
                MASK            PVALVEST
                ADS             L                       # RESULT NZ INDICATES ACTION REQUIRED.

                EXTEND
                BZF             RCSMONEX                # QUIT IF NO ACTION REQUIRED.

                EXTEND
                MP              BIT7                    # MOVE BITS 8 - 1 OF A TO 14 - 7 OF L.
                XCH             L                       # ZERO TO L IN THE PROCESS.

 -3             INCR            L
                DOUBLE                                  # BOUND TO GET OVERFLOW IN THIS LOOP,
                OVSK                                    # SINCE WE ASSURED INITIAL NZ IN A.
                TCF             -3

                INDEX           L
                CA              BIT8            -1      # SAVE THE RELEVANT BIT (8 - 1).
                TS              Q
                MASK            PVALVEST                # LOOK AT PREVIOUS VALVE STATE BIT.
                CCS             A
                TCF             VOPENED                 # THE VALVE HAS JUST BEEN OPENED.

                CS              CH5MASK                 # THE VALVE HAS JUST BEEN CLOSED.
                INDEX           L
                MASK            5FAILTAB
                ADS             CH5MASK                 # SET INHIBIT BIT FOR CHANNEL 5 JET.

                CS              CH6MASK
                INDEX           L
                MASK            6FAILTAB
                ADS             CH6MASK                 # SET INGIBIT BIT FOR CHANNEL 6 JET.

                CA              Q
                ADS             PVALVEST                # RECORD ACTION TAKEN.

                TCF             1/ACCFIX                # SET UP 1/ACCJOB AND EXIT.

## Page 203
VOPENED         INDEX           L                       # A VALVE HAS JUST BEEN OPENED.
                CS              5FAILTAB
                MASK            CH5MASK
                TS              CH5MASK                 # REMOVE INHIBIT BIT FOR CHANNEL 5 JET.

                INDEX           L
                CS              6FAILTAB
                MASK            CH6MASK
                TS              CH6MASK                 # REMOVE INHIBIT BIT FOR CHANNEL 6 JET.

                CS              Q
                MASK            PVALVEST
                TS              PVALVEST                # RECORD ACTION TAKEN.

1/ACCFIX        CAF             PRIO27                  # SET UP 1/ACCS SO THAT THE SWITCH CURVES
                TC              NOVAC                   #   FOR TJETLAW CAN BE MODIFIED IF CH5MASK
                EBANK=          AOSQ                    #   HAS BEEN ALTERED.
                2CADR           1/ACCJOB

                TCF             RCSMONEX                # EXIT.

5FAILTAB        EQUALS          -1                      # CH 5 JET BIT CORRESPONDING TO CH 32 BIT:
                OCT             00040                   # 8
                OCT             00020                   # 7
                OCT             00100                   # 6
                OCT             00200                   # 5
                OCT             00010                   # 4
                OCT             00001                   # 3
                OCT             00004                   # 2
                OCT             00002                   # 1

6FAILTAB        EQUALS          -1                      # CH 6 JET BIT CORRESPONDING TO CH 32 BIT:
                OCT             00010                   # 8
                OCT             00020                   # 7
                OCT             00004                   # 6
                OCT             00200                   # 5
                OCT             00001                   # 4
                OCT             00002                   # 3
                OCT             00040                   # 2
                OCT             00100                   # 1