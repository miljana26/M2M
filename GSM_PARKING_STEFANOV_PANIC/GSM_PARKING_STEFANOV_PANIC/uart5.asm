_UART5_Inicijalizacija:
;uart5.c,31 :: 		void UART5_Inicijalizacija(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart5.c,33 :: 		UART5_Init_Advanced(0, 0,0,0, &_GPIO_Module_UART5_PD9_8);//prelazak na alternativne pinove: D9 i D8
MOVW	R0, #lo_addr(__GPIO_Module_UART5_PD9_8+0)
MOVT	R0, #hi_addr(__GPIO_Module_UART5_PD9_8+0)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_UART5_Init_Advanced+0
ADD	SP, SP, #4
;uart5.c,39 :: 		SIM_SCGC1 |= SIM_SCGC1_UART5_MASK;   // omoguci odgovarajuci UART clock gate.
MOVW	R0, #lo_addr(SIM_SCGC1+0)
MOVT	R0, #hi_addr(SIM_SCGC1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(SIM_SCGC1+0)
MOVT	R0, #hi_addr(SIM_SCGC1+0)
STR	R1, [R0, #0]
;uart5.c,40 :: 		UART5_C2 &= ~UART_C2_TE_MASK;           /* trenutno iskljuci Transmitter*/
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
LDRB	R0, [R0, #0]
AND	R1, R0, #247
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
STRB	R1, [R0, #0]
;uart5.c,41 :: 		UART5_C2 &=~ UART_C2_RE_MASK;           /* trenutno iskljuci Receiver*/
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
LDRB	R0, [R0, #0]
AND	R1, R0, #251
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
STRB	R1, [R0, #0]
;uart5.c,42 :: 		UART5_C2 &= ~UART_C2_RIE_MASK;           /* trenutno iskljuci Receiver interrupts*/
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
LDRB	R0, [R0, #0]
AND	R1, R0, #223
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
STRB	R1, [R0, #0]
;uart5.c,43 :: 		UART5_C1 = 0;                               /* No parity enable,8 bit format*/
MOVS	R1, #0
MOVW	R0, #lo_addr(UART5_C1+0)
MOVT	R0, #hi_addr(UART5_C1+0)
STRB	R1, [R0, #0]
;uart5.c,44 :: 		UART5_C5 = 0;                          //konfigurisem za interrupt, ne koristim DMA
MOVS	R1, #0
MOVW	R0, #lo_addr(UART5_C5+0)
MOVT	R0, #hi_addr(UART5_C5+0)
STRB	R1, [R0, #0]
;uart5.c,46 :: 		UART5_BDH = 0;                               /* One stop bit*/
MOVS	R1, #0
MOVW	R0, #lo_addr(UART5_BDH+0)
MOVT	R0, #hi_addr(UART5_BDH+0)
STRB	R1, [R0, #0]
;uart5.c,47 :: 		UART5_BDL = 128;                          /* Baud rate na 28800, klok oscilatora je 120MHz*/
MOVS	R1, #128
MOVW	R0, #lo_addr(UART5_BDL+0)
MOVT	R0, #hi_addr(UART5_BDL+0)
STRB	R1, [R0, #0]
;uart5.c,48 :: 		UART5_C2 |= UART_C2_TE_MASK;           /* ukljuci Transmitter*/
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
LDRB	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
STRB	R1, [R0, #0]
;uart5.c,49 :: 		UART5_C2 |= UART_C2_RE_MASK;           /* ukljuci Receiver*/
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
LDRB	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
STRB	R1, [R0, #0]
;uart5.c,50 :: 		UART5_C2 |= UART_C2_RIE_MASK;           /* ukljuci Receiver interrupts*/
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
LDRB	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(UART5_C2+0)
MOVT	R0, #hi_addr(UART5_C2+0)
STRB	R1, [R0, #0]
;uart5.c,53 :: 		}
L_end_UART5_Inicijalizacija:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART5_Inicijalizacija
_Uart5_SendChar:
;uart5.c,57 :: 		void Uart5_SendChar(uint8_t send)
; send start address is: 0 (R0)
; send end address is: 0 (R0)
; send start address is: 0 (R0)
; send end address is: 0 (R0)
;uart5.c,59 :: 		while ( (UART5_S1 & UART_S1_TDRE_MASK) == 0 );   /* Wait for transmit buffer to be empty*/
L_Uart5_SendChar0:
; send start address is: 0 (R0)
MOVW	R1, #lo_addr(UART5_S1+0)
MOVT	R1, #hi_addr(UART5_S1+0)
LDRB	R1, [R1, #0]
AND	R1, R1, #128
UXTB	R1, R1
CMP	R1, #0
IT	NE
BNE	L_Uart5_SendChar1
IT	AL
BAL	L_Uart5_SendChar0
L_Uart5_SendChar1:
;uart5.c,61 :: 		UART5_D = send;      /* Send data*/
MOVW	R1, #lo_addr(UART5_D+0)
MOVT	R1, #hi_addr(UART5_D+0)
STRB	R0, [R1, #0]
; send end address is: 0 (R0)
;uart5.c,62 :: 		}
L_end_Uart5_SendChar:
BX	LR
; end of _Uart5_SendChar
_Uart5_GetChar:
;uart5.c,66 :: 		uint8_t Uart5_GetChar()
;uart5.c,69 :: 		while ( ( UART5_S1 & UART_S1_RDRF_MASK) == 0 );     /* Wait for received buffer to be full*/
L_Uart5_GetChar2:
MOVW	R0, #lo_addr(UART5_S1+0)
MOVT	R0, #hi_addr(UART5_S1+0)
LDRB	R0, [R0, #0]
AND	R0, R0, #32
UXTB	R0, R0
CMP	R0, #0
IT	NE
BNE	L_Uart5_GetChar3
IT	AL
BAL	L_Uart5_GetChar2
L_Uart5_GetChar3:
;uart5.c,71 :: 		recieve = UART5_D;           /* Read received data*/
MOVW	R0, #lo_addr(UART5_D+0)
MOVT	R0, #hi_addr(UART5_D+0)
; recieve start address is: 0 (R0)
LDRB	R0, [R0, #0]
;uart5.c,72 :: 		return recieve;
; recieve end address is: 0 (R0)
;uart5.c,73 :: 		}
L_end_Uart5_GetChar:
BX	LR
; end of _Uart5_GetChar
_Uart5_WriteString:
;uart5.c,77 :: 		void Uart5_WriteString(const char * s)
; s start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; s end address is: 0 (R0)
; s start address is: 0 (R0)
MOV	R2, R0
; s end address is: 0 (R0)
;uart5.c,80 :: 		while(*s)
L_Uart5_WriteString4:
; s start address is: 8 (R2)
LDRB	R1, [R2, #0]
CMP	R1, #0
IT	EQ
BEQ	L_Uart5_WriteString5
;uart5.c,81 :: 		Uart5_SendChar(*s++);
LDRB	R1, [R2, #0]
UXTB	R0, R1
BL	_Uart5_SendChar+0
ADDS	R2, R2, #1
; s end address is: 8 (R2)
IT	AL
BAL	L_Uart5_WriteString4
L_Uart5_WriteString5:
;uart5.c,82 :: 		}
L_end_Uart5_WriteString:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Uart5_WriteString
_WriteUART5_dec2string:
;uart5.c,85 :: 		void WriteUART5_dec2string(uint16_t dec)
; dec start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTH	R3, R0
; dec end address is: 0 (R0)
; dec start address is: 12 (R3)
;uart5.c,89 :: 		temp=dec/10000;
MOVW	R1, #10000
UDIV	R1, R3, R1
; temp start address is: 0 (R0)
UXTB	R0, R1
;uart5.c,90 :: 		if(temp>0)
UXTB	R1, R1
CMP	R1, #0
IT	LS
BLS	L_WriteUART5_dec2string6
;uart5.c,91 :: 		Uart5_SendChar(temp+'0');
ADDW	R1, R0, #48
STRB	R0, [SP, #4]
UXTB	R0, R1
BL	_Uart5_SendChar+0
LDRB	R0, [SP, #4]
L_WriteUART5_dec2string6:
;uart5.c,92 :: 		dec=dec-temp*10000;
MOVW	R1, #10000
SXTH	R1, R1
MULS	R1, R0, R1
SXTH	R1, R1
; temp end address is: 0 (R0)
SUB	R2, R3, R1
UXTH	R2, R2
UXTH	R3, R2
;uart5.c,93 :: 		temp=dec/1000;
MOVW	R1, #1000
UDIV	R1, R2, R1
; temp start address is: 0 (R0)
UXTB	R0, R1
;uart5.c,94 :: 		if(temp>0)
UXTB	R1, R1
CMP	R1, #0
IT	LS
BLS	L_WriteUART5_dec2string7
;uart5.c,95 :: 		Uart5_SendChar(temp+'0');
ADDW	R1, R0, #48
STRB	R0, [SP, #4]
UXTB	R0, R1
BL	_Uart5_SendChar+0
LDRB	R0, [SP, #4]
L_WriteUART5_dec2string7:
;uart5.c,96 :: 		dec=dec-temp*1000;
MOVW	R1, #1000
SXTH	R1, R1
MULS	R1, R0, R1
SXTH	R1, R1
; temp end address is: 0 (R0)
SUB	R2, R3, R1
UXTH	R2, R2
UXTH	R3, R2
;uart5.c,97 :: 		temp=dec/100;
MOVS	R1, #100
UDIV	R1, R2, R1
; temp start address is: 0 (R0)
UXTB	R0, R1
;uart5.c,98 :: 		if(temp>0)
UXTB	R1, R1
CMP	R1, #0
IT	LS
BLS	L_WriteUART5_dec2string8
;uart5.c,99 :: 		Uart5_SendChar(temp+'0');
ADDW	R1, R0, #48
STRB	R0, [SP, #4]
UXTB	R0, R1
BL	_Uart5_SendChar+0
LDRB	R0, [SP, #4]
L_WriteUART5_dec2string8:
;uart5.c,100 :: 		dec=dec-temp*100;
MOVS	R1, #100
SXTH	R1, R1
MULS	R1, R0, R1
SXTH	R1, R1
; temp end address is: 0 (R0)
SUB	R2, R3, R1
UXTH	R2, R2
UXTH	R3, R2
;uart5.c,101 :: 		temp=dec/10;
MOVS	R1, #10
UDIV	R1, R2, R1
; temp start address is: 8 (R2)
UXTB	R2, R1
;uart5.c,102 :: 		if(temp>0)
UXTB	R1, R1
CMP	R1, #0
IT	LS
BLS	L_WriteUART5_dec2string9
;uart5.c,103 :: 		Uart5_SendChar(temp+'0');
ADDW	R1, R2, #48
UXTB	R0, R1
BL	_Uart5_SendChar+0
L_WriteUART5_dec2string9:
;uart5.c,104 :: 		dec=dec-temp*10;
MOVS	R1, #10
SXTH	R1, R1
MULS	R1, R2, R1
SXTH	R1, R1
; temp end address is: 8 (R2)
SUB	R1, R3, R1
UXTH	R1, R1
; dec end address is: 12 (R3)
;uart5.c,105 :: 		Uart5_SendChar(dec+'0');
ADDS	R1, #48
UXTB	R0, R1
BL	_Uart5_SendChar+0
;uart5.c,106 :: 		Uart5_SendChar('\r');
MOVS	R0, #13
BL	_Uart5_SendChar+0
;uart5.c,107 :: 		}
L_end_WriteUART5_dec2string:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _WriteUART5_dec2string
