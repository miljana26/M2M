#line 1 "E:/Kalkulator_M2M_StefanovPanic/Kalkulator/Kalkulator_events_code.c"
#line 1 "e:/kalkulator_m2m_stefanovpanic/kalkulator/kalkulator_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 void (*OnSwipeLeftPtr)();
 void (*OnSwipeRightPtr)();
 void (*OnSwipeUpPtr)();
 void (*OnSwipeDownPtr)();
 void (*OnZoomInPtr)();
 void (*OnZoomOutPtr)();
};

extern TScreen Screen1;
extern TButton_Round ButtonRound1;
extern TButton_Round ButtonRound2;
extern TButton_Round ButtonRound3;
extern TButton_Round ButtonRound4;
extern TButton_Round ButtonRound5;
extern TLabel Label1;
extern TButton_Round ButtonRound8;
extern TButton_Round ButtonRound9;
extern TButton_Round ButtonRound10;
extern TButton_Round ButtonRound11;
extern TButton_Round ButtonRound12;
extern TButton_Round ButtonRound13;
extern TButton_Round ButtonRound14;
extern TButton_Round ButtonRound15;
extern TButton_Round ButtonRound16;
extern TButton_Round ButtonRound17;
extern TButton_Round ButtonRound18;
extern TButton_Round ButtonRound19;
extern TButton_Round ButtonRound20;
extern TButton_Round ButtonRound21;
extern TButton_Round ButtonRound22;
extern TButton_Round * const code Screen1_Buttons_Round[20];
extern TLabel * const code Screen1_Labels[1];

extern TScreen Screen2;
extern TButton_Round ButtonRound6;
extern TButton_Round * const code Screen2_Buttons_Round[1];

extern TScreen Screen3;
extern TButton_Round ButtonRound7;
extern TButton_Round * const code Screen3_Buttons_Round[1];




void ClearRect(int x1, int y1, int x2, int y2);
void ButtonRoundBackOnClick();
void ispis_tacke();
void ispis0();
void ispis1();
void ispis2();
void ispis3();
void ispis4();
void ispis5();
void ispis6();
void ispis7();
void ispis8();
void ispis9();
void ispis_plus();
void ispis_minus();
void ispis_mnozenje();
void ispis_deljenje();
void ispis_koren();
void ispis_kvadrat();
void brisanje_jednog_karaktera();
void brisanje_svih_karaktera();
void jednako();




extern char ButtonRound1_Caption[];
extern char ButtonRound2_Caption[];
extern char ButtonRound3_Caption[];
extern char ButtonRound4_Caption[];
extern char ButtonRound5_Caption[];
extern char Label1_Caption[];
extern char ButtonRound8_Caption[];
extern char ButtonRound9_Caption[];
extern char ButtonRound10_Caption[];
extern char ButtonRound11_Caption[];
extern char ButtonRound12_Caption[];
extern char ButtonRound13_Caption[];
extern char ButtonRound14_Caption[];
extern char ButtonRound15_Caption[];
extern char ButtonRound16_Caption[];
extern char ButtonRound17_Caption[];
extern char ButtonRound18_Caption[];
extern char ButtonRound19_Caption[];
extern char ButtonRound20_Caption[];
extern char ButtonRound21_Caption[];
extern char ButtonRound22_Caption[];
extern char ButtonRound6_Caption[];
extern char ButtonRound7_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "e:/kalkulator_m2m_stefanovpanic/kalkulator/kalkulator_resources.h"
const code char Tahoma39x48_Regular[];
const code char Tahoma11x13_Regular[];
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/math.h"





double fabs(double d);
double floor(double x);
double ceil(double x);
double frexp(double value, int * eptr);
double ldexp(double value, int newexp);
double modf(double val, double * iptr);
double sqrt(double x);
double atan(double f);
double asin(double x);
double acos(double x);
double atan2(double y,double x);
double sin(double f);
double cos(double f);
double tan(double x);
double exp(double x);
double log(double x);
double log10(double x);
double pow(double x, double y);
double sinh(double x);
double cosh(double x);
double tanh(double x);
#line 10 "E:/Kalkulator_M2M_StefanovPanic/Kalkulator/Kalkulator_events_code.c"
char labell[50] = {0};
int duzina = 0;
int i;
float rezultat=0.0;
int zakljucano = 0;
float result =0.0;
float operand ;

float calculate(char *expression) {
 float result = 0;
 float current_num = 0.0;
 char last_operator = '+';
 int decimal_flag = 0;
 float decimal_multiplier = 0.1;
 float intermediate_result = 0.0;

 while (*expression) {
 if (isdigit(*expression)) {
 if (decimal_flag) {
 current_num += (*expression - '0') * decimal_multiplier;
 decimal_multiplier *= 0.1;
 } else {
 current_num = current_num * 10.0 + (*expression - '0');
 }
 } else if (*expression == '.') {
 decimal_flag = 1;
 } else if (*expression == '+' || *expression == '-' || *expression == '*' || *expression == '/') {
 switch (last_operator) {
 case '+':
 intermediate_result += current_num;
 break;
 case '-':
 intermediate_result -= current_num;
 break;
 case '*':
 intermediate_result *= current_num;
 break;
 case '/':
 if (current_num != 0) {
 intermediate_result /= current_num;
 } else {
 intermediate_result = 0;
 }
 break;
 }
 last_operator = *expression;
 current_num = 0;
 decimal_flag = 0;
 decimal_multiplier = 0.1;
 } else if (*expression == 'r') {
 intermediate_result += current_num;
 intermediate_result = sqrt(intermediate_result);
 current_num = 0;
 } else if (*expression == 's') {
 intermediate_result += current_num;
 intermediate_result = intermediate_result * intermediate_result;
 current_num = 0;
 }
 expression++;
 }

 switch (last_operator) {
 case '+':
 intermediate_result += current_num;
 break;
 case '-':
 intermediate_result -= current_num;
 break;
 case '*':
 intermediate_result *= current_num;
 break;
 case '/':
 if (current_num != 0) {
 intermediate_result /= current_num;
 } else {
 intermediate_result = 0;
 }
 break;
 }

 return intermediate_result;
}


void jednako() {

 result = calculate(labell);
 rezultat = result;

 if ((int)rezultat == rezultat) {
 sprintf(Label1.Caption, "%g", rezultat);
 } else {
 sprintf(Label1.Caption, "%g", rezultat);
 }
 ClearRect(2, 2, 840, 130);
 DrawLabel(&Label1);
 zakljucano = 1;
}



void ClearRect(int x1, int y1, int x2, int y2){
 TFT_Set_Pen(0x34D3,0);
 TFT_Set_Brush(1,0x34D3,0,0,0,0);
 TFT_Rectangle(x1,y1,x2,y2);
}

void ButtonRoundBackOnClick()
{
 DrawScreen(&Screen1);
}

void form()
{
 duzina=strlen(labell);
 if(duzina<16)
 {
 Label1.Caption = labell;
 ClearRect(2,2,840,130);
 DrawLabel(&Label1);
 }
}
void ispis_tacke()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, ".");
 form();
 }else
 {
 strcat(labell, ".");
 form();
 }
}

void ispis0()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "0");
 form();
 }else
 {
 strcat(labell, "0");
 form();
 }
}

void ispis1()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "1");
 form();
 }else
 {
 strcat(labell, "1");
 form();
 }
}

void ispis2()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "2");
 form();
 }else
 {
 strcat(labell, "2");
 form();
 }
}

void ispis3()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "3");
 form();
 }else
 {
 strcat(labell, "3");
 form();
 }
}

void ispis4()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "4");
 form();
 }else
 {
 strcat(labell, "4");
 form();
 }
}

void ispis5()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "5");
 form();
 }else
 {
 strcat(labell, "5");
 form();
 }
}

void ispis6()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "6");
 form();
 }else
 {
 strcat(labell, "6");
 form();
 }
 }

void ispis7()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "7");
 form();
 }else
 {
 strcat(labell, "7");
 form();
 }
}

void ispis8()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "8");
 form();
 }else
 {
 strcat(labell, "8");
 form();
 }
}

void ispis9()
{
 if(zakljucano == 1)
 {
 brisanje_svih_karaktera();
 zakljucano = 0;
 strcat(labell, "9");
 form();
 }else
 {
 strcat(labell, "9");
 form();
 }
}

void ispis_plus()
{
 strcat(labell, "+");
 duzina=strlen(labell);
 Label1.Caption = labell;
 ClearRect(2,2,840,130);
 DrawLabel(&Label1);
 zakljucano = 0;
}

void ispis_minus()
{
 strcat(labell, "-");
 duzina=strlen(labell);
 Label1.Caption = labell;
 ClearRect(2,2,840,130);
 DrawLabel(&Label1);
 zakljucano = 0;
}

void ispis_mnozenje()
{
 strcat(labell, "*");
 duzina=strlen(labell);
 Label1.Caption = labell;
 ClearRect(2,2,840,130);
 DrawLabel(&Label1);
 zakljucano = 0;
}

void ispis_deljenje()
{
 strcat(labell, "/");
 duzina=strlen(labell);
 Label1.Caption = labell;
 ClearRect(2,2,840,130);
 DrawLabel(&Label1);
 zakljucano = 0;
}

void ispis_koren()
{
 strcat(labell, "r");
 duzina=strlen(labell);
 Label1.Caption = labell;
 ClearRect(2,2,840,130);
 DrawLabel(&Label1);
 zakljucano = 0;
}

void ispis_kvadrat()
{
 strcat(labell, "s");
 duzina=strlen(labell);
 Label1.Caption = labell;
 ClearRect(2,2,840,130);
 DrawLabel(&Label1);
 zakljucano = 0;
}

void brisanje_jednog_karaktera()
{
 duzina = strlen(labell);

 if (duzina > 0) {
 labell[duzina - 1] = '\0';
 }
 Label1.Caption = labell;
 ClearRect(2,2,840,130);
 DrawLabel(&Label1);
}

void brisanje_svih_karaktera() {
 duzina = strlen(labell);

 for(i = 0; i < duzina; i++) {
 labell[i] = '\0';
 }
 Label1.Caption = labell;
 ClearRect(2, 2, 840, 130);
 DrawLabel(&Label1);
}
