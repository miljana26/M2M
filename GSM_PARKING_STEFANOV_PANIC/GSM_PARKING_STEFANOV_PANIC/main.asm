_pronadjiSlobodnuLed:
;main.c,32 :: 		int pronadjiSlobodnuLed() {
;main.c,34 :: 		for ( i = 0; i < PARKING_MJESTA; i++) {
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_pronadjiSlobodnuLed0:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	CS
BCS	L_pronadjiSlobodnuLed1
;main.c,36 :: 		if (!(GPIOB_PDIR & (1 << i+8))) {
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
ADDW	R1, R0, #8
SXTH	R1, R1
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(GPIOB_PDIR+0)
MOVT	R0, #hi_addr(GPIOB_PDIR+0)
LDR	R0, [R0, #0]
ANDS	R0, R1
CMP	R0, #0
IT	NE
BNE	L_pronadjiSlobodnuLed3
;main.c,37 :: 		return i;
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
IT	AL
BAL	L_end_pronadjiSlobodnuLed
;main.c,38 :: 		}
L_pronadjiSlobodnuLed3:
;main.c,34 :: 		for ( i = 0; i < PARKING_MJESTA; i++) {
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;main.c,39 :: 		}
IT	AL
BAL	L_pronadjiSlobodnuLed0
L_pronadjiSlobodnuLed1:
;main.c,41 :: 		return -1;
MOVW	R0, #65535
SXTH	R0, R0
;main.c,42 :: 		}
L_end_pronadjiSlobodnuLed:
BX	LR
; end of _pronadjiSlobodnuLed
_provjeriBrojUBazi:
;main.c,44 :: 		int provjeriBrojUBazi(const char *broj) {
; broj start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; broj end address is: 0 (R0)
; broj start address is: 0 (R0)
;main.c,45 :: 		for (i = 0; i < PARKING_MJESTA; i++) {
MOVS	R2, #0
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
STRB	R2, [R1, #0]
; broj end address is: 0 (R0)
MOV	R4, R0
L_provjeriBrojUBazi4:
; broj start address is: 16 (R4)
; broj start address is: 16 (R4)
; broj end address is: 16 (R4)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	CS
BCS	L_provjeriBrojUBazi5
; broj end address is: 16 (R4)
;main.c,46 :: 		if (strcmp(baza[i], broj) == 0) {
; broj start address is: 16 (R4)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R2, [R1, #0]
MOVS	R1, #13
MULS	R2, R1, R2
MOVW	R1, #lo_addr(_baza+0)
MOVT	R1, #hi_addr(_baza+0)
ADDS	R1, R1, R2
MOV	R0, R1
MOV	R1, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_provjeriBrojUBazi7
; broj end address is: 16 (R4)
;main.c,47 :: 		return 1; // Broj pronaden
MOVS	R0, #1
SXTH	R0, R0
IT	AL
BAL	L_end_provjeriBrojUBazi
;main.c,48 :: 		}
L_provjeriBrojUBazi7:
;main.c,45 :: 		for (i = 0; i < PARKING_MJESTA; i++) {
; broj start address is: 16 (R4)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRB	R1, [R2, #0]
ADDS	R1, R1, #1
STRB	R1, [R2, #0]
;main.c,49 :: 		}
; broj end address is: 16 (R4)
IT	AL
BAL	L_provjeriBrojUBazi4
L_provjeriBrojUBazi5:
;main.c,50 :: 		return 0; // Broj nije pronaden
MOVS	R0, #0
SXTH	R0, R0
;main.c,51 :: 		}
L_end_provjeriBrojUBazi:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _provjeriBrojUBazi
_dodajBrojUBazu:
;main.c,54 :: 		int dodajBrojUBazu(const char *broj) {
; broj start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; broj end address is: 0 (R0)
; broj start address is: 0 (R0)
;main.c,55 :: 		for (i = 0; i < PARKING_MJESTA; i++) {
MOVS	R2, #0
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
STRB	R2, [R1, #0]
; broj end address is: 0 (R0)
MOV	R4, R0
L_dodajBrojUBazu8:
; broj start address is: 16 (R4)
; broj start address is: 16 (R4)
; broj end address is: 16 (R4)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	CS
BCS	L_dodajBrojUBazu9
; broj end address is: 16 (R4)
;main.c,56 :: 		if (strcmp(baza[i], "") == 0) {
; broj start address is: 16 (R4)
MOVW	R3, #lo_addr(?lstr1_main+0)
MOVT	R3, #hi_addr(?lstr1_main+0)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R2, [R1, #0]
MOVS	R1, #13
MULS	R2, R1, R2
MOVW	R1, #lo_addr(_baza+0)
MOVT	R1, #hi_addr(_baza+0)
ADDS	R1, R1, R2
MOV	R0, R1
MOV	R1, R3
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_dodajBrojUBazu11
;main.c,57 :: 		strcpy(baza[i], broj); // Kopiraj broj u prvo slobodno mjesto u bazi
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R2, [R1, #0]
MOVS	R1, #13
MULS	R2, R1, R2
MOVW	R1, #lo_addr(_baza+0)
MOVT	R1, #hi_addr(_baza+0)
ADDS	R1, R1, R2
MOV	R0, R1
; broj end address is: 16 (R4)
MOV	R1, R4
BL	_strcpy+0
;main.c,58 :: 		return 1; // Uspješno dodan broj
MOVS	R0, #1
SXTH	R0, R0
IT	AL
BAL	L_end_dodajBrojUBazu
;main.c,63 :: 		}       }
L_dodajBrojUBazu11:
;main.c,55 :: 		for (i = 0; i < PARKING_MJESTA; i++) {
; broj start address is: 16 (R4)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRB	R1, [R2, #0]
ADDS	R1, R1, #1
STRB	R1, [R2, #0]
;main.c,63 :: 		}       }
; broj end address is: 16 (R4)
IT	AL
BAL	L_dodajBrojUBazu8
L_dodajBrojUBazu9:
;main.c,64 :: 		return 0; // Nema slobodnog mjesta u bazi
MOVS	R0, #0
SXTH	R0, R0
;main.c,65 :: 		}
L_end_dodajBrojUBazu:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _dodajBrojUBazu
_obrisiBrojIzBaze:
;main.c,66 :: 		int obrisiBrojIzBaze(const char *broj) {
; broj start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; broj end address is: 0 (R0)
; broj start address is: 0 (R0)
;main.c,67 :: 		for (i = 0; i < PARKING_MJESTA; i++) {
MOVS	R2, #0
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
STRB	R2, [R1, #0]
; broj end address is: 0 (R0)
MOV	R6, R0
L_obrisiBrojIzBaze12:
; broj start address is: 24 (R6)
; broj start address is: 24 (R6)
; broj end address is: 24 (R6)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	CS
BCS	L_obrisiBrojIzBaze13
; broj end address is: 24 (R6)
;main.c,68 :: 		if (strcmp(baza[i], broj) == 0) {
; broj start address is: 24 (R6)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R2, [R1, #0]
MOVS	R1, #13
MULS	R2, R1, R2
MOVW	R1, #lo_addr(_baza+0)
MOVT	R1, #hi_addr(_baza+0)
ADDS	R1, R1, R2
MOV	R0, R1
MOV	R1, R6
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_obrisiBrojIzBaze15
;main.c,70 :: 		strcpy(baza[i], ""); // Postavi prazan string na mjesto broja u bazi
MOVW	R3, #lo_addr(?lstr2_main+0)
MOVT	R3, #hi_addr(?lstr2_main+0)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R2, [R1, #0]
MOVS	R1, #13
MULS	R2, R1, R2
MOVW	R1, #lo_addr(_baza+0)
MOVT	R1, #hi_addr(_baza+0)
ADDS	R1, R1, R2
MOV	R0, R1
MOV	R1, R3
BL	_strcpy+0
;main.c,72 :: 		}
L_obrisiBrojIzBaze15:
;main.c,67 :: 		for (i = 0; i < PARKING_MJESTA; i++) {
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRB	R1, [R2, #0]
ADDS	R1, R1, #1
STRB	R1, [R2, #0]
;main.c,73 :: 		}return 0;
; broj end address is: 24 (R6)
IT	AL
BAL	L_obrisiBrojIzBaze12
L_obrisiBrojIzBaze13:
MOVS	R0, #0
SXTH	R0, R0
;main.c,74 :: 		}
L_end_obrisiBrojIzBaze:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _obrisiBrojIzBaze
_INT_UART2_RX:
;main.c,78 :: 		void INT_UART2_RX() iv IVT_INT_UART2_RX_TX ics ICS_AUTO
;main.c,80 :: 		while ( ( UART2_S1 & UART_S1_RDRF_MASK) == 0 );    /* Wait for received buffer to be full*/
L_INT_UART2_RX16:
MOVW	R0, #lo_addr(UART2_S1+0)
MOVT	R0, #hi_addr(UART2_S1+0)
LDRB	R0, [R0, #0]
AND	R0, R0, #32
UXTB	R0, R0
CMP	R0, #0
IT	NE
BNE	L_INT_UART2_RX17
IT	AL
BAL	L_INT_UART2_RX16
L_INT_UART2_RX17:
;main.c,83 :: 		receive = UART2_D;           /* Read received data*/
MOVW	R0, #lo_addr(UART2_D+0)
MOVT	R0, #hi_addr(UART2_D+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_receive+0)
MOVT	R0, #hi_addr(_receive+0)
STRB	R1, [R0, #0]
;main.c,85 :: 		if(receive!=0x0D)
LDRB	R0, [R0, #0]
CMP	R0, #13
IT	EQ
BEQ	L_INT_UART2_RX18
;main.c,87 :: 		rx_buffer[i]=receive;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive+0)
MOVT	R0, #hi_addr(_receive+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;main.c,88 :: 		i++;
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R2, #0]
;main.c,89 :: 		}
IT	AL
BAL	L_INT_UART2_RX19
L_INT_UART2_RX18:
;main.c,92 :: 		receive=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receive+0)
MOVT	R0, #hi_addr(_receive+0)
STRB	R1, [R0, #0]
;main.c,93 :: 		i=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
;main.c,94 :: 		stringUART=STIGAO;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
STRB	R1, [R0, #0]
;main.c,95 :: 		}
L_INT_UART2_RX19:
;main.c,96 :: 		}
L_end_INT_UART2_RX:
BX	LR
; end of _INT_UART2_RX
_main:
;main.c,100 :: 		void main()
;main.c,103 :: 		GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_3);   //Tx pin za UART5 izlazni
MOV	R1, #8
MOVW	R0, #lo_addr(PTD_PDOR+0)
MOVT	R0, #hi_addr(PTD_PDOR+0)
BL	_GPIO_Digital_Output+0
;main.c,104 :: 		GPIO_Digital_Input(&PTD_PDIR, _GPIO_PINMASK_2);  //Rx pin za UART5 ulazni
MOV	R1, #4
MOVW	R0, #lo_addr(PTD_PDIR+0)
MOVT	R0, #hi_addr(PTD_PDIR+0)
BL	_GPIO_Digital_Input+0
;main.c,106 :: 		UART2_Inicijalizacija();
BL	_UART2_Inicijalizacija+0
;main.c,107 :: 		delay_ms(100);                 // nakon inicijalizacije uart-a, mala pauza
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main20:
SUBS	R7, R7, #1
BNE	L_main20
NOP
NOP
NOP
;main.c,108 :: 		NVIC_IntEnable(IVT_INT_UART2_RX_TX);    //omoguci interrupt za UART5 Rx Tx
MOVW	R0, #51
BL	_NVIC_IntEnable+0
;main.c,110 :: 		GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_0);   //i2c1 SDA
MOV	R1, #1
MOVW	R0, #lo_addr(PTE_PDOR+0)
MOVT	R0, #hi_addr(PTE_PDOR+0)
BL	_GPIO_Digital_Output+0
;main.c,111 :: 		GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_1);   //i2c1 SCK
MOV	R1, #2
MOVW	R0, #lo_addr(PTE_PDOR+0)
MOVT	R0, #hi_addr(PTE_PDOR+0)
BL	_GPIO_Digital_Output+0
;main.c,113 :: 		I2C1_Init_Advanced(4000000, &_GPIO_Module_I2C1_PE1_0);
MOVW	R1, #lo_addr(__GPIO_Module_I2C1_PE1_0+0)
MOVT	R1, #hi_addr(__GPIO_Module_I2C1_PE1_0+0)
MOVW	R0, #2304
MOVT	R0, #61
BL	_I2C1_Init_Advanced+0
;main.c,115 :: 		Init_OLED();
BL	_Init_OLED+0
;main.c,116 :: 		delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main22:
SUBS	R7, R7, #1
BNE	L_main22
NOP
NOP
NOP
;main.c,117 :: 		oledClear();
BL	_oledClear+0
;main.c,119 :: 		GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_5);   // upravljanje reset pinom modema, kao izlaznim pinom kontrolera
MOV	R1, #32
MOVW	R0, #lo_addr(PTD_PDOR+0)
MOVT	R0, #hi_addr(PTD_PDOR+0)
BL	_GPIO_Digital_Output+0
;main.c,120 :: 		GSM_PowerON();     //ukljucivanje modema
BL	_GSM_PowerON+0
;main.c,122 :: 		GPIO_Digital_Output(&PTB_PDOR, _GPIO_PINMASK_ALL) ;
MOV	R1, #-1
MOVW	R0, #lo_addr(PTB_PDOR+0)
MOVT	R0, #hi_addr(PTB_PDOR+0)
BL	_GPIO_Digital_Output+0
;main.c,124 :: 		GPIOB_PCOR |= 0xffffffff;  //Sva parking mjesta su slobodna na pocetku
MOVW	R0, #lo_addr(GPIOB_PCOR+0)
MOVT	R0, #hi_addr(GPIOB_PCOR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1
MOVW	R0, #lo_addr(GPIOB_PCOR+0)
MOVT	R0, #hi_addr(GPIOB_PCOR+0)
STR	R1, [R0, #0]
;main.c,126 :: 		for ( i = 0; i < PARKING_MJESTA; i++) {
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_main24:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	CS
BCS	L_main25
;main.c,127 :: 		strcpy(baza[i], ""); // Inicijalno sva mjesta u bazi su prazna
MOVW	R2, #lo_addr(?lstr3_main+0)
MOVT	R2, #hi_addr(?lstr3_main+0)
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R1, [R0, #0]
MOVS	R0, #13
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_baza+0)
MOVT	R0, #hi_addr(_baza+0)
ADDS	R0, R0, R1
MOV	R1, R2
BL	_strcpy+0
;main.c,126 :: 		for ( i = 0; i < PARKING_MJESTA; i++) {
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;main.c,128 :: 		}
IT	AL
BAL	L_main24
L_main25:
;main.c,130 :: 		while (1)
L_main27:
;main.c,132 :: 		switch(stanje){
IT	AL
BAL	L_main29
;main.c,133 :: 		case 0: {
L_main31:
;main.c,134 :: 		Uart2_WriteString("AT\r");
MOVW	R0, #lo_addr(?lstr_4_main+0)
MOVT	R0, #hi_addr(?lstr_4_main+0)
BL	_Uart2_WriteString+0
;main.c,135 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_main32:
SUBS	R7, R7, #1
BNE	L_main32
NOP
NOP
NOP
;main.c,136 :: 		if(stringUART==STIGAO){
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main34
;main.c,137 :: 		oledClear();
BL	_oledClear+0
;main.c,138 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,139 :: 		if(strstr(rx_buffer, "OK")){
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_main35
;main.c,140 :: 		oledPrint("Ukljucen je");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_oledPrint+0
;main.c,141 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,142 :: 		oledPrint("modem");
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_oledPrint+0
;main.c,143 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_main36:
SUBS	R7, R7, #1
BNE	L_main36
NOP
NOP
NOP
;main.c,144 :: 		stanje = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,145 :: 		}
L_main35:
;main.c,146 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,147 :: 		stringUART=PONISTI;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
STRB	R1, [R0, #0]
;main.c,148 :: 		}
L_main34:
;main.c,150 :: 		break;
IT	AL
BAL	L_main30
;main.c,152 :: 		case 1: {
L_main38:
;main.c,153 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,154 :: 		Uart2_WriteString("AT+CREG=1\r");//Provjera da li je povezano na mrezu
MOVW	R0, #lo_addr(?lstr_8_main+0)
MOVT	R0, #hi_addr(?lstr_8_main+0)
BL	_Uart2_WriteString+0
;main.c,155 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_main39:
SUBS	R7, R7, #1
BNE	L_main39
NOP
NOP
NOP
;main.c,156 :: 		if(stringUART == STIGAO){
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main41
;main.c,157 :: 		oledClear();
BL	_oledClear+0
;main.c,158 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,159 :: 		if(strstr(rx_buffer, "OK")){
MOVW	R0, #lo_addr(?lstr9_main+0)
MOVT	R0, #hi_addr(?lstr9_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_main42
;main.c,160 :: 		oledPrint("Prijavljen na");
MOVW	R0, #lo_addr(?lstr10_main+0)
MOVT	R0, #hi_addr(?lstr10_main+0)
BL	_oledPrint+0
;main.c,161 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,162 :: 		oledPrint("mrezu");
MOVW	R0, #lo_addr(?lstr11_main+0)
MOVT	R0, #hi_addr(?lstr11_main+0)
BL	_oledPrint+0
;main.c,163 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main43:
SUBS	R7, R7, #1
BNE	L_main43
NOP
NOP
NOP
;main.c,164 :: 		stanje = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,165 :: 		}
L_main42:
;main.c,166 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,167 :: 		stringUART=PONISTI;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
STRB	R1, [R0, #0]
;main.c,168 :: 		}
L_main41:
;main.c,170 :: 		break;
IT	AL
BAL	L_main30
;main.c,172 :: 		case 2:
L_main45:
;main.c,174 :: 		oledClear();
BL	_oledClear+0
;main.c,175 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,177 :: 		Uart2_WriteString("AT+CMGF=1\r");  //Text mod
MOVW	R0, #lo_addr(?lstr_12_main+0)
MOVT	R0, #hi_addr(?lstr_12_main+0)
BL	_Uart2_WriteString+0
;main.c,178 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main46:
SUBS	R7, R7, #1
BNE	L_main46
NOP
NOP
NOP
;main.c,179 :: 		Uart2_WriteString("AT+CMGD=0\r");  //Brise poruke
MOVW	R0, #lo_addr(?lstr_13_main+0)
MOVT	R0, #hi_addr(?lstr_13_main+0)
BL	_Uart2_WriteString+0
;main.c,180 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main48:
SUBS	R7, R7, #1
BNE	L_main48
NOP
NOP
NOP
;main.c,181 :: 		Uart2_WriteString("AT+CMGD=1\r");
MOVW	R0, #lo_addr(?lstr_14_main+0)
MOVT	R0, #hi_addr(?lstr_14_main+0)
BL	_Uart2_WriteString+0
;main.c,182 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main50:
SUBS	R7, R7, #1
BNE	L_main50
NOP
NOP
NOP
;main.c,183 :: 		Uart2_WriteString("AT+CMGD=2\r");
MOVW	R0, #lo_addr(?lstr_15_main+0)
MOVT	R0, #hi_addr(?lstr_15_main+0)
BL	_Uart2_WriteString+0
;main.c,184 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main52:
SUBS	R7, R7, #1
BNE	L_main52
NOP
NOP
NOP
;main.c,185 :: 		Uart2_WriteString("AT+CMGD=3\r");
MOVW	R0, #lo_addr(?lstr_16_main+0)
MOVT	R0, #hi_addr(?lstr_16_main+0)
BL	_Uart2_WriteString+0
;main.c,186 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main54:
SUBS	R7, R7, #1
BNE	L_main54
NOP
NOP
NOP
;main.c,187 :: 		Uart2_WriteString("AT+CMGD=4\r");
MOVW	R0, #lo_addr(?lstr_17_main+0)
MOVT	R0, #hi_addr(?lstr_17_main+0)
BL	_Uart2_WriteString+0
;main.c,188 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main56:
SUBS	R7, R7, #1
BNE	L_main56
NOP
NOP
NOP
;main.c,190 :: 		if (strstr(rx_buffer, "OK")){
MOVW	R0, #lo_addr(?lstr18_main+0)
MOVT	R0, #hi_addr(?lstr18_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_main58
;main.c,191 :: 		oledClear();
BL	_oledClear+0
;main.c,192 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,194 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,195 :: 		stanje=3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,196 :: 		}
L_main58:
;main.c,197 :: 		break;
IT	AL
BAL	L_main30
;main.c,200 :: 		case 3:
L_main59:
;main.c,201 :: 		Uart2_WriteString("ATE0\r");   //Iskljucujemo eho
MOVW	R0, #lo_addr(?lstr_19_main+0)
MOVT	R0, #hi_addr(?lstr_19_main+0)
BL	_Uart2_WriteString+0
;main.c,202 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main60:
SUBS	R7, R7, #1
BNE	L_main60
NOP
NOP
NOP
;main.c,203 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,204 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main62:
SUBS	R7, R7, #1
BNE	L_main62
NOP
NOP
NOP
;main.c,205 :: 		oledClear();
BL	_oledClear+0
;main.c,206 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,207 :: 		oledPrint("Cekam poruku");
MOVW	R0, #lo_addr(?lstr20_main+0)
MOVT	R0, #hi_addr(?lstr20_main+0)
BL	_oledPrint+0
;main.c,208 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_main64:
SUBS	R7, R7, #1
BNE	L_main64
NOP
NOP
NOP
;main.c,210 :: 		while (!(strstr(rx_buffer, "+PARKING") || strstr(rx_buffer, "-PARKING"))){
L_main66:
MOVW	R0, #lo_addr(?lstr21_main+0)
MOVT	R0, #hi_addr(?lstr21_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	NE
BNE	L_main69
MOVW	R0, #lo_addr(?lstr22_main+0)
MOVT	R0, #hi_addr(?lstr22_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	NE
BNE	L_main69
MOVS	R0, #0
IT	AL
BAL	L_main68
L_main69:
MOVS	R0, #1
L_main68:
CMP	R0, #0
IT	NE
BNE	L_main67
;main.c,211 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,212 :: 		Uart2_WriteString("AT+CNMI=1,2,0,0,0\r");
MOVW	R0, #lo_addr(?lstr_23_main+0)
MOVT	R0, #hi_addr(?lstr_23_main+0)
BL	_Uart2_WriteString+0
;main.c,213 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_main70:
SUBS	R7, R7, #1
BNE	L_main70
NOP
NOP
NOP
;main.c,214 :: 		oledClear();
BL	_oledClear+0
;main.c,215 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,216 :: 		oledPrint("Cekam poruku");
MOVW	R0, #lo_addr(?lstr24_main+0)
MOVT	R0, #hi_addr(?lstr24_main+0)
BL	_oledPrint+0
;main.c,217 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,218 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_main72:
SUBS	R7, R7, #1
BNE	L_main72
NOP
NOP
NOP
;main.c,219 :: 		}
IT	AL
BAL	L_main66
L_main67:
;main.c,221 :: 		oledClear();
BL	_oledClear+0
;main.c,222 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,226 :: 		if((strstr(rx_buffer,"+PARKING"))){
MOVW	R0, #lo_addr(?lstr25_main+0)
MOVT	R0, #hi_addr(?lstr25_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_main74
;main.c,228 :: 		br=strstr(rx_buffer, "381");  //Trazi broj telefona
MOVW	R0, #lo_addr(?lstr26_main+0)
MOVT	R0, #hi_addr(?lstr26_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
MOVW	R1, #lo_addr(_br+0)
MOVT	R1, #hi_addr(_br+0)
STR	R0, [R1, #0]
;main.c,229 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_main75:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #12
IT	CS
BCS	L_main76
;main.c,230 :: 		phoneNumber[i]=*br; //Broj sa kojeg je poslata poruka smjesta u PhoneNumber.
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRB	R1, [R3, #0]
MOVW	R0, #lo_addr(_phoneNumber+0)
MOVT	R0, #hi_addr(_phoneNumber+0)
ADDS	R2, R0, R1
MOVW	R1, #lo_addr(_br+0)
MOVT	R1, #hi_addr(_br+0)
LDR	R0, [R1, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
;main.c,231 :: 		br++;
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;main.c,229 :: 		for(i=0; i<12; i++){
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R3, #0]
;main.c,232 :: 		}
IT	AL
BAL	L_main75
L_main76:
;main.c,233 :: 		if (provjeriBrojUBazi(phoneNumber)) {
MOVW	R0, #lo_addr(_phoneNumber+0)
MOVT	R0, #hi_addr(_phoneNumber+0)
BL	_provjeriBrojUBazi+0
CMP	R0, #0
IT	EQ
BEQ	L_main78
;main.c,234 :: 		oledClear();
BL	_oledClear+0
;main.c,235 :: 		oledGotoYX(0,0) ;
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,236 :: 		oledPrint("Broj u bazi.");
MOVW	R0, #lo_addr(?lstr27_main+0)
MOVT	R0, #hi_addr(?lstr27_main+0)
BL	_oledPrint+0
;main.c,237 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main79:
SUBS	R7, R7, #1
BNE	L_main79
NOP
NOP
NOP
;main.c,238 :: 		stanje = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,239 :: 		break;
IT	AL
BAL	L_main30
;main.c,240 :: 		}
L_main78:
;main.c,242 :: 		oledClear();
BL	_oledClear+0
;main.c,243 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,244 :: 		oledPrint("Broj nije u");
MOVW	R0, #lo_addr(?lstr28_main+0)
MOVT	R0, #hi_addr(?lstr28_main+0)
BL	_oledPrint+0
;main.c,245 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,246 :: 		oledPrint("bazi");
MOVW	R0, #lo_addr(?lstr29_main+0)
MOVT	R0, #hi_addr(?lstr29_main+0)
BL	_oledPrint+0
;main.c,247 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main82:
SUBS	R7, R7, #1
BNE	L_main82
NOP
NOP
NOP
;main.c,248 :: 		if(dodajBrojUBazu(phoneNumber)) {
MOVW	R0, #lo_addr(_phoneNumber+0)
MOVT	R0, #hi_addr(_phoneNumber+0)
BL	_dodajBrojUBazu+0
CMP	R0, #0
IT	EQ
BEQ	L_main84
;main.c,249 :: 		}
IT	AL
BAL	L_main85
L_main84:
;main.c,251 :: 		oledClear();
BL	_oledClear+0
;main.c,252 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,253 :: 		oledPrint("Nema prostora");
MOVW	R0, #lo_addr(?lstr30_main+0)
MOVT	R0, #hi_addr(?lstr30_main+0)
BL	_oledPrint+0
;main.c,254 :: 		oledGotoYX(1,0) ;
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,255 :: 		oledPrint("u bazi.");
MOVW	R0, #lo_addr(?lstr31_main+0)
MOVT	R0, #hi_addr(?lstr31_main+0)
BL	_oledPrint+0
;main.c,256 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main86:
SUBS	R7, R7, #1
BNE	L_main86
NOP
NOP
NOP
;main.c,257 :: 		stanje = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,258 :: 		break;
IT	AL
BAL	L_main30
;main.c,259 :: 		}
L_main85:
;main.c,262 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,263 :: 		oledClear();
BL	_oledClear+0
;main.c,264 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,265 :: 		oledPrint("Broj ");
MOVW	R0, #lo_addr(?lstr32_main+0)
MOVT	R0, #hi_addr(?lstr32_main+0)
BL	_oledPrint+0
;main.c,266 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,267 :: 		oledPrint(phoneNumber);
MOVW	R0, #lo_addr(_phoneNumber+0)
MOVT	R0, #hi_addr(_phoneNumber+0)
BL	_oledPrint+0
;main.c,268 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main88:
SUBS	R7, R7, #1
BNE	L_main88
NOP
NOP
NOP
;main.c,269 :: 		stanje=4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,270 :: 		oledClear();
BL	_oledClear+0
;main.c,271 :: 		break;
IT	AL
BAL	L_main30
;main.c,272 :: 		}
L_main74:
;main.c,273 :: 		else if((strstr(rx_buffer,"-PARKING"))){
MOVW	R0, #lo_addr(?lstr33_main+0)
MOVT	R0, #hi_addr(?lstr33_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_main91
;main.c,278 :: 		s=strstr(rx_buffer, "381");  //Trazi broj telefona
MOVW	R0, #lo_addr(?lstr34_main+0)
MOVT	R0, #hi_addr(?lstr34_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
STR	R0, [R1, #0]
;main.c,279 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_main92:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #12
IT	CS
BCS	L_main93
;main.c,280 :: 		broj[i]=*s;
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRB	R1, [R3, #0]
MOVW	R0, #lo_addr(_broj+0)
MOVT	R0, #hi_addr(_broj+0)
ADDS	R2, R0, R1
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
LDR	R0, [R1, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
;main.c,281 :: 		s++;
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;main.c,279 :: 		for(i=0; i<12; i++){
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R3, #0]
;main.c,282 :: 		}
IT	AL
BAL	L_main92
L_main93:
;main.c,283 :: 		if (provjeriBrojUBazi(broj)) {
MOVW	R0, #lo_addr(_broj+0)
MOVT	R0, #hi_addr(_broj+0)
BL	_provjeriBrojUBazi+0
CMP	R0, #0
IT	EQ
BEQ	L_main95
;main.c,288 :: 		GPIOB_PCOR |= (1<<i+8);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
ADDW	R1, R0, #8
SXTH	R1, R1
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(GPIOB_PCOR+0)
MOVT	R0, #hi_addr(GPIOB_PCOR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOB_PCOR+0)
MOVT	R0, #hi_addr(GPIOB_PCOR+0)
STR	R1, [R0, #0]
;main.c,289 :: 		obrisiBrojIzBaze(broj);
MOVW	R0, #lo_addr(_broj+0)
MOVT	R0, #hi_addr(_broj+0)
BL	_obrisiBrojIzBaze+0
;main.c,290 :: 		oledClear();
BL	_oledClear+0
;main.c,291 :: 		oledGotoYX(0,0)  ;
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,292 :: 		oledPrint("Broj obrisan");
MOVW	R0, #lo_addr(?lstr35_main+0)
MOVT	R0, #hi_addr(?lstr35_main+0)
BL	_oledPrint+0
;main.c,293 :: 		oledGotoYX(1,0)  ;
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,294 :: 		oledPrint("iz baze");
MOVW	R0, #lo_addr(?lstr36_main+0)
MOVT	R0, #hi_addr(?lstr36_main+0)
BL	_oledPrint+0
;main.c,296 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main96:
SUBS	R7, R7, #1
BNE	L_main96
NOP
NOP
NOP
;main.c,297 :: 		stanje = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,298 :: 		break;
IT	AL
BAL	L_main30
;main.c,299 :: 		}
L_main95:
;main.c,304 :: 		stanje = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,306 :: 		}
L_main91:
;main.c,310 :: 		case 4:
L_main99:
;main.c,311 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,312 :: 		while(!(br=strstr(rx_buffer, "381")))
L_main100:
MOVW	R0, #lo_addr(?lstr37_main+0)
MOVT	R0, #hi_addr(?lstr37_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
MOVW	R1, #lo_addr(_br+0)
MOVT	R1, #hi_addr(_br+0)
STR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main101
;main.c,314 :: 		oledClear();
BL	_oledClear+0
;main.c,315 :: 		oledGotoYX(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,316 :: 		oledPrint("Pozovite");
MOVW	R0, #lo_addr(?lstr38_main+0)
MOVT	R0, #hi_addr(?lstr38_main+0)
BL	_oledPrint+0
;main.c,317 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main102:
SUBS	R7, R7, #1
BNE	L_main102
NOP
NOP
NOP
;main.c,318 :: 		}
IT	AL
BAL	L_main100
L_main101:
;main.c,320 :: 		if(stringUART == STIGAO)
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main104
;main.c,322 :: 		oledClear();
BL	_oledClear+0
;main.c,323 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,324 :: 		oledPrint("Zvanje u toku");
MOVW	R0, #lo_addr(?lstr39_main+0)
MOVT	R0, #hi_addr(?lstr39_main+0)
BL	_oledPrint+0
;main.c,325 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main105:
SUBS	R7, R7, #1
BNE	L_main105
NOP
NOP
NOP
;main.c,328 :: 		for(x=0; x<12; x++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
STRH	R1, [R0, #0]
L_main107:
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRSH	R0, [R0, #0]
CMP	R0, #12
IT	GE
BGE	L_main108
;main.c,330 :: 		if((*br) != ('\r'))
MOVW	R0, #lo_addr(_br+0)
MOVT	R0, #hi_addr(_br+0)
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
CMP	R0, #13
IT	EQ
BEQ	L_main110
;main.c,331 :: 		mob[x]=*br;
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_mob+0)
MOVT	R0, #hi_addr(_mob+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_br+0)
MOVT	R0, #hi_addr(_br+0)
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
IT	AL
BAL	L_main111
L_main110:
;main.c,332 :: 		else mob[x]=0;
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_mob+0)
MOVT	R0, #hi_addr(_mob+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
L_main111:
;main.c,333 :: 		br++;
MOVW	R1, #lo_addr(_br+0)
MOVT	R1, #hi_addr(_br+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;main.c,328 :: 		for(x=0; x<12; x++)
MOVW	R1, #lo_addr(_x+0)
MOVT	R1, #hi_addr(_x+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;main.c,334 :: 		}
IT	AL
BAL	L_main107
L_main108:
;main.c,338 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_main112:
SUBS	R7, R7, #1
BNE	L_main112
NOP
NOP
NOP
;main.c,339 :: 		for ( i = 0; i < PARKING_MJESTA; i++) {
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_main114:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	CS
BCS	L_main115
;main.c,340 :: 		if(!strcmp(mob, baza[i]))//provera da li se broj koji poziva nalazi u bazi
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R1, [R0, #0]
MOVS	R0, #13
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_baza+0)
MOVT	R0, #hi_addr(_baza+0)
ADDS	R0, R0, R1
MOV	R1, R0
MOVW	R0, #lo_addr(_mob+0)
MOVT	R0, #hi_addr(_mob+0)
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_main117
;main.c,342 :: 		oledClear();
BL	_oledClear+0
;main.c,343 :: 		oledGotoYX(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,344 :: 		oledPrint("Parkiranje");
MOVW	R0, #lo_addr(?lstr40_main+0)
MOVT	R0, #hi_addr(?lstr40_main+0)
BL	_oledPrint+0
;main.c,345 :: 		Delay_ms(4000);
MOVW	R7, #26622
MOVT	R7, #2441
NOP
NOP
L_main118:
SUBS	R7, R7, #1
BNE	L_main118
NOP
NOP
NOP
;main.c,346 :: 		index = i ;
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_index+0)
MOVT	R0, #hi_addr(_index+0)
STRH	R1, [R0, #0]
;main.c,347 :: 		stanje = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,348 :: 		break;
IT	AL
BAL	L_main115
;main.c,349 :: 		}
L_main117:
;main.c,339 :: 		for ( i = 0; i < PARKING_MJESTA; i++) {
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;main.c,350 :: 		}
IT	AL
BAL	L_main114
L_main115:
;main.c,351 :: 		if (index != -1) {
MOVW	R0, #lo_addr(_index+0)
MOVT	R0, #hi_addr(_index+0)
LDRSH	R0, [R0, #0]
CMP	R0, #-1
IT	EQ
BEQ	L_main120
;main.c,353 :: 		int slobodnaLedDioda = pronadjiSlobodnuLed();
BL	_pronadjiSlobodnuLed+0
;main.c,354 :: 		if (slobodnaLedDioda != -1) {
CMP	R0, #-1
IT	EQ
BEQ	L_main121
;main.c,356 :: 		GPIOB_PSOR |= (1 << i+8);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
ADDW	R1, R0, #8
SXTH	R1, R1
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(GPIOB_PSOR+0)
MOVT	R0, #hi_addr(GPIOB_PSOR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOB_PSOR+0)
MOVT	R0, #hi_addr(GPIOB_PSOR+0)
STR	R1, [R0, #0]
;main.c,358 :: 		oledClear();
BL	_oledClear+0
;main.c,359 :: 		oledGotoYX(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,360 :: 		oledPrint("Parkirano");
MOVW	R0, #lo_addr(?lstr41_main+0)
MOVT	R0, #hi_addr(?lstr41_main+0)
BL	_oledPrint+0
;main.c,361 :: 		Delay_ms(4000);
MOVW	R7, #26622
MOVT	R7, #2441
NOP
NOP
L_main122:
SUBS	R7, R7, #1
BNE	L_main122
NOP
NOP
NOP
;main.c,363 :: 		stanje = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,364 :: 		}
IT	AL
BAL	L_main124
L_main121:
;main.c,366 :: 		oledClear();
BL	_oledClear+0
;main.c,367 :: 		oledGotoYX(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,368 :: 		oledPrint("Nema slobodnih");
MOVW	R0, #lo_addr(?lstr42_main+0)
MOVT	R0, #hi_addr(?lstr42_main+0)
BL	_oledPrint+0
;main.c,369 :: 		oledGotoYX(1, 0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,370 :: 		oledPrint("mjesta");
MOVW	R0, #lo_addr(?lstr43_main+0)
MOVT	R0, #hi_addr(?lstr43_main+0)
BL	_oledPrint+0
;main.c,371 :: 		stanje = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;main.c,372 :: 		}
L_main124:
;main.c,373 :: 		}
L_main120:
;main.c,374 :: 		}memset(phoneNumber, 0, sizeof(phoneNumber));
L_main104:
MOVS	R2, #13
SXTH	R2, R2
MOVS	R1, #0
MOVW	R0, #lo_addr(_phoneNumber+0)
MOVT	R0, #hi_addr(_phoneNumber+0)
BL	_memset+0
;main.c,375 :: 		break;
IT	AL
BAL	L_main30
;main.c,377 :: 		}
L_main29:
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main31
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_main38
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_main45
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_main59
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_main99
L_main30:
;main.c,378 :: 		}
IT	AL
BAL	L_main27
;main.c,379 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_clear_rx_buffer:
;main.c,381 :: 		void clear_rx_buffer(){
;main.c,382 :: 		for(a=0;a<29;a++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_a+0)
MOVT	R0, #hi_addr(_a+0)
STRB	R1, [R0, #0]
L_clear_rx_buffer127:
MOVW	R0, #lo_addr(_a+0)
MOVT	R0, #hi_addr(_a+0)
LDRB	R0, [R0, #0]
CMP	R0, #29
IT	CS
BCS	L_clear_rx_buffer128
;main.c,383 :: 		rx_buffer[a]='\0';
MOVW	R2, #lo_addr(_a+0)
MOVT	R2, #hi_addr(_a+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;main.c,382 :: 		for(a=0;a<29;a++){
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R2, #0]
;main.c,384 :: 		}
IT	AL
BAL	L_clear_rx_buffer127
L_clear_rx_buffer128:
;main.c,385 :: 		}
L_end_clear_rx_buffer:
BX	LR
; end of _clear_rx_buffer
_GSM_PowerON:
;main.c,387 :: 		void GSM_PowerON()
;main.c,389 :: 		GPIOD_PSOR |= (1 << 5);
MOVW	R0, #lo_addr(GPIOD_PSOR+0)
MOVT	R0, #hi_addr(GPIOD_PSOR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOD_PSOR+0)
MOVT	R0, #hi_addr(GPIOD_PSOR+0)
STR	R1, [R0, #0]
;main.c,391 :: 		Delay_ms(200);
MOVW	R7, #4606
MOVT	R7, #122
NOP
NOP
L_GSM_PowerON130:
SUBS	R7, R7, #1
BNE	L_GSM_PowerON130
NOP
NOP
NOP
;main.c,393 :: 		GPIOD_PCOR |= (1 << 5);
MOVW	R0, #lo_addr(GPIOD_PCOR+0)
MOVT	R0, #hi_addr(GPIOD_PCOR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOD_PCOR+0)
MOVT	R0, #hi_addr(GPIOD_PCOR+0)
STR	R1, [R0, #0]
;main.c,395 :: 		Delay_ms(800);
MOVW	R7, #18430
MOVT	R7, #488
NOP
NOP
L_GSM_PowerON132:
SUBS	R7, R7, #1
BNE	L_GSM_PowerON132
NOP
NOP
NOP
;main.c,397 :: 		GPIOD_PSOR |= (1 << 5);
MOVW	R0, #lo_addr(GPIOD_PSOR+0)
MOVT	R0, #hi_addr(GPIOD_PSOR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOD_PSOR+0)
MOVT	R0, #hi_addr(GPIOD_PSOR+0)
STR	R1, [R0, #0]
;main.c,398 :: 		Delay_ms(200);
MOVW	R7, #4606
MOVT	R7, #122
NOP
NOP
L_GSM_PowerON134:
SUBS	R7, R7, #1
BNE	L_GSM_PowerON134
NOP
NOP
NOP
;main.c,399 :: 		}
L_end_GSM_PowerON:
BX	LR
; end of _GSM_PowerON
