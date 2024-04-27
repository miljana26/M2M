#include "Kalkulator_objects.h"
#include "Kalkulator_resources.h"
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stddef.h>
#include <math.h>


char labell[50] = {0}; //string koji pokazuje trenutni racun kalkulatora
int duzina = 0; //duzina stringa label
int i; //brojacka promenljiva
float rezultat=0.0; //rezultat racuna koji se ispisuje na ekranu
int zakljucano = 0; //fleg koji se koristi kod ispisa
float result =0.0;  //cuvanje rezultat
float operand ; //za cuvanje trenutnog broja koji se obradjuje u izrazu

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
        } else if (*expression == 'r') { // Square root
            intermediate_result += current_num;
            intermediate_result = sqrt(intermediate_result);
            current_num = 0;
        } else if (*expression == 's') { // Square
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

void form() //genericka funkcija za formiranje stringa na displeju
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