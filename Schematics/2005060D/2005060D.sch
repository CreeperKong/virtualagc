EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr E 44000 34000
encoding utf-8
Sheet 1 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 40525 33125 0    250  ~ 50
2005060
Text Notes 38925 31825 0    250  ~ 50
LOGIC FLOW DIAGRAM
Text Notes 39600 32150 0    200  ~ 40
MODULE NO. A2
Text Notes 40025 32450 0    200  ~ 40
TIMER
Text Notes 38950 33425 0    140  ~ 28
____
Wire Notes Line width 6 style solid
	36461 985  36461 2300
Wire Notes Line width 6 style solid
	36839 984  36839 2300
Wire Notes Line width 6 style solid
	37350 984  37350 2300
Wire Notes Line width 6 style solid
	36461 2300 43500 2300
Wire Notes Line width 6 style solid
	40831 984  40831 2300
Wire Notes Line width 6 style solid
	41331 984  41331 2299
Wire Notes Line width 6 style solid
	41332 2299 41332 2300
Wire Notes Line width 6 style solid
	41831 984  41831 2300
Wire Notes Line width 6 style solid
	42480 984  42480 2300
Wire Notes Line width 6 style solid
	36465 1640 43500 1640
Wire Notes Line width 6 style solid
	43500 1310 36465 1310
Wire Notes Line width 6 style solid
	36465 1970 43500 1970
Text Notes 36600 1250 0    140  ~ 28
A
Text Notes 36575 1575 0    140  ~ 28
B
Text Notes 36575 1900 0    140  ~ 28
C
Text Notes 36575 2225 0    140  ~ 28
D
Text Notes 37450 1250 0    140  ~ 28
REVISED PER TDRR 18679
Text Notes 37450 1575 0    140  ~ 28
REVISED PER TDRR 20973
Text Notes 37450 1900 0    140  ~ 28
REVISED PER TDRR 22353
Text Notes 37450 2225 0    140  ~ 28
REVISED PER TDRR 25975
$Sheet
S 8525 10700 6925 10500
U 5CFE3FCD
F0 "2005060D-p1of3" 140
F1 "2005060D-p1of3.sch" 140
F2 "0VDC" U R 15450 20900 140
F3 "+4VDC" U R 15450 11050 140
$EndSheet
$Sheet
S 19600 10725 6925 10500
U 5CFE45F1
F0 "2005060D-p2of3" 140
F1 "2005060D-p2of3.sch" 140
F2 "0VDC" U L 19600 20900 140
F3 "+4VDC" U L 19600 11050 140
$EndSheet
$Sheet
S 30450 10700 6925 10500
U 5CFE465F
F0 "2005060D-p3of3" 140
F1 "2005060D-p3of3.sch" 140
F2 "0VDC" U L 30450 20875 140
$EndSheet
Wire Wire Line
	15450 11050 17650 11050
$Comp
L AGC_DSKY:PWR_FLAG #FLG0101
U 1 1 5D2EDBBA
P 17650 11050
F 0 "#FLG0101" H 17650 11575 50  0001 C CNN
F 1 "PWR_FLAG" H 17660 11510 50  0001 C CNN
F 2 "" H 17650 11050 50  0001 C CNN
F 3 "~" H 17650 11050 50  0001 C CNN
	1    17650 11050
	1    0    0    -1  
$EndComp
Connection ~ 17650 11050
Wire Wire Line
	17650 11050 19600 11050
Wire Wire Line
	15450 20900 17650 20900
Wire Wire Line
	18675 20900 18675 22050
Wire Wire Line
	18675 22050 28900 22050
Wire Wire Line
	28900 22050 28900 20875
Wire Wire Line
	28900 20875 30450 20875
Connection ~ 18675 20900
Wire Wire Line
	18675 20900 19600 20900
$Comp
L AGC_DSKY:PWR_FLAG #FLG0102
U 1 1 5D2EDCFB
P 17650 20900
F 0 "#FLG0102" H 17650 21425 50  0001 C CNN
F 1 "PWR_FLAG" H 17660 21360 50  0001 C CNN
F 2 "" H 17650 20900 50  0001 C CNN
F 3 "~" H 17650 20900 50  0001 C CNN
	1    17650 20900
	1    0    0    -1  
$EndComp
Connection ~ 17650 20900
Wire Wire Line
	17650 20900 18675 20900
$EndSCHEMATC