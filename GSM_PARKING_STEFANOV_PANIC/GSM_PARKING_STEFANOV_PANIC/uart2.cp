#line 1 "C:/Users/Korisnik/Downloads/milica/GSM_MODEM/uart2.c"
#line 1 "c:/users/korisnik/downloads/milica/gsm_modem/uart2.h"
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
#line 9 "c:/users/korisnik/downloads/milica/gsm_modem/uart2.h"
void Uart2_SendChar(uint8_t send);
uint8_t Uart2_GetChar();
void UART2_Inicijalizacija();
void Uart2_WriteString(const char * s);
void WriteUART2_dec2string(uint16_t dec);
#line 11 "C:/Users/Korisnik/Downloads/milica/GSM_MODEM/uart2.c"
void UART2_Inicijalizacija(){



 UART2_Init(9600);
#line 28 "C:/Users/Korisnik/Downloads/milica/GSM_MODEM/uart2.c"
 UART2_C2 |=  0x8u ;
 UART2_C2 |=  0x4u ;
 UART2_C2 |=  0x20u ;


 }



 void Uart2_SendChar(uint8_t send)
{
 while ( (UART2_S1 &  0x80u ) == 0 );
 (void)UART2_S1;
 UART2_D = send;
}



 uint8_t Uart2_GetChar()
{
 uint8_t recieve;
 while ( ( UART2_S1 &  0x20u ) == 0 );
 (void) UART2_S1;
 recieve = UART2_D;
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
