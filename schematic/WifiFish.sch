EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ESP8266
LIBS:maxim
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:Altera
LIBS:analog_devices
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:logo
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:motor_drivers
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:powerint
LIBS:Power_Management
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:ttl_ieee
LIBS:video
LIBS:Xicor
LIBS:Zilog
LIBS:WifiFish-cache
EELAYER 25 0
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
L ESP-12 U1
U 1 1 56F129FD
P 2200 3300
F 0 "U1" H 2200 3200 50  0000 C CNN
F 1 "ESP-12" H 2200 3400 50  0000 C CNN
F 2 "" H 2200 3300 50  0001 C CNN
F 3 "" H 2200 3300 50  0001 C CNN
	1    2200 3300
	1    0    0    -1  
$EndComp
$Comp
L DS18B20 U3
U 1 1 56F12E23
P 4850 3500
F 0 "U3" H 4700 3750 50  0000 C CNN
F 1 "DS18B20" H 4850 3250 50  0000 C CNN
F 2 "" H 4700 3750 50  0000 C CNN
F 3 "" H 4700 3750 50  0000 C CNN
	1    4850 3500
	1    0    0    -1  
$EndComp
$Comp
L LD1117S33CTR U2
U 1 1 56F12E42
P 3050 1200
F 0 "U2" H 3050 1450 50  0000 C CNN
F 1 "LD1117V33" H 3050 1400 50  0000 C CNN
F 2 "SOT-223" H 3050 1300 50  0000 C CNN
F 3 "" H 3050 1200 50  0000 C CNN
	1    3050 1200
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 56F12EDE
P 3650 1350
F 0 "C2" H 3675 1450 50  0000 L CNN
F 1 "10uF" H 3675 1250 50  0000 L CNN
F 2 "" H 3688 1200 50  0000 C CNN
F 3 "" H 3650 1350 50  0000 C CNN
	1    3650 1350
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 56F12EFB
P 2450 1350
F 0 "C1" H 2475 1450 50  0000 L CNN
F 1 "100nF" H 2475 1250 50  0000 L CNN
F 2 "" H 2488 1200 50  0000 C CNN
F 3 "" H 2450 1350 50  0000 C CNN
	1    2450 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR3
U 1 1 56F1300F
P 3050 1600
F 0 "#PWR3" H 3050 1350 50  0001 C CNN
F 1 "GND" H 3050 1450 50  0000 C CNN
F 2 "" H 3050 1600 50  0000 C CNN
F 3 "" H 3050 1600 50  0000 C CNN
	1    3050 1600
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK CON1
U 1 1 56F13189
P 1100 1200
F 0 "CON1" H 1100 1450 50  0000 C CNN
F 1 "BARREL_JACK" H 1100 1000 50  0000 C CNN
F 2 "" H 1100 1200 50  0000 C CNN
F 3 "" H 1100 1200 50  0000 C CNN
	1    1100 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 56F1322C
P 1500 1300
F 0 "#PWR1" H 1500 1050 50  0001 C CNN
F 1 "GND" H 1500 1150 50  0000 C CNN
F 2 "" H 1500 1300 50  0000 C CNN
F 3 "" H 1500 1300 50  0000 C CNN
	1    1500 1300
	1    0    0    -1  
$EndComp
Text GLabel 1600 1100 2    60   Input ~ 0
5v
Text GLabel 2200 1150 0    60   Input ~ 0
5v
Text GLabel 3900 1150 2    60   Input ~ 0
3.3v
Text Notes 950  750  0    60   ~ 0
Power Input
Text Notes 2650 750  0    60   ~ 0
Power Input -> 3.3v
Text GLabel 2250 2350 2    60   Input ~ 0
3.3v
$Comp
L GND #PWR2
U 1 1 56F13A0B
P 2200 4250
F 0 "#PWR2" H 2200 4000 50  0001 C CNN
F 1 "GND" H 2200 4100 50  0000 C CNN
F 2 "" H 2200 4250 50  0000 C CNN
F 3 "" H 2200 4250 50  0000 C CNN
	1    2200 4250
	1    0    0    -1  
$EndComp
Text GLabel 3950 3400 0    60   Input ~ 0
3.3v
$Comp
L GND #PWR6
U 1 1 56F13AE5
P 4500 3650
F 0 "#PWR6" H 4500 3400 50  0001 C CNN
F 1 "GND" H 4500 3500 50  0000 C CNN
F 2 "" H 4500 3650 50  0000 C CNN
F 3 "" H 4500 3650 50  0000 C CNN
	1    4500 3650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P1
U 1 1 56F13B9E
P 3850 2800
F 0 "P1" H 3850 3050 50  0000 C CNN
F 1 "CONN_01X04" V 3950 2800 50  0000 C CNN
F 2 "" H 3850 2800 50  0000 C CNN
F 3 "" H 3850 2800 50  0000 C CNN
	1    3850 2800
	1    0    0    -1  
$EndComp
Text GLabel 3550 2650 0    60   Input ~ 0
5v
$Comp
L GND #PWR5
U 1 1 56F13C97
P 3400 2750
F 0 "#PWR5" H 3400 2500 50  0001 C CNN
F 1 "GND" H 3400 2600 50  0000 C CNN
F 2 "" H 3400 2750 50  0000 C CNN
F 3 "" H 3400 2750 50  0000 C CNN
	1    3400 2750
	1    0    0    -1  
$EndComp
Text GLabel 1200 3200 0    47   Input ~ 0
3.3v
$Comp
L GND #PWR4
U 1 1 56F13EF0
P 3150 3650
F 0 "#PWR4" H 3150 3400 50  0001 C CNN
F 1 "GND" H 3150 3500 50  0000 C CNN
F 2 "" H 3150 3650 50  0000 C CNN
F 3 "" H 3150 3650 50  0000 C CNN
	1    3150 3650
	1    0    0    -1  
$EndComp
Text Notes 3350 2400 0    60   ~ 0
Debug Header
$Comp
L CONN_01X04 P2
U 1 1 56F1404A
P 4600 1100
F 0 "P2" H 4600 1350 50  0000 C CNN
F 1 "CONN_01X04" V 4700 1100 50  0000 C CNN
F 2 "" H 4600 1100 50  0000 C CNN
F 3 "" H 4600 1100 50  0000 C CNN
	1    4600 1100
	-1   0    0    1   
$EndComp
Text GLabel 4900 1250 2    47   Input ~ 0
RGB_R
Text GLabel 4900 1150 2    47   Input ~ 0
RGB_G
Text GLabel 4900 1050 2    47   Input ~ 0
RGB_B
Text GLabel 4900 950  2    47   Input ~ 0
BUTTON
Text Notes 4550 750  0    60   ~ 0
RGB PCB IC\n
Wire Wire Line
	2450 1500 2450 1600
Wire Wire Line
	2450 1600 3650 1600
Wire Wire Line
	3650 1600 3650 1500
Connection ~ 3050 1600
Wire Wire Line
	3050 1450 3050 1600
Wire Wire Line
	3450 1150 3900 1150
Wire Wire Line
	3650 1200 3650 1150
Connection ~ 3650 1150
Wire Wire Line
	2450 1200 2450 1150
Wire Wire Line
	2200 1150 2650 1150
Wire Wire Line
	1400 1200 1500 1200
Wire Wire Line
	1500 1200 1500 1100
Wire Wire Line
	1400 1100 1600 1100
Connection ~ 1500 1100
Wire Wire Line
	1400 1300 1500 1300
Connection ~ 2450 1150
Wire Notes Line
	650  800  1850 800 
Wire Notes Line
	1850 800  1850 1600
Wire Notes Line
	1850 1600 650  1600
Wire Notes Line
	650  1600 650  800 
Wire Notes Line
	4250 800  1950 800 
Wire Notes Line
	1950 800  1950 1850
Wire Notes Line
	1950 1850 4250 1850
Wire Notes Line
	4250 1850 4250 800 
Wire Wire Line
	2200 2400 2200 2350
Wire Wire Line
	2200 2350 2250 2350
Wire Wire Line
	2200 4200 2200 4250
Wire Wire Line
	4500 3650 4500 3600
Wire Wire Line
	4500 3600 4550 3600
Wire Wire Line
	3650 2750 3400 2750
Wire Wire Line
	3550 2650 3650 2650
Wire Wire Line
	3650 2950 3650 3100
Wire Wire Line
	3650 3100 3100 3100
Wire Wire Line
	3650 2850 3550 2850
Wire Wire Line
	3550 2850 3550 3000
Wire Wire Line
	3550 3000 3100 3000
Wire Wire Line
	1200 3200 1300 3200
Wire Wire Line
	3100 3600 3150 3600
Wire Wire Line
	3150 3600 3150 3650
Wire Notes Line
	4050 2450 4050 3150
Wire Notes Line
	4050 3150 3300 3150
Wire Notes Line
	3300 3150 3300 2450
Wire Notes Line
	3300 2450 4050 2450
Wire Wire Line
	4800 950  4900 950 
Wire Wire Line
	4900 1050 4800 1050
Wire Wire Line
	4800 1150 4900 1150
Wire Wire Line
	4900 1250 4800 1250
Wire Notes Line
	4400 800  5300 800 
Wire Notes Line
	5300 800  5300 1450
Wire Notes Line
	5300 1450 4400 1450
Wire Notes Line
	4400 1450 4400 800 
Text GLabel 3150 3400 2    47   Input ~ 0
BUTTON
Wire Wire Line
	3100 3400 3150 3400
Wire Notes Line
	3650 3200 5100 3200
Wire Notes Line
	5100 3200 5100 3900
Wire Notes Line
	5100 3900 4200 3900
Text Notes 4200 3150 0    60   ~ 0
Temp Probe
Text GLabel 1200 3600 0    47   Input ~ 0
RGB_R
Wire Wire Line
	1200 3600 1300 3600
Text GLabel 1200 3400 0    47   Input ~ 0
RGB_G
Text GLabel 1200 3500 0    47   Input ~ 0
RGB_B
Wire Wire Line
	1200 3400 1300 3400
Wire Wire Line
	1300 3500 1200 3500
Wire Notes Line
	650  2150 5300 2150
Wire Notes Line
	650  4600 5300 4600
Text Notes 2850 2100 0    47   ~ 0
ESP8266
Wire Notes Line
	650  2150 650  4600
Wire Notes Line
	5300 4600 5300 2150
$Comp
L R_Small R1
U 1 1 56F2DA14
P 4200 3400
F 0 "R1" H 4230 3420 50  0000 L CNN
F 1 "4.7k" H 4230 3360 50  0000 L CNN
F 2 "" H 4200 3400 50  0000 C CNN
F 3 "" H 4200 3400 50  0000 C CNN
	1    4200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3400 3950 3400
Wire Wire Line
	4000 3400 4000 3300
Wire Wire Line
	4000 3300 4550 3300
Wire Wire Line
	4550 3300 4550 3400
Connection ~ 4200 3300
Wire Wire Line
	3100 3500 4550 3500
Connection ~ 4200 3500
Wire Notes Line
	3650 3200 3650 3900
Wire Notes Line
	3650 3900 4250 3900
$EndSCHEMATC
