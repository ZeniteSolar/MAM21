EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 60749E0A
P 5150 3550
F 0 "J?" H 5068 3225 50  0000 C CNN
F 1 "FAN" H 5150 3350 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 5150 3550 50  0001 C CNN
F 3 "~" H 5150 3550 50  0001 C CNN
	1    5150 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60749E10
P 6150 3650
F 0 "R?" V 5954 3650 50  0000 C CNN
F 1 "?" V 6045 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 6150 3650 50  0001 C CNN
F 3 "~" H 6150 3650 50  0001 C CNN
	1    6150 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 3650 6350 3650
Wire Wire Line
	5900 3650 6050 3650
Wire Wire Line
	5350 3550 5350 3850
Wire Wire Line
	5350 3850 5600 3850
$Comp
L power:GND #PWR?
U 1 1 60749E1A
P 5600 4000
AR Path="/60749E1A" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/60749E1A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5600 3750 50  0001 C CNN
F 1 "GND" H 5605 3827 50  0000 C CNN
F 2 "" H 5600 4000 50  0001 C CNN
F 3 "" H 5600 4000 50  0001 C CNN
	1    5600 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5600 4000 5600 3850
$Comp
L Device:R_Small R?
U 1 1 60749E21
P 5500 3450
F 0 "R?" V 5304 3450 50  0000 C CNN
F 1 "?" V 5395 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 5500 3450 50  0001 C CNN
F 3 "~" H 5500 3450 50  0001 C CNN
	1    5500 3450
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 60749E27
P 5700 3650
F 0 "Q?" H 5891 3696 50  0000 L CNN
F 1 "BCV27" H 5891 3605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5900 3750 50  0001 C CNN
F 3 "~" H 5700 3650 50  0001 C CNN
	1    5700 3650
	-1   0    0    -1  
$EndComp
Connection ~ 5600 3850
$Comp
L Device:R_Small R?
U 1 1 60749E2E
P 5400 3300
F 0 "R?" H 5350 3150 50  0000 C CNN
F 1 "?" H 5200 3150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 5400 3300 50  0001 C CNN
F 3 "~" H 5400 3300 50  0001 C CNN
	1    5400 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 3450 5400 3450
Wire Wire Line
	5400 3400 5400 3450
Connection ~ 5400 3450
$Comp
L power:+5V #PWR?
U 1 1 60749E37
P 5400 3150
F 0 "#PWR?" H 5400 3000 50  0001 C CNN
F 1 "+5V" H 5415 3323 50  0000 C CNN
F 2 "" H 5400 3150 50  0001 C CNN
F 3 "" H 5400 3150 50  0001 C CNN
	1    5400 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3150 5400 3200
Text HLabel 6350 3650 2    50   Input ~ 0
PWM_IN
Text HLabel 5700 3150 2    50   Input ~ 0
+5V
Wire Wire Line
	5700 3150 5400 3150
Connection ~ 5400 3150
Text HLabel 5700 4000 2    50   Input ~ 0
GND
Wire Wire Line
	5700 4000 5600 4000
Connection ~ 5600 4000
$EndSCHEMATC
