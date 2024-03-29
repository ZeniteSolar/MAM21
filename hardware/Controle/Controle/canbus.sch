EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5750 3000 6200 3000
Wire Wire Line
	5750 3900 6200 3900
Connection ~ 5250 4000
$Comp
L power:GND #PWR?
U 1 1 60708C8E
P 5250 4000
AR Path="/60708C8E" Ref="#PWR?"  Part="1" 
AR Path="/606C6891/60708C8E" Ref="#PWR0202"  Part="1" 
F 0 "#PWR0202" H 5250 3750 50  0001 C CNN
F 1 "GND" H 5255 3827 50  0000 C CNN
F 2 "" H 5250 4000 50  0001 C CNN
F 3 "" H 5250 4000 50  0001 C CNN
	1    5250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4000 5250 3850
Wire Wire Line
	4550 4000 5250 4000
Wire Wire Line
	4550 3950 4550 4000
Wire Wire Line
	4550 3650 4750 3650
Wire Wire Line
	4550 3750 4550 3650
$Comp
L Device:R_Small R?
U 1 1 60708C99
P 4550 3850
AR Path="/60708C99" Ref="R?"  Part="1" 
AR Path="/606C6891/60708C99" Ref="R201"  Part="1" 
F 0 "R201" H 4609 3896 50  0000 L CNN
F 1 "4k7" H 4609 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 4550 3850 50  0001 C CNN
F 3 "~" H 4550 3850 50  0001 C CNN
	1    4550 3850
	1    0    0    -1  
$EndComp
Text Label 4200 3250 0    50   ~ 0
CAN_TX
Text Label 4200 3350 0    50   ~ 0
CAN_RX
Wire Wire Line
	4750 3350 4200 3350
Wire Wire Line
	4750 3250 4200 3250
Wire Wire Line
	4650 3000 4850 3000
$Comp
L power:GND #PWR?
U 1 1 60708CA4
P 4650 3000
AR Path="/60708CA4" Ref="#PWR?"  Part="1" 
AR Path="/606C6891/60708CA4" Ref="#PWR0201"  Part="1" 
F 0 "#PWR0201" H 4650 2750 50  0001 C CNN
F 1 "GND" H 4655 2827 50  0000 C CNN
F 2 "" H 4650 3000 50  0001 C CNN
F 3 "" H 4650 3000 50  0001 C CNN
	1    4650 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3000 5250 3050
Wire Wire Line
	5050 3000 5250 3000
$Comp
L Device:C_Small C?
U 1 1 60708CAC
P 4950 3000
AR Path="/60708CAC" Ref="C?"  Part="1" 
AR Path="/606C6891/60708CAC" Ref="C201"  Part="1" 
F 0 "C201" V 5179 3000 50  0000 C CNN
F 1 "100n" V 5088 3000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4950 3000 50  0001 C CNN
F 3 "~" H 4950 3000 50  0001 C CNN
	1    4950 3000
	0    -1   -1   0   
$EndComp
Text Label 6500 3000 2    50   ~ 0
CAN_H
Text Label 6550 3900 2    50   ~ 0
CAN_L
Text HLabel 6500 3000 2    50   Input ~ 0
CAN_H
Text HLabel 6550 3900 2    50   Input ~ 0
CAN_L
Text HLabel 4200 3250 0    50   Input ~ 0
CAN_TX
Text HLabel 4200 3350 0    50   Input ~ 0
CAN_RX
Text HLabel 5250 3000 1    50   Input ~ 0
5v
Text HLabel 5250 4000 2    50   Input ~ 0
GND
$Comp
L Interface_CAN_LIN:MCP2561-E-SN U201
U 1 1 6092BE2A
P 5250 3450
F 0 "U201" H 5250 4031 50  0000 C CNN
F 1 "MCP2561-E-SN" H 5250 3940 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5250 2950 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/25167A.pdf" H 5250 3450 50  0001 C CNN
	1    5250 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:D_TVS_x2_AAC D201
U 1 1 6093192A
P 7050 4350
F 0 "D201" H 7050 4567 50  0000 C CNN
F 1 "pesd1can" H 7050 4476 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7050 4350 50  0001 C CNN
F 3 "~" H 7050 4350 50  0001 C CNN
	1    7050 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R202
U 1 1 6093BF3D
P 7050 4050
F 0 "R202" V 6854 4050 50  0000 C CNN
F 1 "NC" V 6945 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 7050 4050 50  0001 C CNN
F 3 "~" H 7050 4050 50  0001 C CNN
	1    7050 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 4050 7400 4050
Wire Wire Line
	7400 4050 7400 4350
Wire Wire Line
	6950 4050 6700 4050
Wire Wire Line
	6700 4050 6700 4350
Text Label 7400 4050 0    50   ~ 0
CAN_L
Text Label 6700 4050 2    50   ~ 0
CAN_H
$Comp
L power:GND #PWR?
U 1 1 6093E5B4
P 7050 4600
AR Path="/6093E5B4" Ref="#PWR?"  Part="1" 
AR Path="/606C6891/6093E5B4" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 7050 4350 50  0001 C CNN
F 1 "GND" H 7055 4427 50  0000 C CNN
F 2 "" H 7050 4600 50  0001 C CNN
F 3 "" H 7050 4600 50  0001 C CNN
	1    7050 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4600 7050 4500
Wire Wire Line
	5750 3000 5750 3350
Wire Wire Line
	5750 3900 5750 3550
$Comp
L Device:R_Small R?
U 1 1 60A1B053
P 6000 3450
AR Path="/60A1B053" Ref="R?"  Part="1" 
AR Path="/606C6891/60A1B053" Ref="R203"  Part="1" 
F 0 "R203" H 6059 3496 50  0000 L CNN
F 1 "300" H 6059 3405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 6000 3450 50  0001 C CNN
F 3 "~" H 6000 3450 50  0001 C CNN
	1    6000 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3450 5750 3450
$Comp
L Device:R_Small R?
U 1 1 60A1D2BE
P 6200 3250
AR Path="/60A1D2BE" Ref="R?"  Part="1" 
AR Path="/606C6891/60A1D2BE" Ref="R204"  Part="1" 
F 0 "R204" H 6259 3296 50  0000 L CNN
F 1 "520" H 6259 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 6200 3250 50  0001 C CNN
F 3 "~" H 6200 3250 50  0001 C CNN
	1    6200 3250
	1    0    0    1   
$EndComp
Wire Wire Line
	6200 3550 6200 3450
Wire Wire Line
	6100 3450 6200 3450
Connection ~ 6200 3450
Wire Wire Line
	6200 3450 6200 3350
Wire Wire Line
	6200 3750 6200 3900
Connection ~ 6200 3900
Wire Wire Line
	6200 3900 6550 3900
$Comp
L Device:R_Small R?
U 1 1 60A1D7FB
P 6200 3650
AR Path="/60A1D7FB" Ref="R?"  Part="1" 
AR Path="/606C6891/60A1D7FB" Ref="R205"  Part="1" 
F 0 "R205" H 6259 3696 50  0000 L CNN
F 1 "520" H 6259 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 6200 3650 50  0001 C CNN
F 3 "~" H 6200 3650 50  0001 C CNN
	1    6200 3650
	1    0    0    1   
$EndComp
Wire Wire Line
	6200 3150 6200 3000
Connection ~ 6200 3000
Wire Wire Line
	6200 3000 6500 3000
$Comp
L Device:C_Small C?
U 1 1 60A214AF
P 6600 3450
AR Path="/60A214AF" Ref="C?"  Part="1" 
AR Path="/606C6891/60A214AF" Ref="C202"  Part="1" 
F 0 "C202" V 6829 3450 50  0000 C CNN
F 1 "4.7n" V 6738 3450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6600 3450 50  0001 C CNN
F 3 "~" H 6600 3450 50  0001 C CNN
	1    6600 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6500 3450 6200 3450
$Comp
L power:GND #PWR?
U 1 1 60A223CF
P 6900 3500
AR Path="/60A223CF" Ref="#PWR?"  Part="1" 
AR Path="/606C6891/60A223CF" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 6900 3250 50  0001 C CNN
F 1 "GND" H 6905 3327 50  0000 C CNN
F 2 "" H 6900 3500 50  0001 C CNN
F 3 "" H 6900 3500 50  0001 C CNN
	1    6900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 3500 6900 3450
Wire Wire Line
	6900 3450 6700 3450
$EndSCHEMATC
