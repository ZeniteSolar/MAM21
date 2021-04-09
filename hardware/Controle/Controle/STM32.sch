EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
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
U 1 1 60747722
P 3250 3150
AR Path="/60747722" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/60747722" Ref="#PWR0509"  Part="1" 
F 0 "#PWR0509" H 3250 2900 50  0001 C CNN
F 1 "GND" H 3255 2977 50  0000 C CNN
F 2 "" H 3250 3150 50  0001 C CNN
F 3 "" H 3250 3150 50  0001 C CNN
	1    3250 3150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3450 3050 3450 2850
Text Label 4150 3850 0    50   ~ 0
CAN_TX
Wire Wire Line
	4600 3850 4150 3850
Text Label 4150 3750 0    50   ~ 0
CAN_RX
Wire Wire Line
	4600 3750 4150 3750
Text HLabel 4150 3750 0    50   Input ~ 0
CAN_RX
Text HLabel 4150 3850 0    50   Input ~ 0
CAN_TX
Text HLabel 4100 3650 0    50   Output ~ 0
FAN
Wire Wire Line
	4100 3650 4600 3650
$Comp
L Device:LED_Small_ALT D502
U 1 1 6076E79F
P 7300 4050
F 0 "D502" V 7346 3980 50  0000 R CNN
F 1 "G" V 7255 3980 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7300 4050 50  0001 C CNN
F 3 "~" V 7300 4050 50  0001 C CNN
	1    7300 4050
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Small R503
U 1 1 6076FD1F
P 7200 3750
F 0 "R503" V 7300 3750 50  0000 C BNN
F 1 "10k" V 7400 3750 50  0000 C BNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 7200 3750 50  0001 C CNN
F 3 "~" H 7200 3750 50  0001 C CNN
	1    7200 3750
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R502
U 1 1 607707AA
P 7200 3650
F 0 "R502" V 7004 3650 50  0000 C CNN
F 1 "10k" V 7095 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 7200 3650 50  0001 C CNN
F 3 "~" H 7200 3650 50  0001 C CNN
	1    7200 3650
	0    -1   1    0   
$EndComp
$Comp
L Device:LED_Small_ALT D501
U 1 1 60776403
P 7600 4050
F 0 "D501" V 7646 3980 50  0000 R CNN
F 1 "B" V 7555 3980 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7600 4050 50  0001 C CNN
F 3 "~" V 7600 4050 50  0001 C CNN
	1    7600 4050
	0    1    -1   0   
$EndComp
Wire Wire Line
	7600 3950 7600 3650
Wire Wire Line
	7600 3650 7300 3650
$Comp
L power:GND #PWR?
U 1 1 6077A079
P 7450 4200
AR Path="/6077A079" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/6077A079" Ref="#PWR0504"  Part="1" 
F 0 "#PWR0504" H 7450 3950 50  0001 C CNN
F 1 "GND" H 7455 4027 50  0000 C CNN
F 2 "" H 7450 4200 50  0001 C CNN
F 3 "" H 7450 4200 50  0001 C CNN
	1    7450 4200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7600 4150 7600 4200
Wire Wire Line
	7600 4200 7450 4200
Wire Wire Line
	7300 4200 7300 4150
Connection ~ 7450 4200
Wire Wire Line
	7450 4200 7300 4200
$Comp
L Device:Jumper_NC_Dual JP501
U 1 1 60782D59
P 9700 3950
F 0 "JP501" V 9746 4052 50  0000 L CNN
F 1 "Jumper_NC_Dual" V 9655 4052 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm" H 9700 3950 50  0001 C CNN
F 3 "~" H 9700 3950 50  0001 C CNN
	1    9700 3950
	0    1    -1   0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 607842A4
P 9700 3650
AR Path="/607842A4" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/607842A4" Ref="#PWR0501"  Part="1" 
F 0 "#PWR0501" H 9700 3500 50  0001 C CNN
F 1 "+3.3V" H 9715 3823 50  0000 C CNN
F 2 "" H 9700 3650 50  0001 C CNN
F 3 "" H 9700 3650 50  0001 C CNN
	1    9700 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9700 3650 9700 3700
$Comp
L power:GND #PWR?
U 1 1 60785683
P 9700 4250
AR Path="/60785683" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/60785683" Ref="#PWR0502"  Part="1" 
F 0 "#PWR0502" H 9700 4000 50  0001 C CNN
F 1 "GND" H 9705 4077 50  0000 C CNN
F 2 "" H 9700 4250 50  0001 C CNN
F 3 "" H 9700 4250 50  0001 C CNN
	1    9700 4250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9700 4250 9700 4200
Wire Wire Line
	7300 3750 7300 3950
Text Label 7000 3750 2    50   ~ 0
LED1
Text Label 7000 3650 2    50   ~ 0
LED0
Text Label 7150 2350 2    50   ~ 0
USART3_TX
Wire Wire Line
	6700 2350 7150 2350
Text Label 7150 2450 2    50   ~ 0
USART3_RX
Wire Wire Line
	6700 2450 7150 2450
Text HLabel 7150 2450 2    50   Input ~ 0
USART3_RX
Text HLabel 7150 2350 2    50   Input ~ 0
USART3_TX
Wire Wire Line
	9600 3950 9050 3950
Text HLabel 7150 3050 2    50   Output ~ 0
TIM1_CH1N
Wire Wire Line
	7150 3050 6700 3050
Text HLabel 7150 3150 2    50   Output ~ 0
TIM1_CH2N
Wire Wire Line
	7150 3150 6700 3150
Text Label 7150 3050 2    50   ~ 0
TIM1_CH1N
Text Label 7150 3150 2    50   ~ 0
TIM1_CH2N
Text HLabel 4150 3450 0    50   Output ~ 0
TIM1_CH1
Wire Wire Line
	4150 3450 4600 3450
Text HLabel 4150 3550 0    50   Output ~ 0
TIM1_CH2
Wire Wire Line
	4150 3550 4600 3550
Text Label 4150 3450 0    50   ~ 0
TIM1_CH1
Text Label 4150 3550 0    50   ~ 0
TIM1_CH2
Text HLabel 4150 4050 0    50   Input ~ 0
SWCLK
Wire Wire Line
	4150 4050 4600 4050
Text HLabel 4150 3950 0    50   BiDi ~ 0
SWDIO
Wire Wire Line
	4150 3950 4600 3950
Text Label 4150 4050 0    50   ~ 0
SWCLK
Text Label 4150 3950 0    50   ~ 0
SWDIO
$Comp
L Device:C_Small C503
U 1 1 608046B1
P 3500 4850
F 0 "C503" H 3408 4804 50  0000 R CNN
F 1 "100n" H 3408 4895 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3500 4850 50  0001 C CNN
F 3 "~" H 3500 4850 50  0001 C CNN
	1    3500 4850
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R501
U 1 1 60805B49
P 3500 4500
F 0 "R501" H 3441 4454 50  0000 R CNN
F 1 "10k" H 3441 4545 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 3500 4500 50  0001 C CNN
F 3 "~" H 3500 4500 50  0001 C CNN
	1    3500 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 4600 3500 4650
Connection ~ 3500 4650
Wire Wire Line
	3500 4650 3500 4750
$Comp
L power:GND #PWR?
U 1 1 608090D6
P 3500 5050
AR Path="/608090D6" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/608090D6" Ref="#PWR0506"  Part="1" 
F 0 "#PWR0506" H 3500 4800 50  0001 C CNN
F 1 "GND" H 3505 4877 50  0000 C CNN
F 2 "" H 3500 5050 50  0001 C CNN
F 3 "" H 3500 5050 50  0001 C CNN
	1    3500 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5050 3500 4950
$Comp
L power:+3.3V #PWR?
U 1 1 6080AD1E
P 3500 4300
AR Path="/6080AD1E" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/6080AD1E" Ref="#PWR0505"  Part="1" 
F 0 "#PWR0505" H 3500 4150 50  0001 C CNN
F 1 "+3.3V" H 3515 4473 50  0000 C CNN
F 2 "" H 3500 4300 50  0001 C CNN
F 3 "" H 3500 4300 50  0001 C CNN
	1    3500 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4300 3500 4400
Text HLabel 3400 4650 0    50   Input ~ 0
RESET
Wire Wire Line
	3400 4650 3500 4650
Text Label 3800 4650 0    50   ~ 0
RESET
$Comp
L power:+3.3V #PWR?
U 1 1 60747711
P 2800 1900
AR Path="/60747711" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/60747711" Ref="#PWR0508"  Part="1" 
F 0 "#PWR0508" H 2800 1750 50  0001 C CNN
F 1 "+3.3V" H 2815 2073 50  0000 C CNN
F 2 "" H 2800 1900 50  0001 C CNN
F 3 "" H 2800 1900 50  0001 C CNN
	1    2800 1900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3450 2650 3450 2450
$Comp
L Device:C_Small C?
U 1 1 60747718
P 3450 2750
AR Path="/60747718" Ref="C?"  Part="1" 
AR Path="/607427E0/60747718" Ref="C504"  Part="1" 
F 0 "C504" V 3400 2950 50  0000 C CNN
F 1 "100n" V 3400 2550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3450 2750 50  0001 C CNN
F 3 "~" H 3450 2750 50  0001 C CNN
	1    3450 2750
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60714BEE
P 3350 2750
AR Path="/60714BEE" Ref="C?"  Part="1" 
AR Path="/607427E0/60714BEE" Ref="C11"  Part="1" 
F 0 "C11" V 3300 2950 50  0000 C CNN
F 1 "100n" V 3300 2550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3350 2750 50  0001 C CNN
F 3 "~" H 3350 2750 50  0001 C CNN
	1    3350 2750
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60715125
P 3250 2750
AR Path="/60715125" Ref="C?"  Part="1" 
AR Path="/607427E0/60715125" Ref="C10"  Part="1" 
F 0 "C10" V 3200 2950 50  0000 C CNN
F 1 "100n" V 3200 2550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3250 2750 50  0001 C CNN
F 3 "~" H 3250 2750 50  0001 C CNN
	1    3250 2750
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60715682
P 3150 2750
AR Path="/60715682" Ref="C?"  Part="1" 
AR Path="/607427E0/60715682" Ref="C9"  Part="1" 
F 0 "C9" V 3100 2950 50  0000 C CNN
F 1 "100n" V 3100 2550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3150 2750 50  0001 C CNN
F 3 "~" H 3150 2750 50  0001 C CNN
	1    3150 2750
	1    0    0    1   
$EndComp
Wire Wire Line
	3350 2650 3350 2450
$Comp
L Device:C_Small C?
U 1 1 6071A30B
P 3050 2750
AR Path="/6071A30B" Ref="C?"  Part="1" 
AR Path="/607427E0/6071A30B" Ref="C8"  Part="1" 
F 0 "C8" V 3000 2950 50  0000 C CNN
F 1 "100n" V 3000 2550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3050 2750 50  0001 C CNN
F 3 "~" H 3050 2750 50  0001 C CNN
	1    3050 2750
	1    0    0    1   
$EndComp
Wire Wire Line
	2800 1900 2800 2050
Wire Wire Line
	3450 2450 3350 2450
Connection ~ 3450 2450
Wire Wire Line
	3050 2850 3050 3050
Wire Wire Line
	3050 3050 3150 3050
Wire Wire Line
	3150 2850 3150 3050
Connection ~ 3150 3050
Wire Wire Line
	3150 3050 3250 3050
Wire Wire Line
	3250 2850 3250 3050
Connection ~ 3250 3050
Wire Wire Line
	3250 3050 3350 3050
Wire Wire Line
	3350 2850 3350 3050
Connection ~ 3350 3050
Wire Wire Line
	3350 3050 3450 3050
$Comp
L Device:C_Small C?
U 1 1 60736FEA
P 2550 2200
AR Path="/60736FEA" Ref="C?"  Part="1" 
AR Path="/607427E0/60736FEA" Ref="C7"  Part="1" 
F 0 "C7" H 2500 2300 50  0000 C CNN
F 1 "4.7u" H 2450 2400 50  0000 C CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 2550 2200 50  0001 C CNN
F 3 "~" H 2550 2200 50  0001 C CNN
	1    2550 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 2100 2550 2050
Wire Wire Line
	2550 2050 2800 2050
$Comp
L power:GND #PWR?
U 1 1 60739C07
P 2550 2400
AR Path="/60739C07" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/60739C07" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 2550 2150 50  0001 C CNN
F 1 "GND" H 2555 2227 50  0000 C CNN
F 2 "" H 2550 2400 50  0001 C CNN
F 3 "" H 2550 2400 50  0001 C CNN
	1    2550 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2400 2550 2300
Wire Wire Line
	4600 3150 4100 3150
Wire Wire Line
	4600 3050 4100 3050
Wire Wire Line
	4100 2950 4600 2950
Wire Wire Line
	4600 2850 4100 2850
Wire Wire Line
	4100 2750 4600 2750
Wire Wire Line
	4600 2650 4100 2650
Text HLabel 4100 3150 0    50   Input ~ 0
ADCX_IN5
Text HLabel 4100 3050 0    50   Input ~ 0
ADCX_IN4
Text HLabel 4100 2950 0    50   Input ~ 0
ADCX_IN3
Text HLabel 4100 2850 0    50   Input ~ 0
ADC1_IN2
Text HLabel 4100 2750 0    50   Input ~ 0
ADC1_IN1
Text HLabel 4100 2650 0    50   Input ~ 0
ADC1_IN0
$Comp
L STM32G431C8T6:STM32G431CBT6 U501
U 1 1 6070BF48
P 4500 1750
F 0 "U501" H 5650 2015 50  0000 C CNN
F 1 "STM32G431CBT6" H 5650 1924 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 4500 2150 50  0001 L CNN
F 3 "https://www.st.com/resource/en/datasheet/stm32g431cb.pdf" H 4500 2250 50  0001 L CNN
F 4 "32KBytes" H 4500 2350 50  0001 L CNN "RAM size"
F 5 "+85°C" H 4500 2450 50  0001 L CNN "ambient temperature range high"
F 6 "-40°C" H 4500 2550 50  0001 L CNN "ambient temperature range low"
F 7 "No" H 4500 2650 50  0001 L CNN "automotive"
F 8 "IC" H 4500 2750 50  0001 L CNN "category"
F 9 "Arm Cortex-M4" H 4500 2850 50  0001 L CNN "core architecture"
F 10 "32bits" H 4500 2950 50  0001 L CNN "data bus width"
F 11 "Integrated Circuits (ICs)" H 4500 3050 50  0001 L CNN "device class L1"
F 12 "Embedded Processors and Controllers" H 4500 3150 50  0001 L CNN "device class L2"
F 13 "Microcontrollers" H 4500 3250 50  0001 L CNN "device class L3"
F 14 "MAINSTREAM ARM CORTEX-M4+ MCU 17" H 4500 3350 50  0001 L CNN "digikey description"
F 15 "497-19473-ND" H 4500 3450 50  0001 L CNN "digikey part number"
F 16 "170MHz" H 4500 3550 50  0001 L CNN "frequency"
F 17 "1.6mm" H 4500 3650 50  0001 L CNN "height"
F 18 "I2C,SPI,UART,USART,CAN,USB,LIN,IrDA,I2S" H 4500 3750 50  0001 L CNN "interface"
F 19 "Yes" H 4500 3850 50  0001 L CNN "lead free"
F 20 "ab40fe06b39d1fa1" H 4500 3950 50  0001 L CNN "library id"
F 21 "STMicroelectronics" H 4500 4050 50  0001 L CNN "manufacturer"
F 22 "+105°C" H 4500 4150 50  0001 L CNN "max junction temp"
F 23 "3.6V" H 4500 4250 50  0001 L CNN "max supply voltage"
F 24 "128KBytes" H 4500 4350 50  0001 L CNN "memory size"
F 25 "FLASH" H 4500 4450 50  0001 L CNN "memory type"
F 26 "1.62V" H 4500 4550 50  0001 L CNN "min supply voltage"
F 27 "511-STM32G431CBT6" H 4500 4650 50  0001 L CNN "mouser part number"
F 28 "1" H 4500 4750 50  0001 L CNN "number of A/D converters"
F 29 "17" H 4500 4850 50  0001 L CNN "number of ADC channels"
F 30 "38" H 4500 4950 50  0001 L CNN "number of I/Os"
F 31 "3" H 4500 5050 50  0001 L CNN "number of I2C channels"
F 32 "31" H 4500 5150 50  0001 L CNN "number of PWM channels"
F 33 "3" H 4500 5250 50  0001 L CNN "number of SPI channels"
F 34 "4" H 4500 5350 50  0001 L CNN "number of UART channels"
F 35 "1" H 4500 5450 50  0001 L CNN "number of USB channels"
F 36 "1" H 4500 5550 50  0001 L CNN "number of cores"
F 37 "14" H 4500 5650 50  0001 L CNN "number of timers/counters"
F 38 "LQFP48" H 4500 5750 50  0001 L CNN "package"
F 39 "Yes" H 4500 5850 50  0001 L CNN "rohs"
F 40 "0.05mm" H 4500 5950 50  0001 L CNN "standoff height"
F 41 "+85°C" H 4500 6050 50  0001 L CNN "temperature range high"
F 42 "-40°C" H 4500 6150 50  0001 L CNN "temperature range low"
	1    4500 1750
	1    0    0    -1  
$EndComp
Text Label 9050 3950 0    50   ~ 0
BOOT0
Text Label 7150 2550 2    50   ~ 0
BOOT0
Wire Wire Line
	7150 2550 6700 2550
Wire Wire Line
	3500 4650 4600 4650
Wire Wire Line
	2800 2050 3050 2050
Connection ~ 2800 2050
Wire Wire Line
	3450 2450 4600 2450
Wire Wire Line
	3350 2250 4600 2250
Wire Wire Line
	3250 2150 3350 2150
Wire Wire Line
	3350 2250 3350 2450
Connection ~ 3350 2450
Wire Wire Line
	3350 2250 3350 2150
Connection ~ 3350 2250
Connection ~ 3350 2150
Wire Wire Line
	3350 2150 4600 2150
Wire Wire Line
	3250 2150 3250 2650
Wire Wire Line
	3150 2050 3250 2050
Wire Wire Line
	3150 2050 3150 2650
Wire Wire Line
	3050 2050 3050 2650
Wire Wire Line
	3050 2050 3050 1950
Wire Wire Line
	3050 1950 3150 1950
Connection ~ 3050 2050
Wire Wire Line
	3250 2150 3250 2050
Connection ~ 3250 2150
Connection ~ 3250 2050
Wire Wire Line
	3250 2050 4600 2050
Wire Wire Line
	3150 2050 3150 1950
Connection ~ 3150 2050
Connection ~ 3150 1950
Wire Wire Line
	3150 1950 4450 1950
Wire Wire Line
	4600 1750 4450 1750
Wire Wire Line
	4450 1750 4450 1950
Connection ~ 4450 1950
Wire Wire Line
	4450 1950 4600 1950
Wire Wire Line
	3250 3150 3250 3050
$Comp
L power:GND #PWR?
U 1 1 608DE5FC
P 6900 4800
AR Path="/608DE5FC" Ref="#PWR?"  Part="1" 
AR Path="/607427E0/608DE5FC" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 6900 4550 50  0001 C CNN
F 1 "GND" H 6905 4627 50  0000 C CNN
F 2 "" H 6900 4800 50  0001 C CNN
F 3 "" H 6900 4800 50  0001 C CNN
	1    6900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 4350 6700 4450
Connection ~ 6700 4450
Wire Wire Line
	6700 4450 6700 4500
Connection ~ 6700 4550
Wire Wire Line
	6700 4550 6700 4650
Wire Wire Line
	6700 4500 6900 4500
Wire Wire Line
	6900 4500 6900 4800
Connection ~ 6700 4500
Wire Wire Line
	6700 4500 6700 4550
Text Label 7100 2050 2    50   ~ 0
SWO
Wire Wire Line
	7100 2050 6700 2050
Text HLabel 7100 2050 2    50   Input ~ 0
SWO
NoConn ~ 6700 1750
NoConn ~ 6700 1850
NoConn ~ 6700 1950
NoConn ~ 6700 2650
NoConn ~ 6700 2750
NoConn ~ 6700 2850
NoConn ~ 6700 2950
NoConn ~ 6700 3250
NoConn ~ 6700 3550
NoConn ~ 4600 4450
NoConn ~ 4600 4350
NoConn ~ 4600 3250
NoConn ~ 4600 3350
Wire Wire Line
	6700 3650 7100 3650
Wire Wire Line
	6700 3750 7100 3750
NoConn ~ 4600 4150
NoConn ~ 6700 2150
NoConn ~ 6700 2250
$EndSCHEMATC
