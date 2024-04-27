_UART2_Inicijalizacija:
;uart2.c,11 :: 		void UART2_Inicijalizacija(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart2.c,15 :: 		UART2_Init(9600);
MOVW	R0, #9600
BL	_UART2_Init+0
;uart2.c,28 :: 		UART2_C2 |= UART_C2_TE_MASK;           /* ukljuci Transmitter*/
MOVW	R0, #lo_addr(UART2_C2+0)
MOVT	R0, #hi_addr(UART2_C2+0)
LDRB	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(UART2_C2+0)
MOVT	R0, #hi_addr(UART2_C2+0)
STRB	R1, [R0, #0]
;uart2.c,29 :: 		UART2_C2 |= UART_C2_RE_MASK;           /* ukljuci Receiver*/
MOVW	R0, #lo_addr(UART2_C2+0)
MOVT	R0, #hi_addr(UART2_C2+0)
LDRB	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(UART2_C2+0)
MOVT	R0, #hi_addr(UART2_C2+0)
STRB	R1, [R0, #0]
;uart2.c,30 :: 		UART2_C2 |= UART_C2_RIE_MASK;           /* ukljuci Receiver interrupts*/
MOVW	R0, #lo_addr(UART2_C2+0)
MOVT	R0, #hi_addr(UART2_C2+0)
LDRB	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(UART2_C2+0)
MOVT	R0, #hi_addr(UART2_C2+0)
STRB	R1, [R0, #0]
;uart2.c,33 :: 		}
L_end_UART2_Inicijalizacija:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART2_Inicijalizacija
_Uart2_SendChar:
;uart2.c,37 :: 		void Uart2_SendChar(uint8_t send)
; send start address is: 0 (R0)
; send end address is: 0 (R0)
; send start address is: 0 (R0)
; send end address is: 0 (R0)
;uart2.c,39 :: 		while ( (UART2_S1 & UART_S1_TDRE_MASK) == 0 );   /* Wait for transmit buffer to be empty*/
L_Uart2_SendChar0:
; send start address is: 0 (R0)
MOVW	R1, #lo_addr(UART2_S1+0)
MOVT	R1, #hi_addr(UART2_S1+0)
LDRB	R1, [R1, #0]
AND	R1, R1, #128
UXTB	R1, R1
CMP	R1, #0
IT	NE
BNE	L_Uart2_SendChar1
IT	AL
BAL	L_Uart2_SendChar0
L_Uart2_SendChar1:
;uart2.c,41 :: 		UART2_D = send;      /* Send data*/
MOVW	R1, #lo_addr(UART2_D+0)
MOVT	R1, #hi_addr(UART2_D+0)
STRB	R0, [R1, #0]
; send end address is: 0 (R0)
;uart2.c,42 :: 		}
L_end_Uart2_SendChar:
BX	LR
; end of _Uart2_SendChar
_Uart2_GetChar:
;uart2.c,46 :: 		uint8_t Uart2_GetChar()
;uart2.c,49 :: 		while ( ( UART2_S1 & UART_S1_RDRF_MASK) == 0 );     /* Wait for received buffer to be full*/
L_Uart2_GetChar2:
MOVW	R0, #lo_addr(UART2_S1+0)
MOVT	R0, #hi_addr(UART2_S1+0)
LDRB	R0, [R0, #0]
AND	R0, R0, #32
UXTB	R0, R0
CMP	R0, #0
IT	NE
BNE	L_Uart2_GetChar3
IT	AL
BAL	L_Uart2_GetChar2
L_Uart2_GetChar3:
;uart2.c,51 :: 		recieve = UART2_D;           /* Read received data*/
MOVW	R0, #lo_addr(UART2_D+0)
MOVT	R0, #hi_addr(UART2_D+0)
; recieve start address is: 0 (R0)
LDRB	R0, [R0, #0]
;uart2.c,52 :: 		return recieve;
; recieve end address is: 0 (R0)
;uart2.c,53 :: 		}
L_end_Uart2_GetChar:
BX	LR
; end of _Uart2_GetChar
_Uart2_WriteString:
;uart2.c,57 :: 		void Uart2_WriteString(const char * s)
; s start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; s end address is: 0 (R0)
; s start address is: 0 (R0)
MOV	R2, R0
; s end address is: 0 (R0)
;uart2.c,60 :: 		while(*s)
L_Uart2_WriteString4:
; s start address is: 8 (R2)
LDRB	R1, [R2, #0]
CMP	R1, #0
IT	EQ
BEQ	L_Uart2_WriteString5
;uart2.c,61 :: 		Uart2_SendChar(*s++);
LDRB	R1, [R2, #0]
UXTB	R0, R1
BL	_Uart2_SendChar+0
ADDS	R2, R2, #1
; s end address is: 8 (R2)
IT	AL
BAL	L_Uart2_WriteString4
L_Uart2_WriteString5:
;uart2.c,62 :: 		}
L_end_Uart2_WriteString:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Uart2_WriteString
_WriteUART2_dec2string:
;uart2.c,65 :: 		void WriteUART2_dec2string(uint16_t dec)
; dec start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTH	R3, R0
; dec end address is: 0 (R0)
; dec start address is: 12 (R3)
;uart2.c,69 :: 		temp=dec/10000;
MOVW	R1, #10000
UDIV	R1, R3, R1
; temp start address is: 0 (R0)
UXTB	R0, R1
;uart2.c,70 :: 		if(temp>0)
UXTB	R1, R1
CMP	R1, #0
IT	LS
BLS	L_WriteUART2_dec2string6
;uart2.c,71 :: 		Uart2_SendChar(temp+'0');
ADDW	R1, R0, #48
STRB	R0, [SP, #4]
UXTB	R0, R1
BL	_Uart2_SendChar+0
LDRB	R0, [SP, #4]
L_WriteUART2_dec2string6:
;uart2.c,72 :: 		dec=dec-temp*10000;
MOVW	R1, #10000
SXTH	R1, R1
MULS	R1, R0, R1
SXTH	R1, R1
; temp end address is: 0 (R0)
SUB	R2, R3, R1
UXTH	R2, R2
UXTH	R3, R2
;uart2.c,73 :: 		temp=dec/1000;
MOVW	R1, #1000
UDIV	R1, R2, R1
; temp start address is: 0 (R0)
UXTB	R0, R1
;uart2.c,74 :: 		if(temp>0)
UXTB	R1, R1
CMP	R1, #0
IT	LS
BLS	L_WriteUART2_dec2string7
;uart2.c,75 :: 		Uart2_SendChar(temp+'0');
ADDW	R1, R0, #48
STRB	R0, [SP, #4]
UXTB	R0, R1
BL	_Uart2_SendChar+0
LDRB	R0, [SP, #4]
L_WriteUART2_dec2string7:
;uart2.c,76 :: 		dec=dec-temp*1000;
MOVW	R1, #1000
SXTH	R1, R1
MULS	R1, R0, R1
SXTH	R1, R1
; temp end address is: 0 (R0)
SUB	R2, R3, R1
UXTH	R2, R2
UXTH	R3, R2
;uart2.c,77 :: 		temp=dec/100;
MOVS	R1, #100
UDIV	R1, R2, R1
; temp start address is: 0 (R0)
UXTB	R0, R1
;uart2.c,78 :: 		if(temp>0)
UXTB	R1, R1
CMP	R1, #0
IT	LS
BLS	L_WriteUART2_dec2string8
;uart2.c,79 :: 		Uart2_SendChar(temp+'0');
ADDW	R1, R0, #48
STRB	R0, [SP, #4]
UXTB	R0, R1
BL	_Uart2_SendChar+0
LDRB	R0, [SP, #4]
L_WriteUART2_dec2string8:
;uart2.c,80 :: 		dec=dec-temp*100;
MOVS	R1, #100
SXTH	R1, R1
MULS	R1, R0, R1
SXTH	R1, R1
; temp end address is: 0 (R0)
SUB	R2, R3, R1
UXTH	R2, R2
UXTH	R3, R2
;uart2.c,81 :: 		temp=dec/10;
MOVS	R1, #10
UDIV	R1, R2, R1
; temp start address is: 8 (R2)
UXTB	R2, R1
;uart2.c,82 :: 		if(temp>0)
UXTB	R1, R1
CMP	R1, #0
IT	LS
BLS	L_WriteUART2_dec2string9
;uart2.c,83 :: 		Uart2_SendChar(temp+'0');
ADDW	R1, R2, #48
UXTB	R0, R1
BL	_Uart2_SendChar+0
L_WriteUART2_dec2string9:
;uart2.c,84 :: 		dec=dec-temp*10;
MOVS	R1, #10
SXTH	R1, R1
MULS	R1, R2, R1
SXTH	R1, R1
; temp end address is: 8 (R2)
SUB	R1, R3, R1
UXTH	R1, R1
; dec end address is: 12 (R3)
;uart2.c,85 :: 		Uart2_SendChar(dec+'0');
ADDS	R1, #48
UXTB	R0, R1
BL	_Uart2_SendChar+0
;uart2.c,86 :: 		Uart2_SendChar('\r');
MOVS	R0, #13
BL	_Uart2_SendChar+0
;uart2.c,87 :: 		}
L_end_WriteUART2_dec2string:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _WriteUART2_dec2string
