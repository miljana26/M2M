#include "Kalkulator_objects.h"
#include "Kalkulator_resources.h"

//--------------------- User code ---------------------//
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stddef.h>
#include <math.h>




char labell[50] = {0};
int duzina = 0;
int i = 0;
char izraz[50];
char* prviBroj;
char* drugiBroj;
int rezultat;
//----------------- End of User code ------------------//

// Event Handlers

void ClearRect(int x1, int y1, int x2, int y2){
    TFT_Set_Pen(0x34D3,0);
    TFT_Set_Brush(1,0x34D3,0,0,0,0);
    TFT_Rectangle(x1,y1,x2,y2);
}

void ButtonRoundBackOnClick()
{
     DrawScreen(&Screen1);
}

void ispis_tacke()
{
     strcat(labell, ".");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
}

void ispis0()
{
     strcat(labell, "0");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
}

void ispis1()
{
     strcat(labell, "1");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
}

void ispis2()
{
     strcat(labell, "2");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
}

void ispis3()
{
     strcat(labell, "3");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
}

void ispis4()
{
     strcat(labell, "4");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1); 
     }
     else{}
}

void ispis5()
{
     strcat(labell, "5");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
}

void ispis6()
{
     strcat(labell, "6");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
 }
 
void ispis7()
{
     strcat(labell, "7");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
}

void ispis8()
{
     strcat(labell, "8");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
}

void ispis9()
{
     strcat(labell, "9");
     duzina=strlen(labell);
     if(duzina<16)
     {
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
     }
     else{}
}

void ispis_plus()
{
     strcat(labell, "+");
     duzina=strlen(labell);
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
}

void ispis_minus()
{
     strcat(labell, "-");
     duzina=strlen(labell);
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
}

void ispis_mnozenje()
{
     strcat(labell, "*");
     duzina=strlen(labell);
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
}

void ispis_deljenje()
{
     strcat(labell, "/");
     duzina=strlen(labell);
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
}

void ispis_koren()
{
     strcat(labell, "sqrt");
     duzina=strlen(labell);
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
}

void ispis_kvadrat()
{
     strcat(labell, "sqr");
     duzina=strlen(labell);
     Label1.Caption = labell;
     ClearRect(2,2,840,130);
     DrawLabel(&Label1);
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

void jednako() {
    prviBroj = strtok(labell, "+");
    drugiBroj = strtok(NULL, "+");

    if (prviBroj != NULL && drugiBroj != NULL) {
        // Konvertuj stringove u brojeve
        int prviBrojInt = atoi(prviBroj);
        int drugiBrojInt = atoi(drugiBroj);

        // Izracunaj zbir
        rezultat = prviBrojInt + drugiBrojInt;

        // Konvertuj rezultat u string
        sprintf(Label1.Caption, "%d", rezultat);
    } else {}


    ClearRect(2, 2, 840, 130);
    DrawLabel(&Label1);
}
