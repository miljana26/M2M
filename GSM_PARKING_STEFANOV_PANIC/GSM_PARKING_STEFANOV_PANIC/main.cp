#line 1 "C:/Users/Korisnik/Downloads/milica/GSM_MODEM/main.c"
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
#line 1 "c:/users/korisnik/downloads/milica/gsm_modem/uart2.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdio.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdlib.h"
#line 9 "c:/users/korisnik/downloads/milica/gsm_modem/uart2.h"
void Uart2_SendChar(uint8_t send);
uint8_t Uart2_GetChar();
void UART2_Inicijalizacija();
void Uart2_WriteString(const char * s);
void WriteUART2_dec2string(uint16_t dec);
#line 1 "c:/users/korisnik/downloads/milica/gsm_modem/oled_096.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 315 "c:/users/korisnik/downloads/milica/gsm_modem/oled_096.h"
static unsigned int buffer[128 * 64 / 8] = {
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,

0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,

0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,
0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,
0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,
0x80,0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x80,0x80,0x80,
0x80,0x80,0x80,0x80,0x80,0x00,0x80,0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,
0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x00,0x80,0x00,0x00,0x00,0x00,

0x00,0x00,0x02,0x03,0xFF,0xFF,0xFF,0x01,0xFE,0x02,0x02,0x02,0x02,0x82,0x85,0xC3,
0xFF,0x7E,0x3D,0xC2,0x3C,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0xA0,0xC0,0xF0,0xBC,
0x77,0x0F,0x3F,0xFF,0xFE,0xED,0xF0,0x80,0xC0,0x40,0x80,0x00,0x00,0x00,0x00,0x0B,
0x07,0x19,0x04,0x02,0x02,0x02,0xFF,0xFF,0xFF,0xFC,0x02,0x02,0x02,0x03,0x0F,0x13,
0x0C,0x03,0x01,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x01,0x01,0x00,0x00,0x00,0x00,0xFF,
0x07,0xFF,0x3F,0xFE,0xFB,0xED,0xB0,0xC0,0x00,0x00,0x01,0xFF,0xFD,0x02,0x01,0x00,
0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x01,0x01,0x00,0x00,0xC0,0xF0,0xFC,0xFE,0x1F,
0xE3,0x1D,0x06,0x02,0x02,0x02,0x05,0x03,0x1F,0x17,0x0D,0x02,0x01,0x00,0x00,0x00,

0x00,0x02,0x05,0x05,0xFF,0xFF,0xFF,0x01,0xFD,0x05,0x05,0x05,0x05,0x07,0x0B,0x16,
0xFE,0xFF,0xFD,0xFC,0xF0,0x00,0x00,0x00,0x00,0x00,0x81,0xE1,0x3F,0xE7,0x1E,0x1D,
0xB6,0x78,0xB8,0x5D,0x2F,0x7F,0xFF,0xFD,0xED,0x75,0x85,0x06,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,
0x00,0xFF,0x00,0x00,0x03,0x0F,0x3F,0xFE,0xFB,0xEC,0x90,0xFF,0xFF,0x00,0x00,0x00,
0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x3F,0xFF,0xFF,0xFF,0x80,
0x3F,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0xF0,0xE0,0x00,0x00,0x00,0x00,

0x00,0x00,0x18,0x18,0x1F,0x1F,0x1F,0x18,0x1F,0x18,0x18,0x18,0x18,0x18,0x1C,0x1E,
0x1F,0x0F,0x0F,0x07,0x01,0x00,0x10,0x18,0x1C,0x1E,0x1F,0x1F,0x1C,0x1F,0x18,0x10,
0x00,0x01,0x00,0x00,0x10,0x08,0x1D,0x1F,0x1F,0x1F,0x1D,0x1A,0x14,0x18,0x10,0x00,
0x00,0x00,0x00,0x00,0x08,0x1C,0x1F,0x1F,0x1F,0x19,0x16,0x18,0x10,0x00,0x00,0x00,
0x00,0x00,0x10,0x18,0x1C,0x1F,0x1F,0x1F,0x1B,0x14,0x18,0x10,0x10,0x18,0x1C,0x1F,
0x1E,0x1B,0x1C,0x18,0x10,0x00,0x00,0x00,0x03,0x1F,0x1F,0x1F,0x1F,0x00,0x00,0x00,
0x10,0x18,0x1C,0x1F,0x1F,0x1F,0x1B,0x14,0x18,0x10,0x00,0x00,0x01,0x03,0x07,0x0F,
0x0E,0x19,0x1A,0x14,0x10,0x10,0x10,0x18,0x0C,0x07,0x03,0x00,0x00,0x00,0x00,0x00,

0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,

0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
#line 466 "c:/users/korisnik/downloads/milica/gsm_modem/oled_096.h"
};

static unsigned int student [128 * 64 / 8] = {
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0xF0,
0xD8, 0x88, 0x8C, 0x84, 0x84, 0x86, 0x82, 0x02, 0x33, 0x39, 0xB9, 0x99, 0x99, 0x8F, 0x87, 0x80,
0xC0, 0xE0, 0xB0, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xE0, 0x38, 0x1C, 0x0E, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0xC0,
0xE0, 0xB0, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0xBC, 0xAC,
0xE6, 0x46, 0x42, 0x42, 0x43, 0x49, 0x4D, 0x0D, 0x09, 0x05, 0x07, 0x02, 0x40, 0x60, 0xE0, 0xE0,
0x70, 0x38, 0x18, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0xF0, 0x90, 0x98, 0x88, 0x88, 0x88, 0x80,
0xC0, 0x40, 0x40, 0x60, 0x21, 0xB1, 0x99, 0xCD, 0x67, 0x20, 0x30, 0xF8, 0xBC, 0x8E, 0xC7, 0x43,
0x61, 0x30, 0xF0, 0xF8, 0xFC, 0xEC, 0xF4, 0xB8, 0x9C, 0xC4, 0x40, 0x60, 0xF0, 0xF0, 0xF8, 0xDC,
0xEC, 0xBC, 0x9C, 0xC7, 0x43, 0x61, 0xF0, 0xF0, 0xB8, 0x98, 0x9C, 0xCC, 0x4C, 0x60, 0xE0, 0xF0,
0x78, 0x38, 0xDC, 0xFC, 0xBC, 0x9C, 0xCC, 0x64, 0x20, 0x30, 0xF8, 0xBC, 0x0E, 0x07, 0x03, 0x01,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7C, 0xCE, 0x86, 0x83, 0x83, 0x81, 0x81, 0xC0, 0x40,
0x60, 0x60, 0x30, 0x00, 0x00, 0x00, 0x00, 0x80, 0xE0, 0x70, 0x38, 0x1C, 0x0E, 0x03, 0x01, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};
#line 797 "c:/users/korisnik/downloads/milica/gsm_modem/oled_096.h"
void Init_OLED();
 void display(unsigned int *matrix);
void OLED_command(uint8_t c);
 void OLED_data(uint8_t c);





 void oledCommand( uint8_t ch );
 void oledDisplayOffset( uint8_t offset );
 void oledData( uint8_t dats );
 void oledGotoYX(unsigned char Row, unsigned char Column);
 void oledPutChar( char ch );
 void oledPrint( char *s );
 void oledClear();
 void oledInit();

 void OLED_rscroll(char start, char stop);
 void OLED_pixel(short x, short y, char color);
 void OLED_stopscroll();
 void OLED_lscroll(char start, char stop);

 void drawCircle(int16_t x0, int16_t y0, int16_t radius, int16_t color);

 void oledPutCharDigitalFont( char ch );

 void Digitalno_nula(uint8_t pozicija);
 void Digitalno_Jedan(uint8_t pozicija);
 void Digitalno_Dva(uint8_t pozicija);
 void Digitalno_Tri(uint8_t pozicija);
 void Digitalno_Cetiri(uint8_t pozicija);
 void Digitalno_Pet(uint8_t pozicija);
 void Digitalno_Sest(uint8_t pozicija);
 void Digitalno_Sedam(uint8_t pozicija);
 void Digitalno_Osam(uint8_t pozicija);
 void Digitalno_Devet(uint8_t pozicija);
#line 14 "C:/Users/Korisnik/Downloads/milica/GSM_MODEM/main.c"
uint8_t stringUART=0, i=0,a=0;
uint8_t rx_buffer[256];
uint8_t receive;
uint8_t stanje=0;
int p;
int x;
char mob[13];
char phoneNumber[13];
char broj[13];
char *s;
char *br;
char baza[ 1 ][ 13 ];
void GSM_PowerON();
void clear_rx_buffer();
int j,k,postoji = 0;
int index = -1;


int pronadjiSlobodnuLed() {

 for ( i = 0; i <  1 ; i++) {

 if (!(GPIOB_PDIR & (1 << i+8))) {
 return i;
 }
 }

 return -1;
}

int provjeriBrojUBazi(const char *broj) {
 for (i = 0; i <  1 ; i++) {
 if (strcmp(baza[i], broj) == 0) {
 return 1;
 }
 }
 return 0;
}


int dodajBrojUBazu(const char *broj) {
 for (i = 0; i <  1 ; i++) {
 if (strcmp(baza[i], "") == 0) {
 strcpy(baza[i], broj);
 return 1;




 } }
 return 0;
}
int obrisiBrojIzBaze(const char *broj) {
 for (i = 0; i <  1 ; i++) {
 if (strcmp(baza[i], broj) == 0) {

 strcpy(baza[i], "");

 }
 }return 0;
}



 void INT_UART2_RX() iv IVT_INT_UART2_RX_TX ics ICS_AUTO
{
 while ( ( UART2_S1 &  0x20u ) == 0 );

 (void) UART2_S1;
 receive = UART2_D;

 if(receive!=0x0D)
 {
 rx_buffer[i]=receive;
 i++;
 }
 else
 {
 receive=0;
 i=0;
 stringUART= 1 ;
 }
}



void main()
 {

 GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_3);
 GPIO_Digital_Input(&PTD_PDIR, _GPIO_PINMASK_2);

 UART2_Inicijalizacija();
 delay_ms(100);
 NVIC_IntEnable(IVT_INT_UART2_RX_TX);

 GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_0);
 GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_1);

 I2C1_Init_Advanced(4000000, &_GPIO_Module_I2C1_PE1_0);

 Init_OLED();
 delay_ms(100);
 oledClear();

 GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_5);
 GSM_PowerON();

 GPIO_Digital_Output(&PTB_PDOR, _GPIO_PINMASK_ALL) ;

 GPIOB_PCOR |= 0xffffffff;

 for ( i = 0; i <  1 ; i++) {
 strcpy(baza[i], "");
 }

 while (1)
 {
 switch(stanje){
 case 0: {
 Uart2_WriteString("AT\r");
 Delay_ms(500);
 if(stringUART== 1 ){
 oledClear();
 oledGotoYX(0,0);
 if(strstr(rx_buffer, "OK")){
 oledPrint("Ukljucen je");
 oledGotoYX(1,0);
 oledPrint("modem");
 Delay_ms(500);
 stanje = 1;
 }
 clear_rx_buffer();
 stringUART= 0 ;
 }
 }
 break;

 case 1: {
 clear_rx_buffer();
 Uart2_WriteString("AT+CREG=1\r");
 Delay_ms(500);
 if(stringUART ==  1 ){
 oledClear();
 oledGotoYX(0,0);
 if(strstr(rx_buffer, "OK")){
 oledPrint("Prijavljen na");
 oledGotoYX(1,0);
 oledPrint("mrezu");
 Delay_ms(1000);
 stanje = 2;
 }
 clear_rx_buffer();
 stringUART= 0 ;
 }
 }
 break;

 case 2:
 {
 oledClear();
 oledGotoYX(0,0);

 Uart2_WriteString("AT+CMGF=1\r");
 Delay_ms(100);
 Uart2_WriteString("AT+CMGD=0\r");
 Delay_ms(100);
 Uart2_WriteString("AT+CMGD=1\r");
 Delay_ms(100);
 Uart2_WriteString("AT+CMGD=2\r");
 Delay_ms(100);
 Uart2_WriteString("AT+CMGD=3\r");
 Delay_ms(100);
 Uart2_WriteString("AT+CMGD=4\r");
 Delay_ms(100);

 if (strstr(rx_buffer, "OK")){
 oledClear();
 oledGotoYX(0,0);

 clear_rx_buffer();
 stanje=3;
 }
 break;
 }

 case 3:
 Uart2_WriteString("ATE0\r");
 Delay_ms(100);
 clear_rx_buffer();
 Delay_ms(100);
 oledClear();
 oledGotoYX(0,0);
 oledPrint("Cekam poruku");
 Delay_ms(500);

 while (!(strstr(rx_buffer, "+PARKING") || strstr(rx_buffer, "-PARKING"))){
 clear_rx_buffer();
 Uart2_WriteString("AT+CNMI=1,2,0,0,0\r");
 Delay_ms(500);
 oledClear();
 oledGotoYX(0,0);
 oledPrint("Cekam poruku");
 oledGotoYX(1,0);
 Delay_ms(500);
 }

 oledClear();
 oledGotoYX(0,0);



 if((strstr(rx_buffer,"+PARKING"))){

 br=strstr(rx_buffer, "381");
 for(i=0; i<12; i++){
 phoneNumber[i]=*br;
 br++;
 }
 if (provjeriBrojUBazi(phoneNumber)) {
 oledClear();
 oledGotoYX(0,0) ;
 oledPrint("Broj u bazi.");
 Delay_ms(1000);
 stanje = 3;
 break;
 }
 else {
 oledClear();
 oledGotoYX(0,0);
 oledPrint("Broj nije u");
 oledGotoYX(1,0);
 oledPrint("bazi");
 Delay_ms(1000);
 if(dodajBrojUBazu(phoneNumber)) {
 }
 else{
 oledClear();
 oledGotoYX(0,0);
 oledPrint("Nema prostora");
 oledGotoYX(1,0) ;
 oledPrint("u bazi.");
 Delay_ms(1000);
 stanje = 3;
 break;
 }
 }

 clear_rx_buffer();
 oledClear();
 oledGotoYX(0,0);
 oledPrint("Broj ");
 oledGotoYX(1,0);
 oledPrint(phoneNumber);
 Delay_ms(1000);
 stanje=4;
 oledClear();
 break;
 }
 else if((strstr(rx_buffer,"-PARKING"))){




 s=strstr(rx_buffer, "381");
 for(i=0; i<12; i++){
 broj[i]=*s;
 s++;
 }
 if (provjeriBrojUBazi(broj)) {




 GPIOB_PCOR |= (1<<i+8);
 obrisiBrojIzBaze(broj);
 oledClear();
 oledGotoYX(0,0) ;
 oledPrint("Broj obrisan");
 oledGotoYX(1,0) ;
 oledPrint("iz baze");

 Delay_ms(1000);
 stanje = 3;
 break;
 }
 else {



 stanje = 3;
 }
 }



 case 4:
 clear_rx_buffer();
 while(!(br=strstr(rx_buffer, "381")))
 {
 oledClear();
 oledGotoYX(0, 0);
 oledPrint("Pozovite");
 Delay_ms(1000);
 }

 if(stringUART ==  1 )
 {
 oledClear();
 oledGotoYX(0,0);
 oledPrint("Zvanje u toku");
 Delay_ms(1000);


 for(x=0; x<12; x++)
 {
 if((*br) != ('\r'))
 mob[x]=*br;
 else mob[x]=0;
 br++;
 }



 Delay_ms(1000);
 for ( i = 0; i <  1 ; i++) {
 if(!strcmp(mob, baza[i]))
 {
 oledClear();
 oledGotoYX(0, 0);
 oledPrint("Parkiranje");
 Delay_ms(4000);
 index = i ;
 stanje = 3;
 break;
 }
 }
 if (index != -1) {

 int slobodnaLedDioda = pronadjiSlobodnuLed();
 if (slobodnaLedDioda != -1) {

 GPIOB_PSOR |= (1 << i+8);

 oledClear();
 oledGotoYX(0, 0);
 oledPrint("Parkirano");
 Delay_ms(4000);

 stanje = 3;
 }
 else {
 oledClear();
 oledGotoYX(0, 0);
 oledPrint("Nema slobodnih");
 oledGotoYX(1, 0);
 oledPrint("mjesta");
 stanje = 3;
 }
 }
 }memset(phoneNumber, 0, sizeof(phoneNumber));
 break;
 Delay_ms(100);
 }
 }
 }

 void clear_rx_buffer(){
 for(a=0;a<29;a++){
 rx_buffer[a]='\0';
 }
 }

 void GSM_PowerON()
 {
 GPIOD_PSOR |= (1 << 5);

 Delay_ms(200);

 GPIOD_PCOR |= (1 << 5);

 Delay_ms(800);

 GPIOD_PSOR |= (1 << 5);
 Delay_ms(200);
 }
