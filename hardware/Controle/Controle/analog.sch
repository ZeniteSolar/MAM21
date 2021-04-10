EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1450 1550 0    50   Input ~ 0
In1
Text HLabel 2600 1550 2    50   Output ~ 0
Out1
$Comp
L Device:R_Small R602
U 1 1 608312CE
P 1700 1550
F 0 "R602" V 1504 1550 50  0000 C CNN
F 1 "?" V 1595 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1700 1550 50  0001 C CNN
F 3 "~" H 1700 1550 50  0001 C CNN
	1    1700 1550
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C602
U 1 1 60831CD9
P 2100 1750
F 0 "C602" H 2192 1796 50  0000 L CNN
F 1 "?" H 2192 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2100 1750 50  0001 C CNN
F 3 "~" H 2100 1750 50  0001 C CNN
	1    2100 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1550 1850 1550
Wire Wire Line
	1600 1550 1450 1550
$Comp
L Device:R_Small R608
U 1 1 60832359
P 1850 1750
F 0 "R608" H 1792 1704 50  0000 R CNN
F 1 "?" H 1792 1795 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1850 1750 50  0001 C CNN
F 3 "~" H 1850 1750 50  0001 C CNN
	1    1850 1750
	1    0    0    1   
$EndComp
Wire Wire Line
	1850 1650 1850 1550
Connection ~ 1850 1550
Wire Wire Line
	1850 1550 2100 1550
Wire Wire Line
	2100 1650 2100 1550
Connection ~ 2100 1550
$Comp
L power:GND #PWR0603
U 1 1 60834CE2
P 2100 1950
F 0 "#PWR0603" H 2100 1700 50  0001 C CNN
F 1 "GND" H 2105 1777 50  0000 C CNN
F 2 "" H 2100 1950 50  0001 C CNN
F 3 "" H 2100 1950 50  0001 C CNN
	1    2100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1950 2100 1850
Wire Wire Line
	1850 1850 2100 1850
Connection ~ 2100 1850
$Comp
L power:GND #PWR0601
U 1 1 6083526E
P 800 2500
F 0 "#PWR0601" H 800 2250 50  0001 C CNN
F 1 "GND" H 805 2327 50  0000 C CNN
F 2 "" H 800 2500 50  0001 C CNN
F 3 "" H 800 2500 50  0001 C CNN
	1    800  2500
	1    0    0    -1  
$EndComp
Text HLabel 800  2350 1    50   Input ~ 0
GND
Wire Wire Line
	800  2350 800  2500
Text HLabel 1450 2250 0    50   Input ~ 0
In2
Text HLabel 2600 2250 2    50   Output ~ 0
Out2
$Comp
L Device:R_Small R603
U 1 1 60837C36
P 1700 2250
F 0 "R603" V 1504 2250 50  0000 C CNN
F 1 "?" V 1595 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1700 2250 50  0001 C CNN
F 3 "~" H 1700 2250 50  0001 C CNN
	1    1700 2250
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C603
U 1 1 60837C3C
P 2100 2450
F 0 "C603" H 2192 2496 50  0000 L CNN
F 1 "?" H 2192 2405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2100 2450 50  0001 C CNN
F 3 "~" H 2100 2450 50  0001 C CNN
	1    2100 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2250 1850 2250
Wire Wire Line
	1600 2250 1450 2250
$Comp
L Device:R_Small R609
U 1 1 60837C44
P 1850 2450
F 0 "R609" H 1792 2404 50  0000 R CNN
F 1 "?" H 1792 2495 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1850 2450 50  0001 C CNN
F 3 "~" H 1850 2450 50  0001 C CNN
	1    1850 2450
	1    0    0    1   
$EndComp
Wire Wire Line
	1850 2350 1850 2250
Connection ~ 1850 2250
Wire Wire Line
	1850 2250 2100 2250
Wire Wire Line
	2100 2350 2100 2250
Connection ~ 2100 2250
$Comp
L power:GND #PWR0604
U 1 1 60837C59
P 2100 2650
F 0 "#PWR0604" H 2100 2400 50  0001 C CNN
F 1 "GND" H 2105 2477 50  0000 C CNN
F 2 "" H 2100 2650 50  0001 C CNN
F 3 "" H 2100 2650 50  0001 C CNN
	1    2100 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2650 2100 2550
Wire Wire Line
	1850 2550 2100 2550
Connection ~ 2100 2550
Text HLabel 1450 2950 0    50   Input ~ 0
In3
Text HLabel 2600 2950 2    50   Output ~ 0
Out3
$Comp
L Device:R_Small R604
U 1 1 6083A8AB
P 1700 2950
F 0 "R604" V 1504 2950 50  0000 C CNN
F 1 "?" V 1595 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1700 2950 50  0001 C CNN
F 3 "~" H 1700 2950 50  0001 C CNN
	1    1700 2950
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C604
U 1 1 6083A8B1
P 2100 3150
F 0 "C604" H 2192 3196 50  0000 L CNN
F 1 "?" H 2192 3105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2100 3150 50  0001 C CNN
F 3 "~" H 2100 3150 50  0001 C CNN
	1    2100 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2950 1850 2950
Wire Wire Line
	1600 2950 1450 2950
$Comp
L Device:R_Small R610
U 1 1 6083A8B9
P 1850 3150
F 0 "R610" H 1792 3104 50  0000 R CNN
F 1 "?" H 1792 3195 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1850 3150 50  0001 C CNN
F 3 "~" H 1850 3150 50  0001 C CNN
	1    1850 3150
	1    0    0    1   
$EndComp
Wire Wire Line
	1850 3050 1850 2950
Connection ~ 1850 2950
Wire Wire Line
	1850 2950 2100 2950
Wire Wire Line
	2100 3050 2100 2950
Connection ~ 2100 2950
$Comp
L power:GND #PWR0605
U 1 1 6083A8CE
P 2100 3350
F 0 "#PWR0605" H 2100 3100 50  0001 C CNN
F 1 "GND" H 2105 3177 50  0000 C CNN
F 2 "" H 2100 3350 50  0001 C CNN
F 3 "" H 2100 3350 50  0001 C CNN
	1    2100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3350 2100 3250
Wire Wire Line
	1850 3250 2100 3250
Connection ~ 2100 3250
Text HLabel 1450 3650 0    50   Input ~ 0
In4
Text HLabel 2600 3650 2    50   Output ~ 0
Out4
$Comp
L Device:R_Small R605
U 1 1 6084164F
P 1700 3650
F 0 "R605" V 1504 3650 50  0000 C CNN
F 1 "?" V 1595 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1700 3650 50  0001 C CNN
F 3 "~" H 1700 3650 50  0001 C CNN
	1    1700 3650
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C605
U 1 1 60841655
P 2100 3850
F 0 "C605" H 2192 3896 50  0000 L CNN
F 1 "?" H 2192 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2100 3850 50  0001 C CNN
F 3 "~" H 2100 3850 50  0001 C CNN
	1    2100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3650 1850 3650
Wire Wire Line
	1600 3650 1450 3650
$Comp
L Device:R_Small R611
U 1 1 6084165D
P 1850 3850
F 0 "R611" H 1792 3804 50  0000 R CNN
F 1 "?" H 1792 3895 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1850 3850 50  0001 C CNN
F 3 "~" H 1850 3850 50  0001 C CNN
	1    1850 3850
	1    0    0    1   
$EndComp
Wire Wire Line
	1850 3750 1850 3650
Connection ~ 1850 3650
Wire Wire Line
	1850 3650 2100 3650
Wire Wire Line
	2100 3750 2100 3650
Connection ~ 2100 3650
$Comp
L power:GND #PWR0606
U 1 1 60841672
P 2100 4050
F 0 "#PWR0606" H 2100 3800 50  0001 C CNN
F 1 "GND" H 2105 3877 50  0000 C CNN
F 2 "" H 2100 4050 50  0001 C CNN
F 3 "" H 2100 4050 50  0001 C CNN
	1    2100 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4050 2100 3950
Wire Wire Line
	1850 3950 2100 3950
Connection ~ 2100 3950
Text HLabel 1450 4350 0    50   Input ~ 0
In5
Text HLabel 2600 4350 2    50   Output ~ 0
Out5
$Comp
L Device:R_Small R606
U 1 1 60844787
P 1700 4350
F 0 "R606" V 1504 4350 50  0000 C CNN
F 1 "?" V 1595 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1700 4350 50  0001 C CNN
F 3 "~" H 1700 4350 50  0001 C CNN
	1    1700 4350
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C606
U 1 1 6084478D
P 2100 4550
F 0 "C606" H 2192 4596 50  0000 L CNN
F 1 "?" H 2192 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2100 4550 50  0001 C CNN
F 3 "~" H 2100 4550 50  0001 C CNN
	1    2100 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4350 1850 4350
Wire Wire Line
	1600 4350 1450 4350
$Comp
L Device:R_Small R612
U 1 1 60844795
P 1850 4550
F 0 "R612" H 1792 4504 50  0000 R CNN
F 1 "?" H 1792 4595 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1850 4550 50  0001 C CNN
F 3 "~" H 1850 4550 50  0001 C CNN
	1    1850 4550
	1    0    0    1   
$EndComp
Wire Wire Line
	1850 4450 1850 4350
Connection ~ 1850 4350
Wire Wire Line
	1850 4350 2100 4350
Wire Wire Line
	2100 4450 2100 4350
Connection ~ 2100 4350
$Comp
L power:GND #PWR0607
U 1 1 608447AA
P 2100 4750
F 0 "#PWR0607" H 2100 4500 50  0001 C CNN
F 1 "GND" H 2105 4577 50  0000 C CNN
F 2 "" H 2100 4750 50  0001 C CNN
F 3 "" H 2100 4750 50  0001 C CNN
	1    2100 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4750 2100 4650
Wire Wire Line
	1850 4650 2100 4650
Connection ~ 2100 4650
Connection ~ 2100 1150
Wire Wire Line
	1850 1150 2100 1150
Wire Wire Line
	2100 1250 2100 1150
$Comp
L power:GND #PWR0602
U 1 1 60847B9E
P 2100 1250
F 0 "#PWR0602" H 2100 1000 50  0001 C CNN
F 1 "GND" H 2105 1077 50  0000 C CNN
F 2 "" H 2100 1250 50  0001 C CNN
F 3 "" H 2100 1250 50  0001 C CNN
	1    2100 1250
	1    0    0    -1  
$EndComp
Connection ~ 2100 850 
Wire Wire Line
	2100 950  2100 850 
Wire Wire Line
	1850 850  2100 850 
Connection ~ 1850 850 
Wire Wire Line
	1850 950  1850 850 
$Comp
L Device:R_Small R607
U 1 1 60847B89
P 1850 1050
F 0 "R607" H 1792 1004 50  0000 R CNN
F 1 "?" H 1792 1095 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1850 1050 50  0001 C CNN
F 3 "~" H 1850 1050 50  0001 C CNN
	1    1850 1050
	1    0    0    1   
$EndComp
Wire Wire Line
	1600 850  1450 850 
Wire Wire Line
	1800 850  1850 850 
$Comp
L Device:C_Small C601
U 1 1 60847B81
P 2100 1050
F 0 "C601" H 2192 1096 50  0000 L CNN
F 1 "?" H 2192 1005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2100 1050 50  0001 C CNN
F 3 "~" H 2100 1050 50  0001 C CNN
	1    2100 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R601
U 1 1 60847B7B
P 1700 850
F 0 "R601" V 1504 850 50  0000 C CNN
F 1 "?" V 1595 850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1700 850 50  0001 C CNN
F 3 "~" H 1700 850 50  0001 C CNN
	1    1700 850 
	0    1    1    0   
$EndComp
Text HLabel 2600 850  2    50   Output ~ 0
Out0
Text HLabel 1450 850  0    50   Input ~ 0
In0
$Comp
L tl7726:TL7726IDR U601
U 1 1 60A10993
P 4850 1450
F 0 "U601" H 4550 2000 50  0000 C CNN
F 1 "TL7726IDR" H 4650 1900 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3900 950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tpd4s1394.pdf" H 4750 1400 50  0001 C CNN
	1    4850 1450
	1    0    0    -1  
$EndComp
Text Label 2350 850  0    50   ~ 0
Out0
Text Label 2350 1550 0    50   ~ 0
Out1
Text Label 2350 2250 0    50   ~ 0
Out2
Text Label 2350 2950 0    50   ~ 0
Out3
Text Label 2350 3650 0    50   ~ 0
Out4
Text Label 2350 4350 0    50   ~ 0
Out5
Text Label 4000 1150 0    50   ~ 0
Out0
Wire Wire Line
	4000 1150 4350 1150
Text Label 4000 1450 0    50   ~ 0
Out1
Wire Wire Line
	4000 1450 4350 1450
Text Label 4000 1750 0    50   ~ 0
Out2
Wire Wire Line
	4000 1750 4350 1750
Text Label 5650 1750 2    50   ~ 0
Out3
Wire Wire Line
	5650 1150 5350 1150
Text Label 5650 1450 2    50   ~ 0
Out4
Wire Wire Line
	5650 1450 5350 1450
Text Label 5650 1150 2    50   ~ 0
Out5
Wire Wire Line
	5650 1750 5350 1750
$Comp
L power:GND #PWR0119
U 1 1 60A2814F
P 4850 2050
F 0 "#PWR0119" H 4850 1800 50  0001 C CNN
F 1 "GND" H 4855 1877 50  0000 C CNN
F 2 "" H 4850 2050 50  0001 C CNN
F 3 "" H 4850 2050 50  0001 C CNN
	1    4850 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2050 4850 1950
$Comp
L power:+3V3 #PWR0120
U 1 1 60A2A838
P 1000 2350
F 0 "#PWR0120" H 1000 2200 50  0001 C CNN
F 1 "+3V3" H 1015 2523 50  0000 C CNN
F 2 "" H 1000 2350 50  0001 C CNN
F 3 "" H 1000 2350 50  0001 C CNN
	1    1000 2350
	1    0    0    -1  
$EndComp
Text HLabel 1000 2550 3    50   Input ~ 0
3v3
Wire Wire Line
	1000 2550 1000 2350
$Comp
L power:+3V3 #PWR0121
U 1 1 60A2DB9D
P 4850 550
F 0 "#PWR0121" H 4850 400 50  0001 C CNN
F 1 "+3V3" H 4865 723 50  0000 C CNN
F 2 "" H 4850 550 50  0001 C CNN
F 3 "" H 4850 550 50  0001 C CNN
	1    4850 550 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 850  2600 850 
Wire Wire Line
	2100 1550 2600 1550
Wire Wire Line
	2100 2250 2600 2250
Wire Wire Line
	2100 2950 2600 2950
Wire Wire Line
	2100 3650 2600 3650
Wire Wire Line
	2100 4350 2600 4350
$Comp
L Device:C_Small C607
U 1 1 60A6394D
P 5050 800
F 0 "C607" V 5000 700 50  0000 C CNN
F 1 "100n" V 5000 950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5050 800 50  0001 C CNN
F 3 "~" H 5050 800 50  0001 C CNN
	1    5050 800 
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 550  4850 650 
$Comp
L power:GND #PWR0122
U 1 1 60A69EE4
P 5200 850
F 0 "#PWR0122" H 5200 600 50  0001 C CNN
F 1 "GND" H 5205 677 50  0000 C CNN
F 2 "" H 5200 850 50  0001 C CNN
F 3 "" H 5200 850 50  0001 C CNN
	1    5200 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 850  5200 800 
Wire Wire Line
	5200 800  5150 800 
Wire Wire Line
	4950 800  4850 800 
Connection ~ 4850 800 
Wire Wire Line
	4850 800  4850 950 
$Comp
L Device:C_Small C12
U 1 1 607A1571
P 5050 650
F 0 "C12" V 5000 500 50  0000 C CNN
F 1 "4.7u" V 5000 800 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 5050 650 50  0001 C CNN
F 3 "~" H 5050 650 50  0001 C CNN
	1    5050 650 
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 650  5200 650 
Wire Wire Line
	5200 650  5200 800 
Connection ~ 5200 800 
Wire Wire Line
	4950 650  4850 650 
Connection ~ 4850 650 
Wire Wire Line
	4850 650  4850 800 
$EndSCHEMATC
