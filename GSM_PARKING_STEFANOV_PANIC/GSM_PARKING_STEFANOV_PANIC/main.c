#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "uart2.h"
#include "OLED_096.h"

#define STIGAO 1
#define PONISTI 0

#define BROJ 13
#define PARKING_MJESTA 1

uint8_t stringUART=0, i=0,a=0;
uint8_t rx_buffer[256];
uint8_t receive;  //promenjiva u koju cemo smestati primljni karakter iz UART5_D registra
uint8_t stanje=0;
int p;
int x;
char mob[13];
char phoneNumber[13];
char broj[13];
char *s;
char *br;
char baza[PARKING_MJESTA][BROJ];   //baza sa brojevima telefona
void GSM_PowerON();
void clear_rx_buffer();
int j,k,postoji = 0;
int index = -1;


int pronadjiSlobodnuLed() {
    // Provjeri svaku LED diodu
    for ( i = 0; i < PARKING_MJESTA; i++) {
        // Ako je LED dioda i-ta iskljuèena, vrati njen indeks
        if (!(GPIOB_PDIR & (1 << i+8))) {
            return i;
        }
    }
    // Ako nema slobodnih LED dioda, vrati -1
    return -1;
}

int provjeriBrojUBazi(const char *broj) {
    for (i = 0; i < PARKING_MJESTA; i++) {
        if (strcmp(baza[i], broj) == 0) {
            return 1; // Broj pronaden
        }
    }
    return 0; // Broj nije pronaden
}

// Funkcija za dodavanje broja u bazu ako ne postoji
int dodajBrojUBazu(const char *broj) {
    for (i = 0; i < PARKING_MJESTA; i++) {
        if (strcmp(baza[i], "") == 0) {
            strcpy(baza[i], broj); // Kopiraj broj u prvo slobodno mjesto u bazi
            return 1; // Uspješno dodan broj
      //  }
       // else {
       // return 2;
       // }
    }       }
    return 0; // Nema slobodnog mjesta u bazi
}
int obrisiBrojIzBaze(const char *broj) {
    for (i = 0; i < PARKING_MJESTA; i++) {
        if (strcmp(baza[i], broj) == 0) {
            // Pronadjen je broj u bazi, sada ga obriši
            strcpy(baza[i], ""); // Postavi prazan string na mjesto broja u bazi
             // Prekini petlju jer je broj pronadjen i obrisan
        }
    }return 0;
}



   void INT_UART2_RX() iv IVT_INT_UART2_RX_TX ics ICS_AUTO
{
   while ( ( UART2_S1 & UART_S1_RDRF_MASK) == 0 );    /* Wait for received buffer to be full*/

     (void) UART2_S1;           /* Read UART2_S1 register*/  //and clear receprion flag mechanism
     receive = UART2_D;           /* Read received data*/

     if(receive!=0x0D)
    {
        rx_buffer[i]=receive;
        i++;
    }
     else
    {
        receive=0;
        i=0;
        stringUART=STIGAO;
    }
}

 
 
void main()
  {

       GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_3);   //Tx pin za UART5 izlazni
       GPIO_Digital_Input(&PTD_PDIR, _GPIO_PINMASK_2);  //Rx pin za UART5 ulazni

       UART2_Inicijalizacija();
       delay_ms(100);                 // nakon inicijalizacije uart-a, mala pauza
       NVIC_IntEnable(IVT_INT_UART2_RX_TX);    //omoguci interrupt za UART5 Rx Tx

       GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_0);   //i2c1 SDA
       GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_1);   //i2c1 SCK

       I2C1_Init_Advanced(4000000, &_GPIO_Module_I2C1_PE1_0);

       Init_OLED();
       delay_ms(100);
       oledClear();

       GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_5);   // upravljanje reset pinom modema, kao izlaznim pinom kontrolera
       GSM_PowerON();     //ukljucivanje modema

       GPIO_Digital_Output(&PTB_PDOR, _GPIO_PINMASK_ALL) ;

       GPIOB_PCOR |= 0xffffffff;  //Sva parking mjesta su slobodna na pocetku

        for ( i = 0; i < PARKING_MJESTA; i++) {
        strcpy(baza[i], ""); // Inicijalno sva mjesta u bazi su prazna
        }

       while (1)
        {
             switch(stanje){
               case 0: {
                    Uart2_WriteString("AT\r");
                    Delay_ms(500);
                    if(stringUART==STIGAO){
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
                       stringUART=PONISTI;
                    }
               }
               break;

               case 1: {
                    clear_rx_buffer();
                    Uart2_WriteString("AT+CREG=1\r");//Provjera da li je povezano na mrezu
                    Delay_ms(500);
                    if(stringUART == STIGAO){
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
                      stringUART=PONISTI;
                    }
               }
               break;

               case 2:
               {
                     oledClear();
                     oledGotoYX(0,0);
                    //oledPrint("Text mod");
                     Uart2_WriteString("AT+CMGF=1\r");  //Text mod
                     Delay_ms(100);
                     Uart2_WriteString("AT+CMGD=0\r");  //Brise poruke
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
                 // oledPrint("Poruke obrisane");
                  clear_rx_buffer();
                  stanje=3;
                  }
               break;
               }

              case 3:
                  Uart2_WriteString("ATE0\r");   //Iskljucujemo eho
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
              //oledPrint("Stigla ispravna");
              //oledGotoYX(1,0);
              //oledPrint(rx_buffer);
              if((strstr(rx_buffer,"+PARKING"))){
              
                br=strstr(rx_buffer, "381");  //Trazi broj telefona
                for(i=0; i<12; i++){
                    phoneNumber[i]=*br; //Broj sa kojeg je poslata poruka smjesta u PhoneNumber.
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
                //oledClear();
               // oledGotoYX(1,0);
                //oledPrint("Ukloni broj");
               // Delay_ms(2000);
                s=strstr(rx_buffer, "381");  //Trazi broj telefona
                for(i=0; i<12; i++){
                    broj[i]=*s;
                    s++;
                }
                if (provjeriBrojUBazi(broj)) {
                 //oledClear();
                 //oledGotoYX(0,0) ;
                 //oledPrint("U bazi.");
                 //Delay_ms(1000);
                  GPIOB_PCOR |= (1<<i+8);
                 obrisiBrojIzBaze(broj);
                 oledClear();
                 oledGotoYX(0,0)  ;
                 oledPrint("Broj obrisan");
                 oledGotoYX(1,0)  ;
                 oledPrint("iz baze");

                 Delay_ms(1000);
                 stanje = 3;
                 break;
              } 
              else {
               // oledClear();
               // oledGotoYX(0,0)  ;
               // oledPrint("niste u bazi");
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

                        if(stringUART == STIGAO)
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
                                //oledClear();
                                //oledGotoYX(0, 0);
                                //oledPrint(mob);
                                Delay_ms(1000);
                            for ( i = 0; i < PARKING_MJESTA; i++) {
                                if(!strcmp(mob, baza[i]))//provera da li se broj koji poziva nalazi u bazi
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
                                    // Ako je pronaden broj u bazi podataka, pronadi slobodnu LED diodu
                                   int slobodnaLedDioda = pronadjiSlobodnuLed();
                                   if (slobodnaLedDioda != -1) {
                                   // Ukljuci prvu slobodnu LED diodu
                                    GPIOB_PSOR |= (1 << i+8);
                                   // Ispisuje se poruka
                                    oledClear();
                                    oledGotoYX(0, 0);
                                    oledPrint("Parkirano");
                                    Delay_ms(4000);
                                    // Promijeni stanje
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