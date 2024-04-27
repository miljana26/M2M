#include "Kalkulator_objects.h"
#include "Kalkulator_resources.h"

//--------------------- User code ---------------------//
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <math.h>




char labell[15]={0};
int broj=0;
int broj1=0;
//----------------- End of User code ------------------//

// Event Handlers

void ClearRect(int x1, int y1, int x2, int y2){
    TFT_Set_Pen(0x34D3,0);
    TFT_Set_Brush(1,0x34D3,0,0,0,0);
    TFT_Rectangle(x1,y1,x2,y2);
}
  void dodajBrojNaLabelu(char broj) {
    Label1.Caption[0] = broj;
    Label1.Caption[1] = '\0';
}

void ButtonRoundBackOnClick()
{
     DrawScreen(&Screen1);
}

void ispis_tacke()
{
     strcpy(labell, ".");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis0()
{
     strcpy(labell, "0");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis1()
{
     strcpy(labell, "1");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis2()
{
     strcpy(labell, "2");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis3()
{
     strcpy(labell, "3");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis4()
{
     strcat(labell, "4");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis5()
{
     broj1 = broj + 5 * (int)(pow(10, (int)log10(broj) + 1));
     broj=broj1;
     sprintf(labell, "%d", broj1);
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis6()
{
    // Postavi pocetni string u Label1.Caption
    strcpy(Label1.Caption, Label1_Caption);

    // Dodaj broj 6 na postojeci string u Label1.Caption
    dodajBrojNaLabelu('6');

    // Brisanje regiona na ekranu
    ClearRect(2, 2, 720, 100);

    // Crtanje labela
    DrawLabel(&Label1);
 }
 
void ispis7()
{
     strcpy(labell, "7");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis8()
{
     strcpy(labell, "8");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis9()
{
     strcpy(labell, "9");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis_plus()
{
     strcpy(labell, "+");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis_minus()
{
     strcpy(labell, "-");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis_mnozenje()
{
     strcpy(labell, "*");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis_deljenje()
{
     strcpy(labell, "/");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis_koren()
{
     strcpy(labell, "sqrt");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}

void ispis_kvadrat()
{
     strcpy(labell, "sqr");
     Label1.Caption = labell;
     ClearRect(2,2,840,100);
     DrawLabel(&Label1);
}


