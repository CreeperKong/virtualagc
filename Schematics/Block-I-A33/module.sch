EESchema Schematic File Version 4
LIBS:module-cache
EELAYER 29 0
EELAYER END
$Descr D 34000 22000
encoding utf-8
Sheet 1 5
Title "Block I AGC Module A33"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 12325 10025 4025 6325
U 5BEFD1AD
F0 "4-59" 140
F1 "Fig-4-59.sch" 140
F2 "+3VDC" I L 12325 10700 140
F3 "0VDC" I L 12325 11175 140
$EndSheet
$Sheet
S 19150 10050 4025 6325
U 5BEFD31A
F0 "4-153" 140
F1 "Fig-4-153.sch" 140
F2 "+3VDC" I L 19150 10700 140
F3 "0VDC" I L 19150 11175 140
$EndSheet
$Sheet
S 25900 10025 4025 6325
U 5BEFD383
F0 "4-165" 140
F1 "Fig-4-165.sch" 140
F2 "+3VDC" I L 25900 10700 140
F3 "0VDC" I L 25900 11175 140
$EndSheet
$Sheet
S 4325 4975 4025 6325
U 5BEFD3E7
F0 "4-181" 140
F1 "Fig-4-181.sch" 140
F2 "+3VDC" O R 8350 8000 140
F3 "0VDC" O R 8350 8500 140
$EndSheet
Wire Wire Line
	24575 8500 24575 11175
Wire Wire Line
	24575 11175 25900 11175
Wire Wire Line
	8350 8500 9250 8500
Wire Wire Line
	17700 8500 17700 11175
Wire Wire Line
	17700 11175 19150 11175
Connection ~ 17700 8500
Wire Wire Line
	17700 8500 24575 8500
Wire Wire Line
	10725 8500 10725 11175
Wire Wire Line
	10725 11175 12325 11175
Connection ~ 10725 8500
Wire Wire Line
	10725 8500 17700 8500
Wire Wire Line
	25025 8000 25025 10700
Wire Wire Line
	25025 10700 25900 10700
Wire Wire Line
	8350 8000 9250 8000
Wire Wire Line
	19150 10700 18100 10700
Wire Wire Line
	18100 10700 18100 8000
Connection ~ 18100 8000
Wire Wire Line
	18100 8000 25025 8000
Wire Wire Line
	12325 10700 11100 10700
Wire Wire Line
	11100 10700 11100 8000
Connection ~ 11100 8000
Wire Wire Line
	11100 8000 18100 8000
$Comp
L AGC_DSKY:PWR_FLAG #FLG?
U 1 1 5C11120F
P 9250 8000
F 0 "#FLG?" H 9250 8525 50  0001 C CNN
F 1 "PWR_FLAG" H 9260 8460 50  0001 C CNN
F 2 "" H 9250 8000 50  0001 C CNN
F 3 "~" H 9250 8000 50  0001 C CNN
	1    9250 8000
	1    0    0    -1  
$EndComp
$Comp
L AGC_DSKY:PWR_FLAG #FLG?
U 1 1 5C111858
P 9250 8500
F 0 "#FLG?" H 9250 9025 50  0001 C CNN
F 1 "PWR_FLAG" H 9260 8960 50  0001 C CNN
F 2 "" H 9250 8500 50  0001 C CNN
F 3 "~" H 9250 8500 50  0001 C CNN
	1    9250 8500
	1    0    0    -1  
$EndComp
Connection ~ 9250 8500
Wire Wire Line
	9250 8500 10725 8500
Connection ~ 9250 8000
Wire Wire Line
	9250 8000 11100 8000
$EndSCHEMATC