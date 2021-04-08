EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
L power:GND #PWR?
U 1 1 60736CA9
P 6450 4100
AR Path="/60736CA9" Ref="#PWR?"  Part="1" 
AR Path="/6072A37E/60736CA9" Ref="#PWR0402"  Part="1" 
F 0 "#PWR0402" H 6450 3850 50  0001 C CNN
F 1 "GND" H 6455 3927 50  0000 C CNN
F 2 "" H 6450 4100 50  0001 C CNN
F 3 "" H 6450 4100 50  0001 C CNN
	1    6450 4100
	1    0    0    -1  
$EndComp
Connection ~ 6050 3700
$Comp
L power:GND #PWR?
U 1 1 60736CB7
P 5150 4150
AR Path="/60736CB7" Ref="#PWR?"  Part="1" 
AR Path="/6072A37E/60736CB7" Ref="#PWR0401"  Part="1" 
F 0 "#PWR0401" H 5150 3900 50  0001 C CNN
F 1 "GND" H 5155 3977 50  0000 C CNN
F 2 "" H 5150 4150 50  0001 C CNN
F 3 "" H 5150 4150 50  0001 C CNN
	1    5150 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4150 5150 4100
Wire Wire Line
	4650 3550 4650 3700
Wire Wire Line
	4650 3700 4700 3700
Wire Wire Line
	6150 3700 6050 3700
Wire Wire Line
	6050 3550 6050 3700
$Comp
L Device:C_Small C?
U 1 1 60736CCE
P 4700 3900
AR Path="/60736CCE" Ref="C?"  Part="1" 
AR Path="/6072A37E/60736CCE" Ref="C401"  Part="1" 
F 0 "C401" H 4850 3800 50  0000 R CNN
F 1 "100n" H 4750 4000 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4700 3900 50  0001 C CNN
F 3 "~" H 4700 3900 50  0001 C CNN
	1    4700 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	4700 3800 4700 3700
Connection ~ 4700 3700
Wire Wire Line
	4700 3700 4850 3700
Wire Wire Line
	4700 4100 5150 4100
Connection ~ 5150 4100
Wire Wire Line
	5150 4100 5150 4000
Wire Wire Line
	4700 4100 4700 4000
$Comp
L Device:C_Small C?
U 1 1 60736CDB
P 5650 3900
AR Path="/60736CDB" Ref="C?"  Part="1" 
AR Path="/6072A37E/60736CDB" Ref="C402"  Part="1" 
F 0 "C402" H 5558 3854 50  0000 R CNN
F 1 "100n" H 5558 3945 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5650 3900 50  0001 C CNN
F 3 "~" H 5650 3900 50  0001 C CNN
	1    5650 3900
	1    0    0    1   
$EndComp
Wire Wire Line
	5650 3800 5650 3700
Wire Wire Line
	5450 3700 5650 3700
Wire Wire Line
	5650 4000 5650 4100
$Comp
L Device:C_Small C?
U 1 1 60736CE7
P 6750 3900
AR Path="/60736CE7" Ref="C?"  Part="1" 
AR Path="/6072A37E/60736CE7" Ref="C404"  Part="1" 
F 0 "C404" H 6850 3800 50  0000 R CNN
F 1 "100n" H 6800 4000 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6750 3900 50  0001 C CNN
F 3 "~" H 6750 3900 50  0001 C CNN
	1    6750 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6750 3800 6750 3700
Connection ~ 6750 3700
Wire Wire Line
	5650 3700 5850 3700
Connection ~ 5650 3700
$Comp
L Device:C_Small C?
U 1 1 6074BA7B
P 6050 3900
AR Path="/6074BA7B" Ref="C?"  Part="1" 
AR Path="/6072A37E/6074BA7B" Ref="C403"  Part="1" 
F 0 "C403" H 5958 3854 50  0000 R CNN
F 1 "100n" H 5958 3945 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6050 3900 50  0001 C CNN
F 3 "~" H 6050 3900 50  0001 C CNN
	1    6050 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6050 3800 6050 3700
Wire Wire Line
	6050 4000 6050 4100
Connection ~ 6450 4100
Wire Wire Line
	6450 4000 6450 4100
Wire Wire Line
	6750 4100 6450 4100
Wire Wire Line
	6750 4000 6750 4100
Text HLabel 8600 3700 2    50   Input ~ 0
+18V
Text HLabel 6050 3550 1    50   Input ~ 0
+5V
Text HLabel 4650 3550 1    50   Input ~ 0
+3V3
Text HLabel 6750 4100 3    50   Input ~ 0
GND
$Comp
L Regulator_Linear:AP1117-15 U403
U 1 1 608AFF81
P 7600 3700
F 0 "U403" H 7600 3942 50  0000 C CNN
F 1 "AP1117-15" H 7600 3851 50  0000 C CNN
F 2 "KicadZeniteSolarLibrary18:TO-220-3_Horizontal_TabDown_SMD" H 7600 3900 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 7700 3450 50  0001 C CNN
	1    7600 3700
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 608B1292
P 7250 3900
AR Path="/608B1292" Ref="C?"  Part="1" 
AR Path="/6072A37E/608B1292" Ref="C405"  Part="1" 
F 0 "C405" H 7350 3800 50  0000 R CNN
F 1 "100n" H 7300 4000 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 7250 3900 50  0001 C CNN
F 3 "~" H 7250 3900 50  0001 C CNN
	1    7250 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	7250 3800 7250 3700
Wire Wire Line
	6750 3700 7000 3700
Connection ~ 7250 3700
Wire Wire Line
	7250 3700 7300 3700
Wire Wire Line
	7250 4000 7250 4100
Wire Wire Line
	7250 4100 7600 4100
Wire Wire Line
	7600 4100 7600 4000
$Comp
L Device:C_Small C?
U 1 1 608B2E20
P 7950 3900
AR Path="/608B2E20" Ref="C?"  Part="1" 
AR Path="/6072A37E/608B2E20" Ref="C406"  Part="1" 
F 0 "C406" H 8050 3800 50  0000 R CNN
F 1 "100n" H 8050 4000 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 7950 3900 50  0001 C CNN
F 3 "~" H 7950 3900 50  0001 C CNN
	1    7950 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	7900 3700 7950 3700
Wire Wire Line
	7950 4000 7950 4100
Wire Wire Line
	7950 4100 7600 4100
Connection ~ 7600 4100
Wire Wire Line
	7950 3800 7950 3700
Connection ~ 7950 3700
Wire Wire Line
	7950 3700 8100 3700
Text HLabel 7250 3550 1    50   Input ~ 0
+15V
Wire Wire Line
	7250 3550 7250 3700
$Comp
L power:GND #PWR?
U 1 1 60942067
P 7600 4100
AR Path="/60942067" Ref="#PWR?"  Part="1" 
AR Path="/6072A37E/60942067" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 7600 3850 50  0001 C CNN
F 1 "GND" H 7605 3927 50  0000 C CNN
F 2 "" H 7600 4100 50  0001 C CNN
F 3 "" H 7600 4100 50  0001 C CNN
	1    7600 4100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60947242
P 7950 3700
F 0 "#FLG0101" H 7950 3775 50  0001 C CNN
F 1 "PWR_FLAG" H 7950 3873 50  0000 C CNN
F 2 "" H 7950 3700 50  0001 C CNN
F 3 "~" H 7950 3700 50  0001 C CNN
	1    7950 3700
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP1117-15 U402
U 1 1 609ABA99
P 6450 3700
F 0 "U402" H 6450 3942 50  0000 C CNN
F 1 "AP1117-5" H 6450 3851 50  0000 C CNN
F 2 "KicadZeniteSolarLibrary18:TO-220-3_Horizontal_TabDown_SMD" H 6450 3900 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 6550 3450 50  0001 C CNN
	1    6450 3700
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP1117-15 U401
U 1 1 609AE25D
P 5150 3700
F 0 "U401" H 5150 3942 50  0000 C CNN
F 1 "AP1117-3.3" H 5150 3851 50  0000 C CNN
F 2 "KicadZeniteSolarLibrary18:TO-220-3_Horizontal_TabDown_SMD" H 5150 3900 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 5250 3450 50  0001 C CNN
	1    5150 3700
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6074CA2F
P 5850 3900
AR Path="/6074CA2F" Ref="C?"  Part="1" 
AR Path="/6072A37E/6074CA2F" Ref="C3"  Part="1" 
F 0 "C3" H 5758 3854 50  0000 R CNN
F 1 "4.7u" H 5758 3945 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 5850 3900 50  0001 C CNN
F 3 "~" H 5850 3900 50  0001 C CNN
	1    5850 3900
	1    0    0    1   
$EndComp
Wire Wire Line
	5850 4000 5850 4100
Wire Wire Line
	5150 4100 5650 4100
Connection ~ 5650 4100
Wire Wire Line
	5650 4100 5850 4100
Wire Wire Line
	5850 4100 6050 4100
Connection ~ 5850 4100
Connection ~ 6050 4100
Wire Wire Line
	6050 4100 6450 4100
Wire Wire Line
	5850 3800 5850 3700
Connection ~ 5850 3700
Wire Wire Line
	5850 3700 6050 3700
$Comp
L Device:C_Small C?
U 1 1 6074EFA1
P 4550 3900
AR Path="/6074EFA1" Ref="C?"  Part="1" 
AR Path="/6072A37E/6074EFA1" Ref="C2"  Part="1" 
F 0 "C2" H 4500 3800 50  0000 R CNN
F 1 "4.7u" H 4650 4000 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 4550 3900 50  0001 C CNN
F 3 "~" H 4550 3900 50  0001 C CNN
	1    4550 3900
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6074FBAA
P 8100 3900
AR Path="/6074FBAA" Ref="C?"  Part="1" 
AR Path="/6072A37E/6074FBAA" Ref="C5"  Part="1" 
F 0 "C5" H 8150 3800 50  0000 R CNN
F 1 "4.7u" H 8200 4000 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 8100 3900 50  0001 C CNN
F 3 "~" H 8100 3900 50  0001 C CNN
	1    8100 3900
	1    0    0    1   
$EndComp
Connection ~ 4650 3700
Wire Wire Line
	4550 3800 4550 3700
Wire Wire Line
	4550 3700 4650 3700
Connection ~ 4700 4100
Wire Wire Line
	4550 4000 4550 4100
Wire Wire Line
	4550 4100 4700 4100
$Comp
L Device:C_Small C?
U 1 1 6075CB1F
P 7000 3900
AR Path="/6075CB1F" Ref="C?"  Part="1" 
AR Path="/6072A37E/6075CB1F" Ref="C4"  Part="1" 
F 0 "C4" H 7050 3800 50  0000 R CNN
F 1 "4.7u" H 7050 4000 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 7000 3900 50  0001 C CNN
F 3 "~" H 7000 3900 50  0001 C CNN
	1    7000 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	7000 3800 7000 3700
Connection ~ 7000 3700
Wire Wire Line
	7000 3700 7250 3700
Wire Wire Line
	7000 4100 6750 4100
Wire Wire Line
	7000 4000 7000 4100
Connection ~ 6750 4100
Wire Wire Line
	7000 4100 7250 4100
Connection ~ 7000 4100
Connection ~ 7250 4100
Wire Wire Line
	8100 3800 8100 3700
Connection ~ 8100 3700
Wire Wire Line
	8100 3700 8250 3700
Wire Wire Line
	8100 4100 8100 4000
Connection ~ 7950 4100
$Comp
L Device:C_Small C?
U 1 1 60775B6F
P 8250 3900
AR Path="/60775B6F" Ref="C?"  Part="1" 
AR Path="/6072A37E/60775B6F" Ref="C6"  Part="1" 
F 0 "C6" H 8300 3800 50  0000 R CNN
F 1 "4.7u" H 8350 4000 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 8250 3900 50  0001 C CNN
F 3 "~" H 8250 3900 50  0001 C CNN
	1    8250 3900
	1    0    0    1   
$EndComp
Wire Wire Line
	8250 3800 8250 3700
Connection ~ 8250 3700
Wire Wire Line
	8250 4000 8250 4100
Wire Wire Line
	7950 4100 8100 4100
Connection ~ 8100 4100
Wire Wire Line
	8100 4100 8250 4100
Wire Wire Line
	8250 3700 8600 3700
Text Label 6600 2550 0    50   ~ 0
1210
$EndSCHEMATC
