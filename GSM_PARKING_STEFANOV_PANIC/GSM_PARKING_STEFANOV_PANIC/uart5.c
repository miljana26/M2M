/*
 * drajver za: UART5 integrisani modul
               mikrokontroler: Kinetis MK64FN1M0VDC12
               ARM Cortex M4

 * Opis:
     Koriscenje UART5 modula sa omogucenom prekidnom Rx rutinom, podesavanje registara - LOW LEVEL, bez HAL-a,

 * Test configuration:
     Oscillator:      PLL, 120.000MHz
     Ext. Modules:    None
     SW:              mikroC PRO for ARM

 * Autor koda:
     Branislav Batinic
     
 * Napomene:
     - Ukljuciti USB UART Tx i Rx prekidace (board specific) na Fusion ARM V8 ploci
     - koristimo Terminal v1.9b za spregu sa racunarom
 */





#include "uart5.h"




void UART5_Inicijalizacija(){

        UART5_Init_Advanced(0, 0,0,0, &_GPIO_Module_UART5_PD9_8);//prelazak na alternativne pinove: D9 i D8


        /*PORTD_PCR9 = PORT_PCR_MUX(0x3); //TX
        PORTD_PCR = PORT_PCR_MUX(0x3); //RX*/

        SIM_SCGC1 |= SIM_SCGC1_UART5_MASK;   // omoguci odgovarajuci UART clock gate.
        UART5_C2 &= ~UART_C2_TE_MASK;           /* trenutno iskljuci Transmitter*/
        UART5_C2 &=~ UART_C2_RE_MASK;           /* trenutno iskljuci Receiver*/
        UART5_C2 &= ~UART_C2_RIE_MASK;           /* trenutno iskljuci Receiver interrupts*/
        UART5_C1 = 0;                               /* No parity enable,8 bit format*/
        UART5_C5 = 0;                          //konfigurisem za interrupt, ne koristim DMA
        //set baud rate: H i L registri
        UART5_BDH = 0;                               /* One stop bit*/
        UART5_BDL = 128;                          /* Baud rate na 28800, klok oscilatora je 120MHz*/
        UART5_C2 |= UART_C2_TE_MASK;           /* ukljuci Transmitter*/
        UART5_C2 |= UART_C2_RE_MASK;           /* ukljuci Receiver*/
        UART5_C2 |= UART_C2_RIE_MASK;           /* ukljuci Receiver interrupts*/


  }
  


   void Uart5_SendChar(uint8_t send)
{
     while ( (UART5_S1 & UART_S1_TDRE_MASK) == 0 );   /* Wait for transmit buffer to be empty*/
     (void)UART5_S1;      /* Read UART2_S1 register*/
     UART5_D = send;      /* Send data*/
}



 uint8_t Uart5_GetChar()
{
     uint8_t recieve;
     while ( ( UART5_S1 & UART_S1_RDRF_MASK) == 0 );     /* Wait for received buffer to be full*/
     (void) UART5_S1;           /* Read UART2_S1 register*/
     recieve = UART5_D;           /* Read received data*/
     return recieve;
}



void Uart5_WriteString(const char * s)

{
    while(*s)
    Uart5_SendChar(*s++);
}


void WriteUART5_dec2string(uint16_t dec)
{

	unsigned char temp;
	temp=dec/10000;
	if(temp>0)
	Uart5_SendChar(temp+'0');
	dec=dec-temp*10000;
	temp=dec/1000;
	if(temp>0)
	Uart5_SendChar(temp+'0');
	dec=dec-temp*1000;
	temp=dec/100;
	if(temp>0)
	Uart5_SendChar(temp+'0');
	dec=dec-temp*100;
	temp=dec/10;
	if(temp>0)
	Uart5_SendChar(temp+'0');
	dec=dec-temp*10;
	Uart5_SendChar(dec+'0');
        Uart5_SendChar('\r');
}

  
  
  
  