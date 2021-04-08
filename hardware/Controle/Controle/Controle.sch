EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
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
L power:GND #PWR0113
U 1 1 6067BD77
P 6150 3600
F 0 "#PWR0113" H 6150 3350 50  0001 C CNN
F 1 "GND" H 6155 3427 50  0000 C CNN
F 2 "" H 6150 3600 50  0001 C CNN
F 3 "" H 6150 3600 50  0001 C CNN
	1    6150 3600
	1    0    0    -1  
$EndComp
$Sheet
S 6250 2950 750  600 
U 606C6891
F0 "canbus" 50
F1 "canbus.sch" 50
F2 "CAN_H" I R 7000 3050 50 
F3 "CAN_L" I R 7000 3150 50 
F4 "CAN_TX" I L 6250 3050 50 
F5 "CAN_RX" I L 6250 3150 50 
F6 "5v" I L 6250 3400 50 
F7 "GND" I L 6250 3500 50 
$EndSheet
$Sheet
S 7550 2850 550  500 
U 60672CF6
F0 "canbus_connector" 50
F1 "canbus_connector.sch" 50
F2 "CAN_H" B L 7550 3050 50 
F3 "CAN_L" B L 7550 3150 50 
F4 "CAN_18V" O L 7550 2950 50 
F5 "CAN_GND" B L 7550 3250 50 
$EndSheet
Wire Wire Line
	7000 3150 7550 3150
Wire Wire Line
	7550 3050 7000 3050
$Sheet
S 6250 2050 750  400 
U 6072A37E
F0 "Powersupply" 50
F1 "Powersupply.sch" 50
F2 "+18V" I R 7000 2150 50 
F3 "+5V" I L 6250 2250 50 
F4 "+3V3" I L 6250 2350 50 
F5 "GND" I R 7000 2250 50 
F6 "+15V" I L 6250 2150 50 
$EndSheet
Wire Wire Line
	6250 3500 6150 3500
Wire Wire Line
	6150 3500 6150 3600
$Sheet
S 2800 1150 1000 2050
U 607427E0
F0 "STM32" 50
F1 "STM32.sch" 50
F2 "CAN_RX" I R 3800 3150 50 
F3 "CAN_TX" I R 3800 3050 50 
F4 "ADC1_IN0" I R 3800 1300 50 
F5 "ADC1_IN1" I R 3800 1400 50 
F6 "ADC1_IN2" I R 3800 1500 50 
F7 "ADCX_IN3" I R 3800 1600 50 
F8 "ADCX_IN4" I R 3800 1700 50 
F9 "ADCX_IN5" I R 3800 1800 50 
F10 "FAN" O L 2800 3100 50 
F11 "USART3_RX" I L 2800 1350 50 
F12 "USART3_TX" I L 2800 1450 50 
F13 "TIM1_CH1N" O R 3800 2600 50 
F14 "TIM1_CH2N" O R 3800 2500 50 
F15 "TIM1_CH1" O R 3800 2400 50 
F16 "TIM1_CH2" O R 3800 2300 50 
F17 "SWCLK" I L 2800 2000 50 
F18 "SWDIO" B L 2800 2100 50 
F19 "RESET" I L 2800 1250 50 
$EndSheet
$Comp
L power:GND #PWR0115
U 1 1 60747D7A
P 7400 3300
F 0 "#PWR0115" H 7400 3050 50  0001 C CNN
F 1 "GND" H 7405 3127 50  0000 C CNN
F 2 "" H 7400 3300 50  0001 C CNN
F 3 "" H 7400 3300 50  0001 C CNN
	1    7400 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3300 7400 3250
Wire Wire Line
	7400 3250 7550 3250
Wire Wire Line
	7550 2950 7450 2950
Wire Wire Line
	7450 2950 7450 2600
$Comp
L power:GND #PWR0114
U 1 1 6075007E
P 7200 2350
F 0 "#PWR0114" H 7200 2100 50  0001 C CNN
F 1 "GND" H 7205 2177 50  0000 C CNN
F 2 "" H 7200 2350 50  0001 C CNN
F 3 "" H 7200 2350 50  0001 C CNN
	1    7200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2350 7200 2250
Wire Wire Line
	7200 2250 7000 2250
$Comp
L power:+5V #PWR0110
U 1 1 60750758
P 5950 2150
F 0 "#PWR0110" H 5950 2000 50  0001 C CNN
F 1 "+5V" H 5965 2323 50  0000 C CNN
F 2 "" H 5950 2150 50  0001 C CNN
F 3 "" H 5950 2150 50  0001 C CNN
	1    5950 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2150 5950 2250
Wire Wire Line
	5950 2250 6250 2250
$Comp
L power:+3V3 #PWR0109
U 1 1 607511D0
P 5750 2150
F 0 "#PWR0109" H 5750 2000 50  0001 C CNN
F 1 "+3V3" H 5765 2323 50  0000 C CNN
F 2 "" H 5750 2150 50  0001 C CNN
F 3 "" H 5750 2150 50  0001 C CNN
	1    5750 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2150 5750 2350
Wire Wire Line
	5750 2350 6250 2350
$Comp
L power:+5V #PWR0112
U 1 1 60751DF4
P 6150 3400
F 0 "#PWR0112" H 6150 3250 50  0001 C CNN
F 1 "+5V" H 6165 3573 50  0000 C CNN
F 2 "" H 6150 3400 50  0001 C CNN
F 3 "" H 6150 3400 50  0001 C CNN
	1    6150 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3400 6250 3400
$Comp
L Connector_Generic:Conn_01x04 J102
U 1 1 6075C4FB
P 1550 2000
AR Path="/6075C4FB" Ref="J102"  Part="1" 
AR Path="/607427E0/6075C4FB" Ref="J?"  Part="1" 
F 0 "J102" H 1468 2317 50  0000 C CNN
F 1 "ST_LINK" H 1550 2200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical_SMD_Pin1Left" H 1550 2000 50  0001 C CNN
F 3 "~" H 1550 2000 50  0001 C CNN
	1    1550 2000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6075C503
P 1750 2350
AR Path="/6075C503" Ref="#PWR0102"  Part="1" 
AR Path="/607427E0/6075C503" Ref="#PWR?"  Part="1" 
F 0 "#PWR0102" H 1750 2100 50  0001 C CNN
F 1 "GND" H 1755 2177 50  0000 C CNN
F 2 "" H 1750 2350 50  0001 C CNN
F 3 "" H 1750 2350 50  0001 C CNN
	1    1750 2350
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 6075C509
P 1750 1800
AR Path="/6075C509" Ref="#PWR0101"  Part="1" 
AR Path="/607427E0/6075C509" Ref="#PWR?"  Part="1" 
F 0 "#PWR0101" H 1750 1650 50  0001 C CNN
F 1 "+3.3V" H 1765 1973 50  0000 C CNN
F 2 "" H 1750 1800 50  0001 C CNN
F 3 "" H 1750 1800 50  0001 C CNN
	1    1750 1800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1750 1800 1750 1900
$Comp
L Device:C_Small C101
U 1 1 6075C510
P 1750 2050
AR Path="/6075C510" Ref="C101"  Part="1" 
AR Path="/607427E0/6075C510" Ref="C?"  Part="1" 
F 0 "C101" H 1658 2004 50  0000 R CNN
F 1 "100n" H 1658 2095 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 1750 2050 50  0001 C CNN
F 3 "~" H 1750 2050 50  0001 C CNN
	1    1750 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 1950 1750 1900
Connection ~ 1750 1900
Wire Wire Line
	1750 2150 1750 2200
Connection ~ 1750 2200
Wire Wire Line
	1750 2200 1750 2350
Wire Wire Line
	1750 2000 2800 2000
Wire Wire Line
	1750 2100 2800 2100
$Comp
L Connector_Generic:Conn_01x04 J101
U 1 1 60823D5A
P 1550 1350
AR Path="/60823D5A" Ref="J101"  Part="1" 
AR Path="/607427E0/60823D5A" Ref="J?"  Part="1" 
F 0 "J101" H 1468 1667 50  0000 C CNN
F 1 "USART" H 1468 1576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical_SMD_Pin1Left" H 1550 1350 50  0001 C CNN
F 3 "~" H 1550 1350 50  0001 C CNN
	1    1550 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1750 1450 2800 1450
Wire Wire Line
	1750 1350 2800 1350
Wire Wire Line
	2800 1250 1750 1250
$Comp
L power:GND #PWR0103
U 1 1 6082EC67
P 1900 1650
AR Path="/6082EC67" Ref="#PWR0103"  Part="1" 
AR Path="/607427E0/6082EC67" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 1900 1400 50  0001 C CNN
F 1 "GND" H 1905 1477 50  0000 C CNN
F 2 "" H 1900 1650 50  0001 C CNN
F 3 "" H 1900 1650 50  0001 C CNN
	1    1900 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1900 1650 1900 1550
Wire Wire Line
	1900 1550 1750 1550
$Sheet
S 4050 1200 550  750 
U 60830E95
F0 "analog" 50
F1 "analog.sch" 50
F2 "In1" I R 4600 1400 50 
F3 "Out1" O L 4050 1400 50 
F4 "GND" I R 4600 1900 50 
F5 "In2" I R 4600 1500 50 
F6 "Out2" O L 4050 1500 50 
F7 "In3" I R 4600 1600 50 
F8 "Out3" O L 4050 1600 50 
F9 "In4" I R 4600 1700 50 
F10 "Out4" O L 4050 1700 50 
F11 "In5" I R 4600 1800 50 
F12 "Out5" O L 4050 1800 50 
F13 "Out0" O L 4050 1300 50 
F14 "In0" I R 4600 1300 50 
F15 "3v3" I L 4050 1900 50 
$EndSheet
Wire Wire Line
	3800 1300 4050 1300
Wire Wire Line
	3800 1400 4050 1400
Wire Wire Line
	3800 1500 4050 1500
Wire Wire Line
	3800 1600 4050 1600
Wire Wire Line
	3800 1700 4050 1700
Wire Wire Line
	3800 1800 4050 1800
$Comp
L power:GND #PWR0108
U 1 1 6086FF0E
P 4700 1950
F 0 "#PWR0108" H 4700 1700 50  0001 C CNN
F 1 "GND" H 4705 1777 50  0000 C CNN
F 2 "" H 4700 1950 50  0001 C CNN
F 3 "" H 4700 1950 50  0001 C CNN
	1    4700 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1950 4700 1900
Wire Wire Line
	4600 1900 4700 1900
Wire Wire Line
	3800 3050 6250 3050
Wire Wire Line
	3800 3150 6250 3150
$Comp
L power:+15V #PWR0111
U 1 1 608C3F24
P 6150 2150
F 0 "#PWR0111" H 6150 2000 50  0001 C CNN
F 1 "+15V" H 6165 2323 50  0000 C CNN
F 2 "" H 6150 2150 50  0001 C CNN
F 3 "" H 6150 2150 50  0001 C CNN
	1    6150 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2150 6250 2150
$Comp
L power:+15V #PWR0105
U 1 1 608CA50C
P 9600 900
F 0 "#PWR0105" H 9600 750 50  0001 C CNN
F 1 "+15V" H 9615 1073 50  0000 C CNN
F 2 "" H 9600 900 50  0001 C CNN
F 3 "" H 9600 900 50  0001 C CNN
	1    9600 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 608CD36C
P 10750 1200
F 0 "#PWR0106" H 10750 950 50  0001 C CNN
F 1 "GND" H 10850 1200 50  0000 C CNN
F 2 "" H 10750 1200 50  0001 C CNN
F 3 "" H 10750 1200 50  0001 C CNN
	1    10750 1200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J103
U 1 1 608D358A
P 1600 3000
F 0 "J103" H 1518 2675 50  0000 C CNN
F 1 "FAN" H 1600 2800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 1600 3000 50  0001 C CNN
F 3 "~" H 1600 3000 50  0001 C CNN
	1    1600 3000
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R102
U 1 1 608DAEF1
P 2600 3100
F 0 "R102" V 2404 3100 50  0000 C CNN
F 1 "?" V 2495 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 2600 3100 50  0001 C CNN
F 3 "~" H 2600 3100 50  0001 C CNN
	1    2600 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 3100 2800 3100
Wire Wire Line
	2350 3100 2500 3100
Wire Wire Line
	1800 3000 1800 3300
Wire Wire Line
	1800 3300 2050 3300
$Comp
L power:GND #PWR0104
U 1 1 608F5B69
P 2050 3450
AR Path="/608F5B69" Ref="#PWR0104"  Part="1" 
AR Path="/607427E0/608F5B69" Ref="#PWR?"  Part="1" 
F 0 "#PWR0104" H 2050 3200 50  0001 C CNN
F 1 "GND" H 2055 3277 50  0000 C CNN
F 2 "" H 2050 3450 50  0001 C CNN
F 3 "" H 2050 3450 50  0001 C CNN
	1    2050 3450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2050 3450 2050 3300
$Comp
L Device:R_Small R101
U 1 1 60904DF2
P 1900 2900
F 0 "R101" V 1704 2900 50  0000 C CNN
F 1 "?" V 1795 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 1900 2900 50  0001 C CNN
F 3 "~" H 1900 2900 50  0001 C CNN
	1    1900 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 2900 2050 2900
$Comp
L Device:Fuse F101
U 1 1 60932CB5
P 7450 2450
F 0 "F101" H 7510 2496 50  0000 L CNN
F 1 "500ma" H 7510 2405 50  0000 L CNN
F 2 "Fuse:Fuse_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7380 2450 50  0001 C CNN
F 3 "~" H 7450 2450 50  0001 C CNN
	1    7450 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2300 7450 2150
$Comp
L Device:D_Small D101
U 1 1 6093366B
P 7200 2150
F 0 "D101" H 7200 2357 50  0000 C CNN
F 1 "LL4148" H 7200 2266 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" V 7200 2150 50  0001 C CNN
F 3 "~" V 7200 2150 50  0001 C CNN
	1    7200 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2150 7000 2150
Wire Wire Line
	7300 2150 7450 2150
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 6094BB7D
P 7400 3250
F 0 "#FLG0102" H 7400 3325 50  0001 C CNN
F 1 "PWR_FLAG" H 7400 3423 50  0000 C CNN
F 2 "" H 7400 3250 50  0001 C CNN
F 3 "~" H 7400 3250 50  0001 C CNN
	1    7400 3250
	1    0    0    -1  
$EndComp
Connection ~ 7400 3250
$Comp
L Device:Q_NPN_BEC Q101
U 1 1 6095AC0C
P 2150 3100
F 0 "Q101" H 2341 3146 50  0000 L CNN
F 1 "BCV27" H 2341 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2350 3200 50  0001 C CNN
F 3 "~" H 2150 3100 50  0001 C CNN
	1    2150 3100
	-1   0    0    -1  
$EndComp
Connection ~ 2050 3300
$Comp
L Device:C_Small C1
U 1 1 607831AE
P 10000 750
AR Path="/607831AE" Ref="C1"  Part="1" 
AR Path="/607427E0/607831AE" Ref="C?"  Part="1" 
F 0 "C1" H 9950 650 50  0000 R CNN
F 1 "4.7u" H 9950 850 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 10000 750 50  0001 C CNN
F 3 "~" H 10000 750 50  0001 C CNN
	1    10000 750 
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J107
U 1 1 607EA932
P 9950 1400
F 0 "J107" H 9800 700 50  0000 C CNN
F 1 "Driver-Sense" H 10000 800 50  0000 C CNN
F 2 "KicadZeniteSolarLibrary18:PinSocket_2x10_P1.27mm_Vertical_SMD" H 9950 1400 50  0001 C CNN
F 3 "~" H 9950 1400 50  0001 C CNN
	1    9950 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1050 8550 1050
$Comp
L Connector_Generic:Conn_01x03 J106
U 1 1 60813588
P 8750 1050
F 0 "J106" H 8850 850 50  0000 L CNN
F 1 "Iin_sen" H 8700 800 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical_SMD_Pin1Left" H 8750 1050 50  0001 C CNN
F 3 "~" H 8750 1050 50  0001 C CNN
	1    8750 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C103
U 1 1 60830DE1
P 8550 1050
AR Path="/60830DE1" Ref="C103"  Part="1" 
AR Path="/607427E0/60830DE1" Ref="C?"  Part="1" 
F 0 "C103" H 8700 1200 50  0000 R CNN
F 1 "4.7u" H 8600 1200 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 8550 1050 50  0001 C CNN
F 3 "~" H 8550 1050 50  0001 C CNN
	1    8550 1050
	-1   0    0    1   
$EndComp
Wire Wire Line
	4600 1600 4950 1600
Text Label 4950 1600 2    50   ~ 0
Temp1
Wire Wire Line
	4600 1500 4950 1500
Text Label 4950 1500 2    50   ~ 0
Vin_sen
Wire Wire Line
	4600 1400 4950 1400
Text Label 4950 1400 2    50   ~ 0
SL2_sen
Wire Wire Line
	4600 1300 4950 1300
Text Label 4950 1300 2    50   ~ 0
SL1_sen
Wire Wire Line
	4600 1700 4950 1700
Text Label 4950 1700 2    50   ~ 0
Iin_sen
Wire Wire Line
	4600 1800 4950 1800
Text Label 4950 1800 2    50   ~ 0
Iout_sen
$Comp
L power:+5V #PWR0124
U 1 1 6085AC03
P 9200 1850
F 0 "#PWR0124" H 9200 1700 50  0001 C CNN
F 1 "+5V" H 9300 1900 50  0000 C CNN
F 2 "" H 9200 1850 50  0001 C CNN
F 3 "" H 9200 1850 50  0001 C CNN
	1    9200 1850
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 6085D137
P 10550 1900
F 0 "#PWR0125" H 10550 1650 50  0001 C CNN
F 1 "GND" H 10555 1727 50  0000 C CNN
F 2 "" H 10550 1900 50  0001 C CNN
F 3 "" H 10550 1900 50  0001 C CNN
	1    10550 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 1900 10250 1900
Wire Wire Line
	9600 900  9600 1000
Wire Wire Line
	9600 1000 9750 1000
Wire Wire Line
	9750 1300 9750 1200
Connection ~ 9750 1000
Connection ~ 9750 1100
Wire Wire Line
	9750 1100 9750 1000
Connection ~ 9750 1200
Wire Wire Line
	9750 1200 9750 1100
Wire Wire Line
	10250 1300 10250 1200
Connection ~ 10250 1100
Wire Wire Line
	10250 1100 10250 1000
Connection ~ 10250 1200
Wire Wire Line
	10250 1200 10250 1100
Wire Wire Line
	10100 750  10250 750 
Wire Wire Line
	10250 750  10250 1000
Connection ~ 10250 1000
Wire Wire Line
	9900 750  9750 750 
$Comp
L Device:C_Small C104
U 1 1 60895922
P 10000 600
AR Path="/60895922" Ref="C104"  Part="1" 
AR Path="/607427E0/60895922" Ref="C?"  Part="1" 
F 0 "C104" H 10100 500 50  0000 R CNN
F 1 "4.7u" H 10150 700 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 10000 600 50  0001 C CNN
F 3 "~" H 10000 600 50  0001 C CNN
	1    10000 600 
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 600  10250 600 
Wire Wire Line
	10250 600  10250 750 
Connection ~ 10250 750 
Wire Wire Line
	9900 600  9750 600 
Wire Wire Line
	9750 600  9750 750 
Connection ~ 9750 750 
Wire Wire Line
	9750 750  9750 1000
Wire Wire Line
	9750 1900 9200 1900
Wire Wire Line
	9200 1900 9200 1850
Wire Wire Line
	10250 1800 10550 1800
Wire Wire Line
	10250 1700 10550 1700
Wire Wire Line
	10250 1200 10750 1200
Text Label 10550 1800 2    50   ~ 0
Temp1
Text Label 10550 1700 2    50   ~ 0
Vin_sen
Text Label 10550 1600 2    50   ~ 0
SL2_sen
Wire Wire Line
	10550 1600 10250 1600
Text Label 10550 1500 2    50   ~ 0
SL1_sen
Wire Wire Line
	10550 1500 10250 1500
Text Label 4300 2300 2    50   ~ 0
PWM_H2
Wire Wire Line
	4300 2600 3800 2600
Text Label 4300 2500 2    50   ~ 0
PWM_L2
Wire Wire Line
	4300 2500 3800 2500
Text Label 4300 2400 2    50   ~ 0
PWM_H1
Wire Wire Line
	4300 2400 3800 2400
Wire Wire Line
	3800 2300 4300 2300
Text Label 4300 2600 2    50   ~ 0
PWM_L1
Text Label 9250 1800 0    50   ~ 0
PWM_H2
Wire Wire Line
	9250 1800 9750 1800
Text Label 9250 1700 0    50   ~ 0
PWM_L2
Wire Wire Line
	9250 1700 9750 1700
Text Label 9250 1600 0    50   ~ 0
PWM_H1
Wire Wire Line
	9250 1600 9750 1600
Wire Wire Line
	9750 1500 9250 1500
Text Label 9250 1500 0    50   ~ 0
PWM_L1
Wire Wire Line
	9750 1300 9750 1400
Connection ~ 9750 1300
Wire Wire Line
	10250 1400 10250 1300
Connection ~ 10250 1300
Text Label 8300 1050 2    50   ~ 0
Iin_sen
$Comp
L power:GND #PWR0126
U 1 1 6091057C
P 8300 1300
F 0 "#PWR0126" H 8300 1050 50  0001 C CNN
F 1 "GND" H 8305 1127 50  0000 C CNN
F 2 "" H 8300 1300 50  0001 C CNN
F 3 "" H 8300 1300 50  0001 C CNN
	1    8300 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1300 8300 1150
Wire Wire Line
	8300 1150 8550 1150
Connection ~ 8550 1150
$Comp
L power:+15V #PWR0127
U 1 1 60916056
P 7200 850
F 0 "#PWR0127" H 7200 700 50  0001 C CNN
F 1 "+15V" H 7250 1000 50  0000 C CNN
F 2 "" H 7200 850 50  0001 C CNN
F 3 "" H 7200 850 50  0001 C CNN
	1    7200 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1050 7600 1050
$Comp
L Device:D_Small D102
U 1 1 6091605D
P 7300 950
F 0 "D102" H 7200 750 50  0000 C CNN
F 1 "LL4148" H 7250 850 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" V 7300 950 50  0001 C CNN
F 3 "~" V 7300 950 50  0001 C CNN
	1    7300 950 
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J105
U 1 1 60916063
P 7800 1050
F 0 "J105" H 7900 850 50  0000 L CNN
F 1 "Iin_sen" H 7750 800 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical_SMD_Pin1Left" H 7800 1050 50  0001 C CNN
F 3 "~" H 7800 1050 50  0001 C CNN
	1    7800 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 850  7200 950 
$Comp
L Device:C_Small C102
U 1 1 6091606A
P 7600 1050
AR Path="/6091606A" Ref="C102"  Part="1" 
AR Path="/607427E0/6091606A" Ref="C?"  Part="1" 
F 0 "C102" H 7750 1200 50  0000 R CNN
F 1 "4.7u" H 7650 1200 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 7600 1050 50  0001 C CNN
F 3 "~" H 7600 1050 50  0001 C CNN
	1    7600 1050
	-1   0    0    1   
$EndComp
Text Label 7350 1050 2    50   ~ 0
Iout_sen
$Comp
L power:GND #PWR0128
U 1 1 60916072
P 7350 1300
F 0 "#PWR0128" H 7350 1050 50  0001 C CNN
F 1 "GND" H 7355 1127 50  0000 C CNN
F 2 "" H 7350 1300 50  0001 C CNN
F 3 "" H 7350 1300 50  0001 C CNN
	1    7350 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1300 7350 1150
Wire Wire Line
	7350 1150 7600 1150
Connection ~ 7600 1150
Wire Wire Line
	7400 950  7600 950 
Connection ~ 8550 950 
Connection ~ 7600 950 
Wire Wire Line
	7600 950  8550 950 
$Comp
L power:+3V3 #PWR0107
U 1 1 609425C2
P 3950 1900
F 0 "#PWR0107" H 3950 1750 50  0001 C CNN
F 1 "+3V3" H 3965 2073 50  0000 C CNN
F 2 "" H 3950 1900 50  0001 C CNN
F 3 "" H 3950 1900 50  0001 C CNN
	1    3950 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1900 4050 1900
$EndSCHEMATC
