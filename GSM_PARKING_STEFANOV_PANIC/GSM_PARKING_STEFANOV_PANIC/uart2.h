/*#ifndef uart5.h
#define uart5.h*/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>


void Uart2_SendChar(uint8_t send);    // funkcija za slanje jednog karaktera na UART5
uint8_t Uart2_GetChar();     // funkcija za primanje jednog karaktera sa UART-5, korisna u prekidnoj rutini, kada se ocitava karakter po karakter
void UART2_Inicijalizacija();   //inicijalno podesavanje modula UART5 i ukljucivanje Tx, Rx i prekidne rutine, podesavanje Baud rate-a na 28800
void Uart2_WriteString(const char * s);    // omogucava ispisivanje stringa na UART5
void WriteUART2_dec2string(uint16_t dec);  //konvertuj dec. broj u string i posalji uart-om





#define SIM_SCGC4_UART0_MASK   0x400u
#define SIM_SCGC4_UART1_MASK   0x800u
#define SIM_SCGC4_UART2_MASK   0x1000u
#define SIM_SCGC4_UART3_MASK   0x2000u
#define SIM_SCGC1_UART5_MASK   0x800u
#define SIM_SCGC1_UART4_MASK   0x400u
#define UART_C2_TE_MASK   0x8u
#define UART_C2_RE_MASK   0x4u
#define UART_C2_RIE_MASK   0x20u
#define UART_S1_TDRE_MASK   0x80u
#define UART_C3_TXDIR_MASK   0x20u
#define UART_RWFIFO_RXWATER_MASK   0xFFu
#define UART_RWFIFO_RXWATER_SHIFT   0
#define UART_RWFIFO_RXWATER(x)   (((uint8_t)(((uint8_t)(x))<<UART_RWFIFO_RXWATER_SHIFT))&UART_RWFIFO_RXWATER_MASK)
#define SIM_SOPT5_UARTTXSRC_MASK   0x30u
#define UART_S1_RDRF_MASK   0x20u


/*#endif*/