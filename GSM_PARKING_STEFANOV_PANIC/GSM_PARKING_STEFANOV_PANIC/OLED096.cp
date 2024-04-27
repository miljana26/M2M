#line 1 "D:/GoogleDrive/KEL/nastava/M2M/projekti Fusion for ARM v8/protokoli/I2C OLED096/OLED096.c"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 1 "d:/googledrive/kel/nastava/m2m/projekti fusion for arm v8/protokoli/i2c oled096/uart5.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdio.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdlib.h"
#line 9 "d:/googledrive/kel/nastava/m2m/projekti fusion for arm v8/protokoli/i2c oled096/uart5.h"
void Uart5_SendChar(uint8_t send);
uint8_t Uart5_GetChar();
void UART5_Inicijalizacija();
void Uart5_WriteString(const char * s);
void WriteUART5_dec2string(uint16_t dec);
#line 37 "D:/GoogleDrive/KEL/nastava/M2M/projekti Fusion for ARM v8/protokoli/I2C OLED096/OLED096.c"
uint8_t stringUART=0, i=0,a=0;
uint8_t rx_buffer[30];
uint8_t recieve;






 void INT_UART5_RX() iv IVT_INT_UART5_RX_TX ics ICS_AUTO
{

 while ( ( UART5_S1 &  0x20u ) == 0 );

 (void) UART5_S1;
 recieve = UART5_D;




 if(recieve!=0x0D)
 {
 rx_buffer[i]=recieve;
 i++;
 }
 else
 {
 recieve=0;
 i=0;

 stringUART= 1 ;

 }



}







void main()
 {

 GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_9);
 GPIO_Digital_Input(&PTD_PDIR, _GPIO_PINMASK_8);

 UART5_Inicijalizacija();
 delay_ms(100);
 NVIC_IntEnable(IVT_INT_UART5_RX_TX);


 while (1)
 {

 if(stringUART== 1 ){
 Uart5_WriteString(rx_buffer);
 for(a=0;a<29;a++){
 rx_buffer[a]='\0';
 }

 stringUART= 0 ;

 }




 Delay_ms(100);




 }
 }
