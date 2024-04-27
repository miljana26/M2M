#line 1 "C:/Users/Korisnik/Downloads/milica/GSM_MODEM/uart5.c"
#line 1 "c:/users/korisnik/downloads/milica/gsm_modem/uart5.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdio.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
long int max(long int a, long int b);
long int min(long int a, long int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 9 "c:/users/korisnik/downloads/milica/gsm_modem/uart5.h"
void Uart5_SendChar(uint8_t send);
uint8_t Uart5_GetChar();
void UART5_Inicijalizacija();
void Uart5_WriteString(const char * s);
void WriteUART5_dec2string(uint16_t dec);
#line 31 "C:/Users/Korisnik/Downloads/milica/GSM_MODEM/uart5.c"
void UART5_Inicijalizacija(){

 UART5_Init_Advanced(0, 0,0,0, &_GPIO_Module_UART5_PD9_8);
#line 39 "C:/Users/Korisnik/Downloads/milica/GSM_MODEM/uart5.c"
 SIM_SCGC1 |=  0x800u ;
 UART5_C2 &= ~ 0x8u ;
 UART5_C2 &=~  0x4u ;
 UART5_C2 &= ~ 0x20u ;
 UART5_C1 = 0;
 UART5_C5 = 0;

 UART5_BDH = 0;
 UART5_BDL = 128;
 UART5_C2 |=  0x8u ;
 UART5_C2 |=  0x4u ;
 UART5_C2 |=  0x20u ;


 }



 void Uart5_SendChar(uint8_t send)
{
 while ( (UART5_S1 &  0x80u ) == 0 );
 (void)UART5_S1;
 UART5_D = send;
}



 uint8_t Uart5_GetChar()
{
 uint8_t recieve;
 while ( ( UART5_S1 &  0x20u ) == 0 );
 (void) UART5_S1;
 recieve = UART5_D;
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
