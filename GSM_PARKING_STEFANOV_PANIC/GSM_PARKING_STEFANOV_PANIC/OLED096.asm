_INT_UART5_RX:
;OLED096.c,46 :: 		void INT_UART5_RX() iv IVT_INT_UART5_RX_TX ics ICS_AUTO
;OLED096.c,49 :: 		while ( ( UART5_S1 & UART_S1_RDRF_MASK) == 0 );    /* Wait for received buffer to be full*/
L_INT_UART5_RX0:
MOVW	R0, #lo_addr(UART5_S1+0)
MOVT	R0, #hi_addr(UART5_S1+0)
LDRB	R0, [R0, #0]
AND	R0, R0, #32
UXTB	R0, R0
CMP	R0, #0
IT	NE
BNE	L_INT_UART5_RX1
IT	AL
BAL	L_INT_UART5_RX0
L_INT_UART5_RX1:
;OLED096.c,52 :: 		recieve = UART5_D;           /* Read received data*/
MOVW	R0, #lo_addr(UART5_D+0)
MOVT	R0, #hi_addr(UART5_D+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_recieve+0)
MOVT	R0, #hi_addr(_recieve+0)
STRB	R1, [R0, #0]
;OLED096.c,57 :: 		if(recieve!=0x0D)
LDRB	R0, [R0, #0]
CMP	R0, #13
IT	EQ
BEQ	L_INT_UART5_RX2
;OLED096.c,59 :: 		rx_buffer[i]=recieve;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_recieve+0)
MOVT	R0, #hi_addr(_recieve+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;OLED096.c,60 :: 		i++;
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R2, #0]
;OLED096.c,61 :: 		}
IT	AL
BAL	L_INT_UART5_RX3
L_INT_UART5_RX2:
;OLED096.c,64 :: 		recieve=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_recieve+0)
MOVT	R0, #hi_addr(_recieve+0)
STRB	R1, [R0, #0]
;OLED096.c,65 :: 		i=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
;OLED096.c,67 :: 		stringUART=STIGAO;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
STRB	R1, [R0, #0]
;OLED096.c,69 :: 		}
L_INT_UART5_RX3:
;OLED096.c,73 :: 		}
L_end_INT_UART5_RX:
BX	LR
; end of _INT_UART5_RX
_main:
;OLED096.c,81 :: 		void main()
;OLED096.c,84 :: 		GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_9);   //Tx pin za UART5 izlazni
MOV	R1, #512
MOVW	R0, #lo_addr(PTD_PDOR+0)
MOVT	R0, #hi_addr(PTD_PDOR+0)
BL	_GPIO_Digital_Output+0
;OLED096.c,85 :: 		GPIO_Digital_Input(&PTD_PDIR, _GPIO_PINMASK_8);  //Rx pin za UART5 ulazni
MOV	R1, #256
MOVW	R0, #lo_addr(PTD_PDIR+0)
MOVT	R0, #hi_addr(PTD_PDIR+0)
BL	_GPIO_Digital_Input+0
;OLED096.c,87 :: 		UART5_Inicijalizacija();
BL	_UART5_Inicijalizacija+0
;OLED096.c,88 :: 		delay_ms(100);                 // nakon inicijalizacije uart-a, mala pauza
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;OLED096.c,89 :: 		NVIC_IntEnable(IVT_INT_UART5_RX_TX);    //omoguci interrupt za UART5 Rx Tx
MOVW	R0, #84
BL	_NVIC_IntEnable+0
;OLED096.c,92 :: 		while (1)                      // Endless loop
L_main6:
;OLED096.c,95 :: 		if(stringUART==STIGAO){
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main8
;OLED096.c,96 :: 		Uart5_WriteString(rx_buffer);
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_Uart5_WriteString+0
;OLED096.c,97 :: 		for(a=0;a<29;a++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_a+0)
MOVT	R0, #hi_addr(_a+0)
STRB	R1, [R0, #0]
L_main9:
MOVW	R0, #lo_addr(_a+0)
MOVT	R0, #hi_addr(_a+0)
LDRB	R0, [R0, #0]
CMP	R0, #29
IT	CS
BCS	L_main10
;OLED096.c,98 :: 		rx_buffer[a]='\0';
MOVW	R2, #lo_addr(_a+0)
MOVT	R2, #hi_addr(_a+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;OLED096.c,97 :: 		for(a=0;a<29;a++){
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R2, #0]
;OLED096.c,99 :: 		}
IT	AL
BAL	L_main9
L_main10:
;OLED096.c,101 :: 		stringUART=PONISTI;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
STRB	R1, [R0, #0]
;OLED096.c,103 :: 		}
L_main8:
;OLED096.c,108 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main12:
SUBS	R7, R7, #1
BNE	L_main12
NOP
NOP
NOP
;OLED096.c,113 :: 		}
IT	AL
BAL	L_main6
;OLED096.c,114 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
