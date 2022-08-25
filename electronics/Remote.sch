EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L RF_Module:ESP32-WROOM-32D U1
U 1 1 6094E32B
P 5750 3550
F 0 "U1" H 5750 5131 50  0000 C CNN
F 1 "ESP32-WROOM-32D" H 5750 5040 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 5750 2050 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 5450 3600 50  0001 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 6094EEC1
P 1350 2450
F 0 "SW1" H 1350 2735 50  0000 C CNN
F 1 "SW_Push" H 1350 2644 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1350 2650 50  0001 C CNN
F 3 "~" H 1350 2650 50  0001 C CNN
	1    1350 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 6094F4DE
P 1650 2300
F 0 "R6" H 1720 2346 50  0000 L CNN
F 1 "100R" H 1720 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1580 2300 50  0001 C CNN
F 3 "~" H 1650 2300 50  0001 C CNN
	1    1650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2450 1650 2450
$Comp
L power:VCC #PWR01
U 1 1 6095048C
P 1050 2100
F 0 "#PWR01" H 1050 1950 50  0001 C CNN
F 1 "VCC" H 1065 2273 50  0000 C CNN
F 2 "" H 1050 2100 50  0001 C CNN
F 3 "" H 1050 2100 50  0001 C CNN
	1    1050 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 609514FB
P 1850 2300
F 0 "C1" H 1965 2346 50  0000 L CNN
F 1 "100nF" H 1965 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1888 2150 50  0001 C CNN
F 3 "~" H 1850 2300 50  0001 C CNN
	1    1850 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6095357C
P 1050 2300
F 0 "R1" H 1120 2346 50  0000 L CNN
F 1 "10kR" H 1120 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 980 2300 50  0001 C CNN
F 3 "~" H 1050 2300 50  0001 C CNN
	1    1050 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2450 1150 2450
Wire Wire Line
	1050 2100 1050 2150
Wire Wire Line
	1650 2450 1850 2450
Connection ~ 1650 2450
$Comp
L power:GND #PWR06
U 1 1 6095C249
P 1850 2100
F 0 "#PWR06" H 1850 1850 50  0001 C CNN
F 1 "GND" H 1855 1927 50  0000 C CNN
F 2 "" H 1850 2100 50  0001 C CNN
F 3 "" H 1850 2100 50  0001 C CNN
	1    1850 2100
	-1   0    0    1   
$EndComp
Text GLabel 2000 2450 2    50   Input ~ 0
GPIO16
Wire Wire Line
	1650 2100 1650 2150
Wire Wire Line
	1850 2100 1850 2150
$Comp
L Switch:SW_Push SW2
U 1 1 60962254
P 1350 3450
F 0 "SW2" H 1350 3735 50  0000 C CNN
F 1 "SW_Push" H 1350 3644 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1350 3650 50  0001 C CNN
F 3 "~" H 1350 3650 50  0001 C CNN
	1    1350 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 6096225A
P 1650 3300
F 0 "R7" H 1720 3346 50  0000 L CNN
F 1 "100R" H 1720 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1580 3300 50  0001 C CNN
F 3 "~" H 1650 3300 50  0001 C CNN
	1    1650 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3450 1650 3450
$Comp
L power:VCC #PWR02
U 1 1 60962261
P 1050 3100
F 0 "#PWR02" H 1050 2950 50  0001 C CNN
F 1 "VCC" H 1065 3273 50  0000 C CNN
F 2 "" H 1050 3100 50  0001 C CNN
F 3 "" H 1050 3100 50  0001 C CNN
	1    1050 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 6096226D
P 1050 3300
F 0 "R2" H 1120 3346 50  0000 L CNN
F 1 "10kR" H 1120 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 980 3300 50  0001 C CNN
F 3 "~" H 1050 3300 50  0001 C CNN
	1    1050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 3450 1150 3450
Wire Wire Line
	1050 3100 1050 3150
Wire Wire Line
	1650 3450 1850 3450
Connection ~ 1650 3450
$Comp
L power:GND #PWR07
U 1 1 60962277
P 1850 3100
F 0 "#PWR07" H 1850 2850 50  0001 C CNN
F 1 "GND" H 1855 2927 50  0000 C CNN
F 2 "" H 1850 3100 50  0001 C CNN
F 3 "" H 1850 3100 50  0001 C CNN
	1    1850 3100
	-1   0    0    1   
$EndComp
Text GLabel 2000 3450 2    50   Input ~ 0
GPIO17
Wire Wire Line
	1650 3100 1650 3150
Wire Wire Line
	1850 3100 1850 3150
$Comp
L Switch:SW_Push SW3
U 1 1 60963A1D
P 1350 4400
F 0 "SW3" H 1350 4685 50  0000 C CNN
F 1 "SW_Push" H 1350 4594 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1350 4600 50  0001 C CNN
F 3 "~" H 1350 4600 50  0001 C CNN
	1    1350 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 60963A23
P 1650 4250
F 0 "R8" H 1720 4296 50  0000 L CNN
F 1 "100R" H 1720 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1580 4250 50  0001 C CNN
F 3 "~" H 1650 4250 50  0001 C CNN
	1    1650 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4400 1650 4400
$Comp
L power:VCC #PWR03
U 1 1 60963A2A
P 1050 4050
F 0 "#PWR03" H 1050 3900 50  0001 C CNN
F 1 "VCC" H 1065 4223 50  0000 C CNN
F 2 "" H 1050 4050 50  0001 C CNN
F 3 "" H 1050 4050 50  0001 C CNN
	1    1050 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 60963A36
P 1050 4250
F 0 "R3" H 1120 4296 50  0000 L CNN
F 1 "10kR" H 1120 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 980 4250 50  0001 C CNN
F 3 "~" H 1050 4250 50  0001 C CNN
	1    1050 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 4400 1150 4400
Wire Wire Line
	1050 4050 1050 4100
Wire Wire Line
	1650 4400 1900 4400
Connection ~ 1650 4400
$Comp
L power:GND #PWR08
U 1 1 60963A40
P 1900 4050
F 0 "#PWR08" H 1900 3800 50  0001 C CNN
F 1 "GND" H 1905 3877 50  0000 C CNN
F 2 "" H 1900 4050 50  0001 C CNN
F 3 "" H 1900 4050 50  0001 C CNN
	1    1900 4050
	-1   0    0    1   
$EndComp
Text GLabel 2000 4400 2    50   Input ~ 0
GPIO26
Wire Wire Line
	1650 4050 1650 4100
Wire Wire Line
	1900 4050 1900 4100
$Comp
L Switch:SW_Push SW4
U 1 1 60964A83
P 1350 5350
F 0 "SW4" H 1350 5635 50  0000 C CNN
F 1 "SW_Push" H 1350 5544 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1350 5550 50  0001 C CNN
F 3 "~" H 1350 5550 50  0001 C CNN
	1    1350 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 60964A89
P 1650 5200
F 0 "R9" H 1720 5246 50  0000 L CNN
F 1 "100R" H 1720 5155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1580 5200 50  0001 C CNN
F 3 "~" H 1650 5200 50  0001 C CNN
	1    1650 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5350 1650 5350
$Comp
L power:VCC #PWR04
U 1 1 60964A90
P 1050 5000
F 0 "#PWR04" H 1050 4850 50  0001 C CNN
F 1 "VCC" H 1065 5173 50  0000 C CNN
F 2 "" H 1050 5000 50  0001 C CNN
F 3 "" H 1050 5000 50  0001 C CNN
	1    1050 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 60964A9C
P 1050 5200
F 0 "R4" H 1120 5246 50  0000 L CNN
F 1 "10kR" H 1120 5155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 980 5200 50  0001 C CNN
F 3 "~" H 1050 5200 50  0001 C CNN
	1    1050 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 5350 1150 5350
Wire Wire Line
	1050 5000 1050 5050
Wire Wire Line
	1650 5350 1900 5350
Connection ~ 1650 5350
$Comp
L power:GND #PWR09
U 1 1 60964AA6
P 1900 5000
F 0 "#PWR09" H 1900 4750 50  0001 C CNN
F 1 "GND" H 1905 4827 50  0000 C CNN
F 2 "" H 1900 5000 50  0001 C CNN
F 3 "" H 1900 5000 50  0001 C CNN
	1    1900 5000
	-1   0    0    1   
$EndComp
Text GLabel 2000 5350 2    50   Input ~ 0
GPIO18
Wire Wire Line
	1650 5000 1650 5050
Wire Wire Line
	1900 5000 1900 5050
$Comp
L Switch:SW_Push SW8
U 1 1 60968E70
P 2900 2450
F 0 "SW8" H 2900 2735 50  0000 C CNN
F 1 "SW_Push" H 2900 2644 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2900 2650 50  0001 C CNN
F 3 "~" H 2900 2650 50  0001 C CNN
	1    2900 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 60968E76
P 3200 2300
F 0 "R17" H 3270 2346 50  0000 L CNN
F 1 "100R" H 3270 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3130 2300 50  0001 C CNN
F 3 "~" H 3200 2300 50  0001 C CNN
	1    3200 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2450 3200 2450
$Comp
L power:VCC #PWR013
U 1 1 60968E7D
P 2600 2100
F 0 "#PWR013" H 2600 1950 50  0001 C CNN
F 1 "VCC" H 2615 2273 50  0000 C CNN
F 2 "" H 2600 2100 50  0001 C CNN
F 3 "" H 2600 2100 50  0001 C CNN
	1    2600 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 60968E89
P 2600 2300
F 0 "R13" H 2670 2346 50  0000 L CNN
F 1 "10kR" H 2670 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2530 2300 50  0001 C CNN
F 3 "~" H 2600 2300 50  0001 C CNN
	1    2600 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2450 2700 2450
Wire Wire Line
	2600 2100 2600 2150
Wire Wire Line
	3200 2450 3450 2450
Connection ~ 3200 2450
$Comp
L power:GND #PWR017
U 1 1 60968E93
P 3450 2100
F 0 "#PWR017" H 3450 1850 50  0001 C CNN
F 1 "GND" H 3455 1927 50  0000 C CNN
F 2 "" H 3450 2100 50  0001 C CNN
F 3 "" H 3450 2100 50  0001 C CNN
	1    3450 2100
	-1   0    0    1   
$EndComp
Text GLabel 3550 2450 2    50   Input ~ 0
GPIO5
Wire Wire Line
	3200 2100 3200 2150
Wire Wire Line
	3450 2100 3450 2150
$Comp
L Switch:SW_Push SW9
U 1 1 6096A5B3
P 2900 3450
F 0 "SW9" H 2900 3735 50  0000 C CNN
F 1 "SW_Push" H 2900 3644 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2900 3650 50  0001 C CNN
F 3 "~" H 2900 3650 50  0001 C CNN
	1    2900 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 6096A5B9
P 3200 3300
F 0 "R18" H 3270 3346 50  0000 L CNN
F 1 "100R" H 3270 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3130 3300 50  0001 C CNN
F 3 "~" H 3200 3300 50  0001 C CNN
	1    3200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3450 3200 3450
$Comp
L power:VCC #PWR014
U 1 1 6096A5C0
P 2600 3100
F 0 "#PWR014" H 2600 2950 50  0001 C CNN
F 1 "VCC" H 2615 3273 50  0000 C CNN
F 2 "" H 2600 3100 50  0001 C CNN
F 3 "" H 2600 3100 50  0001 C CNN
	1    2600 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 6096A5CC
P 2600 3300
F 0 "R14" H 2670 3346 50  0000 L CNN
F 1 "10kR" H 2670 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2530 3300 50  0001 C CNN
F 3 "~" H 2600 3300 50  0001 C CNN
	1    2600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3450 2700 3450
Wire Wire Line
	2600 3100 2600 3150
Wire Wire Line
	3200 3450 3450 3450
Connection ~ 3200 3450
$Comp
L power:GND #PWR018
U 1 1 6096A5D6
P 3450 3100
F 0 "#PWR018" H 3450 2850 50  0001 C CNN
F 1 "GND" H 3455 2927 50  0000 C CNN
F 2 "" H 3450 3100 50  0001 C CNN
F 3 "" H 3450 3100 50  0001 C CNN
	1    3450 3100
	-1   0    0    1   
$EndComp
Text GLabel 3550 3450 2    50   Input ~ 0
GPIO13
Wire Wire Line
	3200 3100 3200 3150
Wire Wire Line
	3450 3100 3450 3150
$Comp
L Switch:SW_Push SW6
U 1 1 6096C79A
P 2850 4450
F 0 "SW6" H 2850 4735 50  0000 C CNN
F 1 "SW_Push" H 2850 4644 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2850 4650 50  0001 C CNN
F 3 "~" H 2850 4650 50  0001 C CNN
	1    2850 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 6096C7A0
P 3150 4300
F 0 "R15" H 3220 4346 50  0000 L CNN
F 1 "100R" H 3220 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3080 4300 50  0001 C CNN
F 3 "~" H 3150 4300 50  0001 C CNN
	1    3150 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4450 3150 4450
$Comp
L power:VCC #PWR011
U 1 1 6096C7A7
P 2550 4100
F 0 "#PWR011" H 2550 3950 50  0001 C CNN
F 1 "VCC" H 2565 4273 50  0000 C CNN
F 2 "" H 2550 4100 50  0001 C CNN
F 3 "" H 2550 4100 50  0001 C CNN
	1    2550 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 6096C7B3
P 2550 4300
F 0 "R11" H 2620 4346 50  0000 L CNN
F 1 "10kR" H 2620 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2480 4300 50  0001 C CNN
F 3 "~" H 2550 4300 50  0001 C CNN
	1    2550 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4450 2650 4450
Wire Wire Line
	2550 4100 2550 4150
Wire Wire Line
	3150 4450 3350 4450
Connection ~ 3150 4450
$Comp
L power:GND #PWR015
U 1 1 6096C7BD
P 3350 4100
F 0 "#PWR015" H 3350 3850 50  0001 C CNN
F 1 "GND" H 3355 3927 50  0000 C CNN
F 2 "" H 3350 4100 50  0001 C CNN
F 3 "" H 3350 4100 50  0001 C CNN
	1    3350 4100
	-1   0    0    1   
$EndComp
Text GLabel 3500 4450 2    50   Input ~ 0
GPIO14
Wire Wire Line
	3150 4100 3150 4150
Wire Wire Line
	3350 4100 3350 4150
$Comp
L Switch:SW_Push SW7
U 1 1 6096DCDC
P 2850 5400
F 0 "SW7" H 2850 5685 50  0000 C CNN
F 1 "SW_Push" H 2850 5594 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2850 5600 50  0001 C CNN
F 3 "~" H 2850 5600 50  0001 C CNN
	1    2850 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 6096DCE2
P 3150 5250
F 0 "R16" H 3220 5296 50  0000 L CNN
F 1 "100R" H 3220 5205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3080 5250 50  0001 C CNN
F 3 "~" H 3150 5250 50  0001 C CNN
	1    3150 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5400 3150 5400
$Comp
L power:VCC #PWR012
U 1 1 6096DCE9
P 2550 5050
F 0 "#PWR012" H 2550 4900 50  0001 C CNN
F 1 "VCC" H 2565 5223 50  0000 C CNN
F 2 "" H 2550 5050 50  0001 C CNN
F 3 "" H 2550 5050 50  0001 C CNN
	1    2550 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 6096DCF5
P 2550 5250
F 0 "R12" H 2620 5296 50  0000 L CNN
F 1 "10kR" H 2620 5205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2480 5250 50  0001 C CNN
F 3 "~" H 2550 5250 50  0001 C CNN
	1    2550 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5400 2650 5400
Wire Wire Line
	2550 5050 2550 5100
Wire Wire Line
	3150 5400 3400 5400
Connection ~ 3150 5400
$Comp
L power:GND #PWR016
U 1 1 6096DCFF
P 3400 5050
F 0 "#PWR016" H 3400 4800 50  0001 C CNN
F 1 "GND" H 3405 4877 50  0000 C CNN
F 2 "" H 3400 5050 50  0001 C CNN
F 3 "" H 3400 5050 50  0001 C CNN
	1    3400 5050
	-1   0    0    1   
$EndComp
Text GLabel 3500 5400 2    50   Input ~ 0
GPIO4
Wire Wire Line
	3150 5050 3150 5100
Wire Wire Line
	3400 5050 3400 5100
$Comp
L Switch:SW_Push SW5
U 1 1 60972842
P 1350 6450
F 0 "SW5" H 1350 6735 50  0000 C CNN
F 1 "SW_Push" H 1350 6644 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 1350 6650 50  0001 C CNN
F 3 "~" H 1350 6650 50  0001 C CNN
	1    1350 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 60972848
P 1650 6300
F 0 "R10" H 1720 6346 50  0000 L CNN
F 1 "100R" H 1720 6255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1580 6300 50  0001 C CNN
F 3 "~" H 1650 6300 50  0001 C CNN
	1    1650 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6450 1650 6450
$Comp
L power:VCC #PWR05
U 1 1 6097284F
P 1050 6100
F 0 "#PWR05" H 1050 5950 50  0001 C CNN
F 1 "VCC" H 1065 6273 50  0000 C CNN
F 2 "" H 1050 6100 50  0001 C CNN
F 3 "" H 1050 6100 50  0001 C CNN
	1    1050 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 6097285B
P 1050 6300
F 0 "R5" H 1120 6346 50  0000 L CNN
F 1 "10kR" H 1120 6255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 980 6300 50  0001 C CNN
F 3 "~" H 1050 6300 50  0001 C CNN
	1    1050 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 6450 1150 6450
Wire Wire Line
	1050 6100 1050 6150
Wire Wire Line
	1650 6450 1950 6450
Connection ~ 1650 6450
$Comp
L power:GND #PWR010
U 1 1 60972865
P 1950 6100
F 0 "#PWR010" H 1950 5850 50  0001 C CNN
F 1 "GND" H 1955 5927 50  0000 C CNN
F 2 "" H 1950 6100 50  0001 C CNN
F 3 "" H 1950 6100 50  0001 C CNN
	1    1950 6100
	-1   0    0    1   
$EndComp
Text GLabel 2000 6450 2    50   Input ~ 0
GPIO15
Wire Wire Line
	1650 6100 1650 6150
Wire Wire Line
	1950 6100 1950 6150
$Comp
L Device:Rotary_Encoder_Switch SW10
U 1 1 60974EE0
P 3200 6300
F 0 "SW10" H 3200 5933 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 3200 6024 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC11E-Switch_Vertical_H20mm" H 3050 6460 50  0001 C CNN
F 3 "~" H 3200 6560 50  0001 C CNN
	1    3200 6300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR021
U 1 1 6098E145
P 3650 6300
F 0 "#PWR021" H 3650 6050 50  0001 C CNN
F 1 "GND" V 3655 6172 50  0000 R CNN
F 2 "" H 3650 6300 50  0001 C CNN
F 3 "" H 3650 6300 50  0001 C CNN
	1    3650 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 6300 3650 6300
$Comp
L Device:R R19
U 1 1 60990521
P 4000 6200
F 0 "R19" V 3793 6200 50  0000 C CNN
F 1 "10kR" V 3884 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3930 6200 50  0001 C CNN
F 3 "~" H 4000 6200 50  0001 C CNN
	1    4000 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 6200 3600 6200
$Comp
L Device:R R20
U 1 1 60991CB1
P 4000 6400
F 0 "R20" V 3793 6400 50  0000 C CNN
F 1 "10kR" V 3884 6400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3930 6400 50  0001 C CNN
F 3 "~" H 4000 6400 50  0001 C CNN
	1    4000 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 6400 3600 6400
$Comp
L power:VCC #PWR022
U 1 1 60993BD1
P 4300 6200
F 0 "#PWR022" H 4300 6050 50  0001 C CNN
F 1 "VCC" V 4315 6328 50  0000 L CNN
F 2 "" H 4300 6200 50  0001 C CNN
F 3 "" H 4300 6200 50  0001 C CNN
	1    4300 6200
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR023
U 1 1 609943EC
P 4300 6400
F 0 "#PWR023" H 4300 6250 50  0001 C CNN
F 1 "VCC" V 4315 6528 50  0000 L CNN
F 2 "" H 4300 6400 50  0001 C CNN
F 3 "" H 4300 6400 50  0001 C CNN
	1    4300 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 6400 4300 6400
Wire Wire Line
	4150 6200 4300 6200
Text GLabel 3800 6000 1    50   Input ~ 0
GPIO27
Text GLabel 3800 6550 3    50   Input ~ 0
GPIO33
Wire Wire Line
	3800 6550 3800 6400
Connection ~ 3800 6400
Wire Wire Line
	3800 6400 3850 6400
Wire Wire Line
	3800 6000 3800 6200
Connection ~ 3800 6200
Wire Wire Line
	3800 6200 3850 6200
Wire Wire Line
	4950 2350 5050 2350
NoConn ~ 5150 2550
NoConn ~ 5150 2650
NoConn ~ 5150 3550
NoConn ~ 5150 3650
NoConn ~ 5150 3750
NoConn ~ 5150 3850
NoConn ~ 5150 3950
NoConn ~ 5150 4050
$Comp
L power:GND #PWR028
U 1 1 609AFE91
P 5750 5050
F 0 "#PWR028" H 5750 4800 50  0001 C CNN
F 1 "GND" H 5755 4877 50  0000 C CNN
F 2 "" H 5750 5050 50  0001 C CNN
F 3 "" H 5750 5050 50  0001 C CNN
	1    5750 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4950 5750 5050
Wire Wire Line
	6350 3750 7100 3750
$Comp
L power:VCC #PWR027
U 1 1 609C20F2
P 5750 2000
F 0 "#PWR027" H 5750 1850 50  0001 C CNN
F 1 "VCC" H 5765 2173 50  0000 C CNN
F 2 "" H 5750 2000 50  0001 C CNN
F 3 "" H 5750 2000 50  0001 C CNN
	1    5750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2000 5750 2150
$Comp
L Device:C C2
U 1 1 609CC5D0
P 1850 3300
F 0 "C2" H 1965 3346 50  0000 L CNN
F 1 "100nF" H 1965 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1888 3150 50  0001 C CNN
F 3 "~" H 1850 3300 50  0001 C CNN
	1    1850 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 609D61F3
P 3450 3300
F 0 "C9" H 3565 3346 50  0000 L CNN
F 1 "100nF" H 3565 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3488 3150 50  0001 C CNN
F 3 "~" H 3450 3300 50  0001 C CNN
	1    3450 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 609D6D32
P 3400 5250
F 0 "C7" H 3515 5296 50  0000 L CNN
F 1 "100nF" H 3515 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3438 5100 50  0001 C CNN
F 3 "~" H 3400 5250 50  0001 C CNN
	1    3400 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 609D776B
P 3350 4300
F 0 "C6" H 3465 4346 50  0000 L CNN
F 1 "100nF" H 3465 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3388 4150 50  0001 C CNN
F 3 "~" H 3350 4300 50  0001 C CNN
	1    3350 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 609D7ED3
P 1900 4250
F 0 "C3" H 2015 4296 50  0000 L CNN
F 1 "100nF" H 2015 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1938 4100 50  0001 C CNN
F 3 "~" H 1900 4250 50  0001 C CNN
	1    1900 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 609D843F
P 1900 5200
F 0 "C4" H 2015 5246 50  0000 L CNN
F 1 "100nF" H 2015 5155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1938 5050 50  0001 C CNN
F 3 "~" H 1900 5200 50  0001 C CNN
	1    1900 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 609D8A70
P 1950 6300
F 0 "C5" H 2065 6346 50  0000 L CNN
F 1 "100nF" H 2065 6255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1988 6150 50  0001 C CNN
F 3 "~" H 1950 6300 50  0001 C CNN
	1    1950 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 609DC5FE
P 3600 6050
F 0 "C10" H 3715 6096 50  0000 L CNN
F 1 "100nF" H 3715 6005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3638 5900 50  0001 C CNN
F 3 "~" H 3600 6050 50  0001 C CNN
	1    3600 6050
	1    0    0    -1  
$EndComp
Connection ~ 3600 6200
Wire Wire Line
	3600 6200 3800 6200
$Comp
L Device:C C11
U 1 1 609DCC60
P 3600 6550
F 0 "C11" H 3715 6596 50  0000 L CNN
F 1 "100nF" H 3715 6505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3638 6400 50  0001 C CNN
F 3 "~" H 3600 6550 50  0001 C CNN
	1    3600 6550
	1    0    0    -1  
$EndComp
Connection ~ 3600 6400
Wire Wire Line
	3600 6400 3800 6400
$Comp
L power:GND #PWR020
U 1 1 609DD161
P 3600 6800
F 0 "#PWR020" H 3600 6550 50  0001 C CNN
F 1 "GND" H 3605 6627 50  0000 C CNN
F 2 "" H 3600 6800 50  0001 C CNN
F 3 "" H 3600 6800 50  0001 C CNN
	1    3600 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 6700 3600 6800
$Comp
L power:GND #PWR019
U 1 1 609DF7EF
P 3600 5800
F 0 "#PWR019" H 3600 5550 50  0001 C CNN
F 1 "GND" H 3605 5627 50  0000 C CNN
F 2 "" H 3600 5800 50  0001 C CNN
F 3 "" H 3600 5800 50  0001 C CNN
	1    3600 5800
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 5800 3600 5900
Text GLabel 4950 2350 0    50   Input ~ 0
ENABLE
Text GLabel 10500 1900 0    50   Input ~ 0
ENABLE
$Comp
L Switch:SW_Push SW11
U 1 1 609EB047
P 5400 1600
F 0 "SW11" H 5400 1885 50  0000 C CNN
F 1 "SW_Reset" H 5400 1794 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_TL3342" H 5400 1800 50  0001 C CNN
F 3 "~" H 5400 1800 50  0001 C CNN
	1    5400 1600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR025
U 1 1 609EC0CE
P 5100 1250
F 0 "#PWR025" H 5100 1100 50  0001 C CNN
F 1 "VCC" H 5115 1423 50  0000 C CNN
F 2 "" H 5100 1250 50  0001 C CNN
F 3 "" H 5100 1250 50  0001 C CNN
	1    5100 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 609EE614
P 5100 1450
F 0 "R21" H 5170 1496 50  0000 L CNN
F 1 "10kR" H 5170 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5030 1450 50  0001 C CNN
F 3 "~" H 5100 1450 50  0001 C CNN
	1    5100 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1600 5100 1600
Wire Wire Line
	5100 1600 5200 1600
Connection ~ 5100 1600
Wire Wire Line
	5100 1250 5100 1300
$Comp
L Device:C C8
U 1 1 60A003F1
P 3450 2300
F 0 "C8" H 3565 2346 50  0000 L CNN
F 1 "100nF" H 3565 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3488 2150 50  0001 C CNN
F 3 "~" H 3450 2300 50  0001 C CNN
	1    3450 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 60A0130C
P 5700 1600
F 0 "#PWR026" H 5700 1350 50  0001 C CNN
F 1 "GND" V 5705 1472 50  0000 R CNN
F 2 "" H 5700 1600 50  0001 C CNN
F 3 "" H 5700 1600 50  0001 C CNN
	1    5700 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 1600 5700 1600
$Comp
L Device:C C12
U 1 1 60A1F9AA
P 5050 2200
F 0 "C12" H 4935 2154 50  0000 R CNN
F 1 "100nF" H 4935 2245 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5088 2050 50  0001 C CNN
F 3 "~" H 5050 2200 50  0001 C CNN
	1    5050 2200
	-1   0    0    1   
$EndComp
Connection ~ 5050 2350
Wire Wire Line
	5050 2350 5150 2350
$Comp
L power:GND #PWR024
U 1 1 60A269E4
P 5050 1950
F 0 "#PWR024" H 5050 1700 50  0001 C CNN
F 1 "GND" H 5055 1777 50  0000 C CNN
F 2 "" H 5050 1950 50  0001 C CNN
F 3 "" H 5050 1950 50  0001 C CNN
	1    5050 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	5050 1950 5050 2050
Text GLabel 7000 1550 0    50   Input ~ 0
BOOTMODE
$Comp
L Switch:SW_Push SW12
U 1 1 60A2CB05
P 7400 1550
F 0 "SW12" H 7400 1835 50  0000 C CNN
F 1 "SW_BOOTMODE" H 7400 1744 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_TL3342" H 7400 1750 50  0001 C CNN
F 3 "~" H 7400 1750 50  0001 C CNN
	1    7400 1550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR031
U 1 1 60A2CB0B
P 7100 1200
F 0 "#PWR031" H 7100 1050 50  0001 C CNN
F 1 "VCC" H 7115 1373 50  0000 C CNN
F 2 "" H 7100 1200 50  0001 C CNN
F 3 "" H 7100 1200 50  0001 C CNN
	1    7100 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 60A2CB11
P 7100 1400
F 0 "R22" H 7170 1446 50  0000 L CNN
F 1 "10kR" H 7170 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7030 1400 50  0001 C CNN
F 3 "~" H 7100 1400 50  0001 C CNN
	1    7100 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1550 7100 1550
Wire Wire Line
	7100 1550 7200 1550
Connection ~ 7100 1550
Wire Wire Line
	7100 1200 7100 1250
$Comp
L power:GND #PWR034
U 1 1 60A2CB1B
P 7700 1550
F 0 "#PWR034" H 7700 1300 50  0001 C CNN
F 1 "GND" V 7705 1422 50  0000 R CNN
F 2 "" H 7700 1550 50  0001 C CNN
F 3 "" H 7700 1550 50  0001 C CNN
	1    7700 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 1550 7700 1550
Text GLabel 6450 2350 2    50   Input ~ 0
BOOTMODE
Wire Wire Line
	6350 2350 6450 2350
$Comp
L Connector:Conn_01x04_Female J1
U 1 1 60A394FA
P 7250 2550
F 0 "J1" H 7278 2526 50  0000 L CNN
F 1 "Conn_01x04_Female" H 7278 2435 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 7250 2550 50  0001 C CNN
F 3 "~" H 7250 2550 50  0001 C CNN
	1    7250 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2450 7050 2450
NoConn ~ 6350 2550
Wire Wire Line
	7050 2650 6350 2650
$Comp
L power:GND #PWR030
U 1 1 60A3F8F5
P 6950 2550
F 0 "#PWR030" H 6950 2300 50  0001 C CNN
F 1 "GND" V 6955 2422 50  0000 R CNN
F 2 "" H 6950 2550 50  0001 C CNN
F 3 "" H 6950 2550 50  0001 C CNN
	1    6950 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 2550 6950 2550
$Comp
L power:VCC #PWR029
U 1 1 60A41D69
P 6900 2750
F 0 "#PWR029" H 6900 2600 50  0001 C CNN
F 1 "VCC" V 6915 2877 50  0000 L CNN
F 2 "" H 6900 2750 50  0001 C CNN
F 3 "" H 6900 2750 50  0001 C CNN
	1    6900 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6900 2750 7050 2750
Wire Wire Line
	6350 2750 6600 2750
Wire Wire Line
	6600 2750 6600 2850
Wire Wire Line
	6600 2850 7250 2850
Wire Wire Line
	6350 2850 6550 2850
Wire Wire Line
	6550 2850 6550 2950
Wire Wire Line
	6550 2950 7250 2950
NoConn ~ 6350 2950
Wire Wire Line
	6350 3050 7250 3050
Wire Wire Line
	6350 3550 7050 3550
Wire Wire Line
	6350 3450 7050 3450
Wire Wire Line
	6350 3350 7050 3350
Wire Wire Line
	6350 3250 7050 3250
Wire Wire Line
	6350 3150 7050 3150
Text GLabel 7250 2850 2    50   Input ~ 0
GPIO4
Text GLabel 7250 2950 2    50   Input ~ 0
GPIO5
Text GLabel 7250 3050 2    50   Input ~ 0
GPIO13
Text GLabel 7050 3150 2    50   Input ~ 0
GPIO14
Text GLabel 7050 3250 2    50   Input ~ 0
GPIO15
Text GLabel 7050 3350 2    50   Input ~ 0
GPIO16
Text GLabel 7050 3450 2    50   Input ~ 0
GPIO17
Text GLabel 7050 3550 2    50   Input ~ 0
GPIO18
Text GLabel 6650 4450 2    50   Input ~ 0
GPIO33
Wire Wire Line
	6350 4450 6650 4450
Text GLabel 6650 4250 2    50   Input ~ 0
GPIO27
Text GLabel 6650 4150 2    50   Input ~ 0
GPIO26
Wire Wire Line
	6350 4250 6650 4250
Wire Wire Line
	6350 4150 6650 4150
Text Label 6500 2650 0    50   ~ 0
RX
Text Label 6900 2450 0    50   ~ 0
TX
$Comp
L Regulator_Linear:AP2112K-3.3 U3
U 1 1 60A7F5FA
P 9600 1550
F 0 "U3" H 9600 1892 50  0000 C CNN
F 1 "AP2112K-3.3" H 9600 1801 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 9600 1875 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 9600 1650 50  0001 C CNN
	1    9600 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 60A8C766
P 9600 1950
F 0 "#PWR038" H 9600 1700 50  0001 C CNN
F 1 "GND" H 9605 1777 50  0000 C CNN
F 2 "" H 9600 1950 50  0001 C CNN
F 3 "" H 9600 1950 50  0001 C CNN
	1    9600 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1850 9600 1950
$Comp
L power:VCC #PWR040
U 1 1 60A9590F
P 10050 1400
F 0 "#PWR040" H 10050 1250 50  0001 C CNN
F 1 "VCC" H 10065 1573 50  0000 C CNN
F 2 "" H 10050 1400 50  0001 C CNN
F 3 "" H 10050 1400 50  0001 C CNN
	1    10050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 1450 10000 1450
Wire Wire Line
	10050 1450 10050 1400
$Comp
L Device:C C15
U 1 1 60A98EBE
P 10000 1600
F 0 "C15" H 9885 1554 50  0000 R CNN
F 1 "1uF" H 9885 1645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10038 1450 50  0001 C CNN
F 3 "~" H 10000 1600 50  0001 C CNN
	1    10000 1600
	-1   0    0    1   
$EndComp
Connection ~ 10000 1450
Wire Wire Line
	10000 1450 10050 1450
$Comp
L power:GND #PWR039
U 1 1 60A993F6
P 10000 1950
F 0 "#PWR039" H 10000 1700 50  0001 C CNN
F 1 "GND" H 10005 1777 50  0000 C CNN
F 2 "" H 10000 1950 50  0001 C CNN
F 3 "" H 10000 1950 50  0001 C CNN
	1    10000 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 1750 10000 1950
$Comp
L Device:C C14
U 1 1 60AA70BD
P 9150 1250
F 0 "C14" H 9035 1204 50  0000 R CNN
F 1 "1uF" H 9035 1295 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9188 1100 50  0001 C CNN
F 3 "~" H 9150 1250 50  0001 C CNN
	1    9150 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 1400 9150 1450
Wire Wire Line
	9150 1450 9300 1450
$Comp
L power:GND #PWR037
U 1 1 60AAA746
P 9150 950
F 0 "#PWR037" H 9150 700 50  0001 C CNN
F 1 "GND" H 9155 777 50  0000 C CNN
F 2 "" H 9150 950 50  0001 C CNN
F 3 "" H 9150 950 50  0001 C CNN
	1    9150 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 950  9150 1100
$Comp
L Device:Battery BT1
U 1 1 60AAEF71
P 8350 1250
F 0 "BT1" H 8242 1204 50  0000 R CNN
F 1 "Battery" H 8242 1295 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" V 8350 1310 50  0001 C CNN
F 3 "~" V 8350 1310 50  0001 C CNN
	1    8350 1250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR036
U 1 1 60AB3202
P 8350 950
F 0 "#PWR036" H 8350 700 50  0001 C CNN
F 1 "GND" H 8355 777 50  0000 C CNN
F 2 "" H 8350 950 50  0001 C CNN
F 3 "" H 8350 950 50  0001 C CNN
	1    8350 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	8350 950  8350 1050
Text GLabel 6650 4350 2    50   Input ~ 0
GPIO32
Wire Wire Line
	6650 4350 6350 4350
Text GLabel 2800 6400 0    50   Input ~ 0
GPIO32
Wire Wire Line
	2800 6400 2900 6400
Text GLabel 6650 4050 2    50   Input ~ 0
GPIO25
Wire Wire Line
	6350 4050 6650 4050
Text GLabel 2800 6200 0    50   Input ~ 0
GPIO25
Wire Wire Line
	2800 6200 2900 6200
Wire Wire Line
	9100 1750 9100 1450
Wire Wire Line
	9100 1450 9150 1450
Connection ~ 9150 1450
Wire Wire Line
	9150 1450 9150 1550
Wire Wire Line
	9150 1550 9300 1550
$Comp
L Switch:SW_DIP_x01 SW13
U 1 1 60AAE3A8
P 8800 1750
F 0 "SW13" H 8800 2017 50  0000 C CNN
F 1 "SW_DIP_x01" H 8800 1926 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DIP_SPSTx01_Slide_6.7x4.1mm_W6.73mm_P2.54mm_LowProfile_JPin" H 8800 1750 50  0001 C CNN
F 3 "~" H 8800 1750 50  0001 C CNN
	1    8800 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 1750 8350 1750
Wire Wire Line
	8350 1750 8350 1450
$Comp
L Mechanical:MountingHole H2
U 1 1 60B9810D
P 9100 2750
F 0 "H2" H 9200 2796 50  0000 L CNN
F 1 "MountingHole" H 9200 2705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9100 2750 50  0001 C CNN
F 3 "~" H 9100 2750 50  0001 C CNN
	1    9100 2750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 60B98813
P 9850 2700
F 0 "H3" H 9950 2746 50  0000 L CNN
F 1 "MountingHole" H 9950 2655 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9850 2700 50  0001 C CNN
F 3 "~" H 9850 2700 50  0001 C CNN
	1    9850 2700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 60B98C1E
P 9050 3100
F 0 "H1" H 9150 3146 50  0000 L CNN
F 1 "MountingHole" H 9150 3055 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9050 3100 50  0001 C CNN
F 3 "~" H 9050 3100 50  0001 C CNN
	1    9050 3100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 60B992E2
P 9950 3150
F 0 "H4" H 10050 3196 50  0000 L CNN
F 1 "MountingHole" H 10050 3105 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9950 3150 50  0001 C CNN
F 3 "~" H 9950 3150 50  0001 C CNN
	1    9950 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3550 9650 3550
$Comp
L power:GND #PWR035
U 1 1 609C6C7B
P 9650 3550
F 0 "#PWR035" H 9650 3300 50  0001 C CNN
F 1 "GND" V 9655 3422 50  0000 R CNN
F 2 "" H 9650 3550 50  0001 C CNN
F 3 "" H 9650 3550 50  0001 C CNN
	1    9650 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9250 3550 9250 3600
Connection ~ 9250 3550
$Comp
L Device:C C13
U 1 1 609C59CA
P 9400 3550
F 0 "C13" V 9148 3550 50  0000 C CNN
F 1 "100nF" V 9239 3550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9438 3400 50  0001 C CNN
F 3 "~" H 9400 3550 50  0001 C CNN
	1    9400 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 3500 9250 3550
$Comp
L power:VCC #PWR033
U 1 1 609C3AEB
P 9250 3500
F 0 "#PWR033" H 9250 3350 50  0001 C CNN
F 1 "VCC" H 9265 3673 50  0000 C CNN
F 2 "" H 9250 3500 50  0001 C CNN
F 3 "" H 9250 3500 50  0001 C CNN
	1    9250 3500
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Humidity:HDC1080 U2
U 1 1 6096BC6A
P 9350 3900
F 0 "U2" H 9007 3946 50  0000 R CNN
F 1 "HDC1080" H 9007 3855 50  0000 R CNN
F 2 "Package_SON:Texas_PWSON-N6" H 9300 3650 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/hdc1080.pdf" H 8950 4150 50  0001 C CNN
	1    9350 3900
	1    0    0    -1  
$EndComp
Text GLabel 9800 3800 2    50   Input ~ 0
scl
Text GLabel 9800 3900 2    50   Input ~ 0
sda
Wire Wire Line
	9800 3900 9650 3900
Wire Wire Line
	9800 3800 9650 3800
$Comp
L power:GND #PWR0101
U 1 1 6098D9A0
P 9250 4250
F 0 "#PWR0101" H 9250 4000 50  0001 C CNN
F 1 "GND" H 9255 4077 50  0000 C CNN
F 2 "" H 9250 4250 50  0001 C CNN
F 3 "" H 9250 4250 50  0001 C CNN
	1    9250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4200 9250 4250
Text GLabel 7100 3750 2    50   Input ~ 0
sda
Text GLabel 7100 3850 2    50   Input ~ 0
scl
Wire Wire Line
	6350 3850 7100 3850
Connection ~ 1950 6450
Wire Wire Line
	1950 6450 2000 6450
Connection ~ 1900 5350
Wire Wire Line
	1900 5350 2000 5350
Connection ~ 3400 5400
Wire Wire Line
	3400 5400 3500 5400
Connection ~ 3350 4450
Wire Wire Line
	3350 4450 3500 4450
Connection ~ 1900 4400
Wire Wire Line
	1900 4400 2000 4400
Connection ~ 1850 3450
Wire Wire Line
	1850 3450 2000 3450
Connection ~ 3450 3450
Wire Wire Line
	3450 3450 3550 3450
Connection ~ 3450 2450
Wire Wire Line
	3450 2450 3550 2450
Connection ~ 1850 2450
Wire Wire Line
	1850 2450 2000 2450
Wire Wire Line
	1950 6100 1650 6100
Connection ~ 1950 6100
Wire Wire Line
	1650 5000 1900 5000
Connection ~ 1900 5000
Wire Wire Line
	3150 5050 3400 5050
Connection ~ 3400 5050
Wire Wire Line
	3150 4100 3350 4100
Connection ~ 3350 4100
Wire Wire Line
	1650 4050 1900 4050
Connection ~ 1900 4050
Wire Wire Line
	1650 3100 1850 3100
Connection ~ 1850 3100
Wire Wire Line
	3200 3100 3450 3100
Connection ~ 3450 3100
Wire Wire Line
	3200 2100 3450 2100
Connection ~ 3450 2100
Wire Wire Line
	1650 2100 1850 2100
Connection ~ 1850 2100
$EndSCHEMATC