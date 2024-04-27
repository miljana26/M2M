




#include "uart2.h"




void UART2_Inicijalizacija(){

      //  UART2_Init_Advanced(0, 0,0,0, &_GPIO_Module_UART2_PD3_2);//prelazak na alternativne pinove: c4 i c3

           UART2_Init(9600);
        /*PORTD_PCR9 = PORT_PCR_MUX(0x3); //TX
        PORTD_PCR = PORT_PCR_MUX(0x3); //RX*/

       // SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;   // omoguci odgovarajuci UART clock gate.
       // UART2_C2 &= ~UART_C2_TE_MASK;           /* trenutno iskljuci Transmitter*/
       // UART2_C2 &=~ UART_C2_RE_MASK;           /* trenutno iskljuci Receiver*/
       // UART2_C2 &= ~UART_C2_RIE_MASK;           /* trenutno iskljuci Receiver interrupts*/
       // UART2_C1 = 0;                               /* No parity enable,8 bit format*/
       // UART2_C5 = 0;                          //konfigurisem za interrupt, ne koristim DMA
        //set baud rate: H i L registri
      //  UART2_BDH = 0;                               /* One stop bit*/
        //UART2_BDL = 0x30d;                          /* Baud rate na 28800, klok oscilatora je 120MHz*/
        UART2_C2 |= UART_C2_TE_MASK;           /* ukljuci Transmitter*/
        UART2_C2 |= UART_C2_RE_MASK;           /* ukljuci Receiver*/
        UART2_C2 |= UART_C2_RIE_MASK;           /* ukljuci Receiver interrupts*/


  }
  


   void Uart2_SendChar(uint8_t send)
{
     while ( (UART2_S1 & UART_S1_TDRE_MASK) == 0 );   /* Wait for transmit buffer to be empty*/
     (void)UART2_S1;      /* Read UART2_S1 register*/
     UART2_D = send;      /* Send data*/
}



 uint8_t Uart2_GetChar()
{
     uint8_t recieve;
     while ( ( UART2_S1 & UART_S1_RDRF_MASK) == 0 );     /* Wait for received buffer to be full*/
     (void) UART2_S1;           /* Read UART2_S1 register*/
     recieve = UART2_D;           /* Read received data*/
     return recieve;
}



void Uart2_WriteString(const char * s)

{
    while(*s)
    Uart2_SendChar(*s++);
}


void WriteUART2_dec2string(uint16_t dec)
{

        unsigned char temp;
        temp=dec/10000;
        if(temp>0)
        Uart2_SendChar(temp+'0');
        dec=dec-temp*10000;
        temp=dec/1000;
        if(temp>0)
        Uart2_SendChar(temp+'0');
        dec=dec-temp*1000;
        temp=dec/100;
        if(temp>0)
        Uart2_SendChar(temp+'0');
        dec=dec-temp*100;
        temp=dec/10;
        if(temp>0)
        Uart2_SendChar(temp+'0');
        dec=dec-temp*10;
        Uart2_SendChar(dec+'0');
        Uart2_SendChar('\r');
}