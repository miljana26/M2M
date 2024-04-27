#include "OLED_096.h"
#include <stdbool.h>


const uint8_t OledFont[][8] =
{
  {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},
  {0x00,0x00,0x5f,0x00,0x00,0x00,0x00,0x00},  // 5f na trecem mestu, uzvicnik
  {0x00,0x00,0x07,0x00,0x07,0x00,0x00,0x00},
  {0x00,0x14,0x7F,0x14,0x7F,0x14,0x00,0x00},
  {0x00,0x24,0x2A,0x7F,0x2A,0x12,0x00,0x00},
  {0x00,0x23,0x13,0x08,0x64,0x62,0x00,0x00},
  {0x00,0x36,0x49,0x55,0x22,0x50,0x00,0x00},
  {0x00,0x00,0x05,0x03,0x00,0x00,0x00,0x00},
  {0x00,0x1C,0x22,0x41,0x00,0x00,0x00,0x00},
  {0x00,0x41,0x22,0x1C,0x00,0x00,0x00,0x00},
  {0x00,0x08,0x2A,0x1C,0x2A,0x08,0x00,0x00},
  {0x00,0x08,0x08,0x3E,0x08,0x08,0x00,0x00},
  {0x00,0xA0,0x60,0x00,0x00,0x00,0x00,0x00},
  {0x00,0x08,0x08,0x08,0x08,0x08,0x00,0x00},
  {0x00,0x60,0x60,0x00,0x00,0x00,0x00,0x00},
  {0x00,0x20,0x10,0x08,0x04,0x02,0x00,0x00},
  {0x00,0x3E,0x51,0x49,0x45,0x3E,0x00,0x00},
  {0x00,0x00,0x42,0x7F,0x40,0x00,0x00,0x00},
  {0x00,0x62,0x51,0x49,0x49,0x46,0x00,0x00},
  {0x00,0x22,0x41,0x49,0x49,0x36,0x00,0x00},
  {0x00,0x18,0x14,0x12,0x7F,0x10,0x00,0x00},
  {0x00,0x27,0x45,0x45,0x45,0x39,0x00,0x00},
  {0x00,0x3C,0x4A,0x49,0x49,0x30,0x00,0x00},
  {0x00,0x01,0x71,0x09,0x05,0x03,0x00,0x00},
  {0x00,0x36,0x49,0x49,0x49,0x36,0x00,0x00},
  {0x00,0x06,0x49,0x49,0x29,0x1E,0x00,0x00},
  {0x00,0x00,0x36,0x36,0x00,0x00,0x00,0x00},
  {0x00,0x00,0xAC,0x6C,0x00,0x00,0x00,0x00},
  {0x00,0x08,0x14,0x22,0x41,0x00,0x00,0x00},
  {0x00,0x14,0x14,0x14,0x14,0x14,0x00,0x00},
  {0x00,0x41,0x22,0x14,0x08,0x00,0x00,0x00},
  {0x00,0x02,0x01,0x51,0x09,0x06,0x00,0x00},
  {0x00,0x32,0x49,0x79,0x41,0x3E,0x00,0x00},
  {0x00,0x7E,0x09,0x09,0x09,0x7E,0x00,0x00},
  {0x00,0x7F,0x49,0x49,0x49,0x36,0x00,0x00},
  {0x00,0x3E,0x41,0x41,0x41,0x22,0x00,0x00},
  {0x00,0x7F,0x41,0x41,0x22,0x1C,0x00,0x00},
  {0x00,0x7F,0x49,0x49,0x49,0x41,0x00,0x00},
  {0x00,0x7F,0x09,0x09,0x09,0x01,0x00,0x00},
  {0x00,0x3E,0x41,0x41,0x51,0x72,0x00,0x00},
  {0x00,0x7F,0x08,0x08,0x08,0x7F,0x00,0x00},
  {0x00,0x41,0x7F,0x41,0x00,0x00,0x00,0x00},
  {0x00,0x20,0x40,0x41,0x3F,0x01,0x00,0x00},
  {0x00,0x7F,0x08,0x14,0x22,0x41,0x00,0x00},
  {0x00,0x7F,0x40,0x40,0x40,0x40,0x00,0x00},
  {0x00,0x7F,0x02,0x0C,0x02,0x7F,0x00,0x00},
  {0x00,0x7F,0x04,0x08,0x10,0x7F,0x00,0x00},
  {0x00,0x3E,0x41,0x41,0x41,0x3E,0x00,0x00},
  {0x00,0x7F,0x09,0x09,0x09,0x06,0x00,0x00},
  {0x00,0x3E,0x41,0x51,0x21,0x5E,0x00,0x00},
  {0x00,0x7F,0x09,0x19,0x29,0x46,0x00,0x00},
  {0x00,0x26,0x49,0x49,0x49,0x32,0x00,0x00},
  {0x00,0x01,0x01,0x7F,0x01,0x01,0x00,0x00},
  {0x00,0x3F,0x40,0x40,0x40,0x3F,0x00,0x00},
  {0x00,0x1F,0x20,0x40,0x20,0x1F,0x00,0x00},
  {0x00,0x3F,0x40,0x38,0x40,0x3F,0x00,0x00},
  {0x00,0x63,0x14,0x08,0x14,0x63,0x00,0x00},
  {0x00,0x03,0x04,0x78,0x04,0x03,0x00,0x00},
  {0x00,0x61,0x51,0x49,0x45,0x43,0x00,0x00},
  {0x00,0x7F,0x41,0x41,0x00,0x00,0x00,0x00},
  {0x00,0x02,0x04,0x08,0x10,0x20,0x00,0x00},
  {0x00,0x41,0x41,0x7F,0x00,0x00,0x00,0x00},
  {0x00,0x04,0x02,0x01,0x02,0x04,0x00,0x00},
  {0x00,0x80,0x80,0x80,0x80,0x80,0x00,0x00},
  {0x00,0x01,0x02,0x04,0x00,0x00,0x00,0x00},
  {0x00,0x20,0x54,0x54,0x54,0x78,0x00,0x00},
  {0x00,0x7F,0x48,0x44,0x44,0x38,0x00,0x00},
  {0x00,0x38,0x44,0x44,0x28,0x00,0x00,0x00},
  {0x00,0x38,0x44,0x44,0x48,0x7F,0x00,0x00},
  {0x00,0x38,0x54,0x54,0x54,0x18,0x00,0x00},
  {0x00,0x08,0x7E,0x09,0x02,0x00,0x00,0x00},
  {0x00,0x18,0xA4,0xA4,0xA4,0x7C,0x00,0x00},
  {0x00,0x7F,0x08,0x04,0x04,0x78,0x00,0x00},
  {0x00,0x00,0x7D,0x00,0x00,0x00,0x00,0x00},
  {0x00,0x80,0x84,0x7D,0x00,0x00,0x00,0x00},
  {0x00,0x7F,0x10,0x28,0x44,0x00,0x00,0x00},
  {0x00,0x41,0x7F,0x40,0x00,0x00,0x00,0x00},
  {0x00,0x7C,0x04,0x18,0x04,0x78,0x00,0x00},
  {0x00,0x7C,0x08,0x04,0x7C,0x00,0x00,0x00},
  {0x00,0x38,0x44,0x44,0x38,0x00,0x00,0x00},
  {0x00,0xFC,0x24,0x24,0x18,0x00,0x00,0x00},
  {0x00,0x18,0x24,0x24,0xFC,0x00,0x00,0x00},
  {0x00,0x00,0x7C,0x08,0x04,0x00,0x00,0x00},
  {0x00,0x48,0x54,0x54,0x24,0x00,0x00,0x00},
  {0x00,0x04,0x7F,0x44,0x00,0x00,0x00,0x00},
  {0x00,0x3C,0x40,0x40,0x7C,0x00,0x00,0x00},
  {0x00,0x1C,0x20,0x40,0x20,0x1C,0x00,0x00},
  {0x00,0x3C,0x40,0x30,0x40,0x3C,0x00,0x00},
  {0x00,0x44,0x28,0x10,0x28,0x44,0x00,0x00},
  {0x00,0x1C,0xA0,0xA0,0x7C,0x00,0x00,0x00},
  {0x00,0x44,0x64,0x54,0x4C,0x44,0x00,0x00},
  {0x00,0x08,0x36,0x41,0x00,0x00,0x00,0x00},
  {0x00,0x00,0x7F,0x00,0x00,0x00,0x00,0x00},
  {0x00,0x41,0x36,0x08,0x00,0x00,0x00,0x00},
  {0x00,0x02,0x01,0x01,0x02,0x01,0x00,0x00},
  {0x00,0x02,0x05,0x05,0x02,0x00,0x00,0x00}
};





const uint8_t digitalFont[][8]  = {
    {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}, //32
    {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},  //33
    {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},  //34
    {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},  //35
    {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},  //36

    {0xff, 0xfe, 0xfc, 0xf9, 0xf3, 0xe7, 0xcf, 0x9f},  //37
    {0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},  //38
    {0x7f, 0x3f, 0x9f, 0xcf, 0xe7, 0xf3, 0xf9, 0xfc},  //39
    {0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},  //40
    {0xe7, 0xe7, 0xe7, 0xe7, 0xe7, 0xe7, 0xe7, 0xe7},   //41
    {0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},  //42
    {0xfe, 0xfc, 0xf9, 0xf3, 0xe7, 0xcf, 0x9f, 0x3f},  //43
    {0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},  //44
    {0x7f, 0x3f, 0x9f, 0xcf, 0xe7, 0xf3, 0xf9, 0xfc},  //45
    {0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e},  //46


    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0x0f},  //47
    {0x0f, 0x0f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},  //48

    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0xf0},  //49
    {0xf0, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},  //50

    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},  //51




  };



void oledInit()
{
    oledCommand( SSD1308_Display_Off_Cmd );
    delay_ms( 100 );
    oledCommand( SSD1308_Display_On_Cmd );
    delay_ms( 100 );
    oledCommand( SSD1308_Normal_Display_Cmd );
    oledCommand( SSD1308_Dectivate_Scroll_Cmd );
}




void oledCommand( uint8_t ch )
{
    uint8_t bytes[2];
    bytes[0] = SSD1308_Command_Mode;
    bytes[1] = ch;
    I2C1_Start();
    I2C1_Write( SSD1308_Address, bytes, 2,  END_MODE_STOP );
}


void oledDisplayOffset( uint8_t offset )
{
    uint8_t bytes[3];
    bytes[0] = SSD1308_Command_Mode;
    bytes[1] = 0xD3;
    bytes[2] = offset;
    I2C1_Start();
    I2C1_Write( SSD1308_Address, bytes, 3,  END_MODE_STOP );
}


void oledData( uint8_t dats )
{
    uint8_t bytes[2];
    bytes[0] = SSD1308_Data_Mode;
    bytes[1] = dats;
    I2C1_Start();
    I2C1_Write( SSD1308_Address, bytes, 2,  END_MODE_STOP );
}


void oledGotoYX(unsigned char Row, unsigned char Column)
{
    oledCommand( 0xB0 + Row);
    oledCommand( 0x00 + (8*Column & 0x0F) );
    oledCommand( 0x10 + ((8*Column>>4)&0x0F) );
}


void oledPutChar( char ch )
{

 const uint8_t *base = &OledFont[ch - 32][0];
         uint8_t bytes[9];

    if ( ( ch < 32 ) || ( ch > 127 ) )
        ch = ' ';




    bytes[0] = SSD1308_Data_Mode;
    memmove( bytes + 1, base, 8 );
    I2C1_Start();
    I2C1_Write( SSD1308_Address, bytes, 9,  END_MODE_STOP );
}


void oledPrint( char *s )
{
    uint8_t i = 0, red = 0;
    while (*s){
     oledPutChar( *s++);
     i++;
     if(i>14){
       red++;
       oledGotoYX(red, 0);
       i = 0;
     }
    }
}


void oledClear()
{
    uint16_t row=0;
    uint16_t col = 0;
    for (  row = 0; row < 8; row++ ) {
        for (  col = 0; col < 16; col++ ) {
            oledGotoYX( row, col );
            oledPutChar( ' ' );
        }
    }
}


void OLED_rscroll(char start, char stop) {
    oledCommand(0x26);
    oledCommand(0X00);
    oledCommand(start);
    oledCommand(0X00);
    oledCommand(stop);
    oledCommand(0X00);
    oledCommand(0XFF);
    oledCommand(0x2F); //Activate scroll
}

void OLED_lscroll(char start, char stop) {
    oledCommand(0x27);
    oledCommand(0X00);
    oledCommand(start);
    oledCommand(0X00);
    oledCommand(stop);
    oledCommand(0X00);
    oledCommand(0XFF);
    oledCommand(0x2F); //Activate scroll
}
void OLED_stopscroll() {
    oledCommand(0x2E);
}
void OLED_pixel(short x, short y, char color){ //hmm, dosent include error checking..
    char y_bit = y%8;
    short y_row = (y - y_bit)*16 + x;
    buffer[y_row] |= (color?1:0) << y_bit;
}



void oledPutCharDigitalFont( char ch )
{          const uint8_t *base = &digitalFont[ch - 32][0];
uint8_t bytes[9];
    if ( ( ch < 32 ) || ( ch > 127 ) )
        ch = ' ';




    bytes[0] = SSD1308_Data_Mode;
    memmove( bytes + 1, base, 8 );
    I2C1_Start();
    I2C1_Write( SSD1308_Address, bytes, 9, END_MODE_STOP );



}



void Init_OLED()
{

    oledCommand(SSD1306_DISPLAYOFF);
        oledCommand(SSD1306_SETDISPLAYCLOCKDIV);
        oledCommand(0x80);
        oledCommand(SSD1306_SETMULTIPLEX);
        oledCommand(64-1);//height-1
        oledCommand(SSD1306_SETDISPLAYOFFSET);
        oledCommand(0x00);//no offset
        oledCommand(SSD1306_SETSTARTLINE| 0x00);//set start line
        oledCommand(SSD1306_CHARGEPUMP);//charge pump
        oledCommand(0x14);//dclk upto 14-15
        oledCommand(SSD1306_MEMORYMODE);
        oledCommand(0x00);//OLED RAM
        oledCommand(SSD1306_SEGREMAP| 0x01);
        oledCommand(SSD1306_COMSCANDEC);
        oledCommand(SSD1306_SETCOMPINS);
        oledCommand(0x12);
        oledCommand(SSD1306_SETCONTRAST);
        oledCommand(0xcf);
        oledCommand(SSD1306_SETPRECHARGE);
        oledCommand(0xf1);
        oledCommand(SSD1306_SETVCOMDETECT);
        oledCommand(0x40);
        oledCommand(SSD1306_DISPLAYALLON_RESUME);
        oledCommand(SSD1306_NORMALDISPLAY);
        oledCommand(SSD1306_DISPLAYON);
        oledCommand(SSD1306_COLUMNADDR);
        oledCommand(0x00);
        oledCommand(0x7f);
        oledCommand(SSD1306_PAGEADDR);
        oledCommand(0x00);
        oledCommand(0x07);


//  ovo je inicijalizacija za oled 128x32!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        oledCommand(SSD1306_DISPLAYOFF);         // 0xAE
//    oledCommand(SSD1306_SETDISPLAYCLOCKDIV); // 0xD5
//    oledCommand(0x80);                    // the suggested ratio 0x80
//    oledCommand(SSD1306_SETMULTIPLEX);       // 0xA8
//    oledCommand(0x7F);                               // za 12x32 ide 0x1f ,  a za 128x64 ide 0x7f
//    oledCommand(SSD1306_SETDISPLAYOFFSET);   // 0xD3
//    oledCommand(0x0);                        // no offset
//    oledCommand(SSD1306_SETSTARTLINE | 0x0); // line #0
//    oledCommand(SSD1306_CHARGEPUMP);         // 0x8D
//    oledCommand(0xAF);
//    oledCommand(SSD1306_MEMORYMODE);         // 0x20
//    oledCommand(0x00);                    // 0x0 act like ks0108
//    oledCommand(SSD1306_SEGREMAP | 0x1);
//    oledCommand(SSD1306_COMSCANDEC);
//    oledCommand(SSD1306_SETCOMPINS);         // 0xDA
//    oledCommand(0x12);   //  za 128x32 ide 0x02, a za 128x64 ide 0x12
//    oledCommand(SSD1306_SETCONTRAST);        // 0x81
//    oledCommand(0x9F);     // za 128x32 ide 0x8f   a za 128x64 ide 0x9f
//    oledCommand(SSD1306_SETPRECHARGE);       // 0xd9
//    oledCommand(0xF1);
//    oledCommand(SSD1306_SETVCOMDETECT);      // 0xDB
//    oledCommand(0x40);
//    oledCommand(SSD1306_DISPLAYALLON_RESUME);// 0xA4
//    oledCommand(SSD1306_NORMALDISPLAY);      // 0xA6
//    oledCommand(SSD1306_DISPLAYON);          //--turn on oled panel
//
//

}


 void display(unsigned int *matrix) {
    uint16_t i;
    oledCommand(0 | 0x0);  // low col = 0
    oledCommand(0 | 0x0);  // hi col = 0
    oledCommand(0 | 0x1); // line #0
    for (i=0; i<(128*64/8); i++) {

            oledData(matrix[i]); //transmit write command

    }

}
/*void oledCommand(uint8_t c) {
    // I2C command

    uint8_t control = 0x00;   // Co = 0, D/C = 0

  //  MasterWriteI2C(i2c_addr<<1 | I2C_WRITE);
    I2C1_Start ();
  //  I2C1_Write(0x78);
    I2C1_Write(0,i2c_addr<<1 | I2C_WRITE,1, END_MODE_STOP );
   I2C1_Write(0,control,1, END_MODE_STOP );
   I2C1_Write(0,c,1, END_MODE_STOP );
  //  I2C1_Write(control);
  //  I2C1_Write(c);

    //StopI2C();   //ovo skidam
}
 void OLED_data(uint8_t c) {
    // I2C dats
       uint8_t control = 0x40;   // Co = 0, D/C = 1

      I2C1_Start();
      I2C1_Write(0,0x78,1, END_MODE_STOP );

   // I2C1_Write(0x78);
    I2C1_Write(0,control,1, END_MODE_STOP );
    I2C1_Write(0,c,1, END_MODE_STOP );

   // StopI2C();
}*/


///***************************************************************************************
//function: void drawPixel(int16_t x, int16_t y, uint16_t color)
//Description: Draw a pixel, x position from left to right (0 to 127) LCD_WIDTH
//                        y position from bottom to top (0 to 63) LCD HEIGHT for 128x64
//                        colors= white, black or inverse
//***************************************************************************************/
//// the most basic function, set a single pixel
//void drawPixel(int16_t x, int16_t y, uint16_t color) {
//        if (x >= 0 && x < SSD1306_LCDWIDTH && y >= 0 && y < SSD1306_LCDHEIGHT) {
//                switch (color) {
//                        case WHITE:   buffer[x + (y / 8) * SSD1306_LCDWIDTH] |=  (1 << (y & 7)); break;
//                        case BLACK:   buffer[x + (y / 8) * SSD1306_LCDWIDTH] &= ~(1 << (y & 7)); break;
//                        case INVERSE: buffer[x + (y / 8) * SSD1306_LCDWIDTH] ^=  (1 << (y & 7)); break;
//                }
//        }
//
//}


//
//
//
///****************************************************************************
//function: void oled_black_white()
//Description: Sample function to check white line on screen
//****************************************************************************/
//void oled_black_white()
//{
//    I2C_StartData(i2c_addr<<1 | I2C_WRITE,    0x40);
//        //i2c_start(i2c_addr<<1 | I2C_WRITE);
//        //i2c_write(0x40);
//        for ( j=0; j<32;j++)
//        {
//
//        for( i=0;i<16;i++)
//        I2C_WriteValue(0);
//        //i2c_write(0);
//        for( i=0;i<16;i++)
//         I2C_WriteValue(1);
//        //i2c_write(1);
//        }
//        //i2c_stop();
//}
//
///****************************************************************************
//function: void dispaly_bmp_image(const char *image)
//Description: A bitmap image '*image' to be displayed.
//*image is array of all bits of bitmap images to be displayed.
//****************************************************************************/
//void dispaly_bmp_image(const char *image)
//{
//    I2C_StartData(i2c_addr<<1 | I2C_WRITE,    0x40);
//        //i2c_start(i2c_addr<<1 | I2C_WRITE);
//        //i2c_write(0x40);
//        for ( j=0; j<(SSD1306_LCDHEIGHT*SSD1306_LCDWIDTH/8);j++)
//        {
//                I2C_WriteValue(image[j]);
//        }
////        i2c_stop();
//        //oled_command(SSD1306_DISPLAYON);
//}
///*******************************************************************************
//function: display_bmp_logo()
//Description: displays my logo.
//*******************************************************************************/
////void dispaly_bmp_logo()
////{
////    I2C_StartData(i2c_addr<<1 | I2C_WRITE,    0x40);
////        //i2c_start(i2c_addr<<1 | I2C_WRITE);
////        //i2c_write(0x40);
////        for (int j=0; j<(SSD1306_LCDHEIGHT*SSD1306_LCDWIDTH/8);j++)
////        {
////                i2c_write(pgm_read_byte(&manoj[j]));
////        }
////        i2c_stop();
////        //oled_command(SSD1306_DISPLAYON);
////}
//
///****************************************************************************
//function: void oled_clear_display()
//Description: Clear OLED display by black dots
//*****************************************************************************/
//void oled_clear_display()
//{
//        memset(buffer, 0, 1024);
//}
//
///**************************************************************************
//function: void oled_invertDisplay()
//Description: Invert colors of display
//**************************************************************************/
//void oled_invertDisplay(uint8_t i) {
//        if (i) {
//                oled_command(SSD1306_INVERTDISPLAY);
//                } else {
//                oled_command(SSD1306_NORMALDISPLAY);
//        }
//}
//
///************************************************************************
//function: void startscrollright()
//Description: Scroll right
//************************************************************************/
//void startscrollright(uint8_t start, uint8_t stop){
//        oled_command(SSD1306_RIGHT_HORIZONTAL_SCROLL);
//        oled_command(0X00);
//        oled_command(start);
//        oled_command(0X00);
//        oled_command(stop);
//        oled_command(0X00);
//        oled_command(0XFF);
//        oled_command(SSD1306_ACTIVATE_SCROLL);
//}
//
///************************************************************************
//function: void startscrollleft()
//Description: Scroll left
//************************************************************************/
//void startscrollleft(uint8_t start, uint8_t stop){
//        oled_command(SSD1306_LEFT_HORIZONTAL_SCROLL);
//        oled_command(0X00);
//        oled_command(start);
//        oled_command(0X00);
//        oled_command(stop);
//        oled_command(0X00);
//        oled_command(0XFF);
//        oled_command(SSD1306_ACTIVATE_SCROLL);
//}
//
///*********************************************************************
//function: void startscrolldiagright()
//Description: Scroll right diagonally
//*********************************************************************/
//void startscrolldiagright(uint8_t start, uint8_t stop){
//        oled_command(SSD1306_SET_VERTICAL_SCROLL_AREA);
//        oled_command(0X00);
//        oled_command(SSD1306_LCDHEIGHT);
//        oled_command(SSD1306_VERTICAL_AND_RIGHT_HORIZONTAL_SCROLL);
//        oled_command(0X00);
//        oled_command(start);
//        oled_command(0X00);
//        oled_command(stop);
//        oled_command(0X01);
//        oled_command(SSD1306_ACTIVATE_SCROLL);
//}
//
///************************************************************************
//function: void startscrolldiagleft()
//Description: Scroll left diagonally
//************************************************************************/
//void startscrolldiagleft(uint8_t start, uint8_t stop){
//        oled_command(SSD1306_SET_VERTICAL_SCROLL_AREA);
//        oled_command(0X00);
//        oled_command(SSD1306_LCDHEIGHT);
//        oled_command(SSD1306_VERTICAL_AND_LEFT_HORIZONTAL_SCROLL);
//        oled_command(0X00);
//        oled_command(start);
//        oled_command(0X00);
//        oled_command(stop);
//        oled_command(0X01);
//        oled_command(SSD1306_ACTIVATE_SCROLL);
//}
//
///*****************************************************************************
//function: void stopscroll()
//Description: Stop scrolling
//*****************************************************************************/
//void stopscroll(void){
//        oled_command(SSD1306_DEACTIVATE_SCROLL);
//}
//
///****************************************************************************
//function: void dim(bool dim)
//Description: Set contrast levels
//******************************************************************************/
//void dim(bool dim) {
//        uint8_t contrast;
//
//        if (dim) {
//                contrast = 0; // Dimmed display
//                } else {
//                //if (_vccstate == SSD1306_EXTERNALVCC) {
//                //        contrast = 0x9F;
//                //        } else {
//                        contrast = 0xCF;
//                //}
//        }
//        // the range of contrast to too small to be really useful
//        // it is useful to dim the display
//        oled_command(SSD1306_SETCONTRAST);
//        oled_command(contrast);
//}
//
///***************************************************************************************
//function: void drawPixel(int16_t x, int16_t y, uint16_t color)
//Description: Draw a pixel, x position from left to right (0 to 127) LCD_WIDTH
//                        y position from bottom to top (0 to 63) LCD HEIGHT for 128x64
//                        colors= white, black or inverse
//***************************************************************************************/
//// the most basic function, set a single pixel
//void drawPixel(int16_t x, int16_t y, uint16_t color) {
//        if (x >= 0 && x < SSD1306_LCDWIDTH && y >= 0 && y < SSD1306_LCDHEIGHT) {
//                switch (color) {
//                        case WHITE:   buffer[x + (y / 8) * SSD1306_LCDWIDTH] |=  (1 << (y & 7)); break;
//                        case BLACK:   buffer[x + (y / 8) * SSD1306_LCDWIDTH] &= ~(1 << (y & 7)); break;
//                        case INVERSE: buffer[x + (y / 8) * SSD1306_LCDWIDTH] ^=  (1 << (y & 7)); break;
//                }
//        }
//
//}
//
/////**************************************************************************************
////function: void drawFont5x8(int16_t x, int16_t y, uint8_t color, char letter)
////Description: Draw font x,y are position on LCD to display 'letter', colors White, black,
////or inverse
////**************************************************************************************/
//void drawFont5x8(int16_t x, int16_t y, uint8_t color, char letter)
//{
//        uint8_t dataF;
//        for ( i=0; i<5; i++)
//        {
//                //dataF=pgm_read_byte(&(font[letter*5 + i]));
//                for ( j=0;j<8; j++)
//                {
//                        if ((dataF>>j) & 0x01)
//                        {
//                                drawPixel(x+i,y+j, color);
//                        }
//                }
//        }
//}
//
//
///***************************************************************************************
//function: void drawFont5x8(int16_t x, int16_t y, uint8_t color, char letter)
//Description: Draw font x,y are position on LCD to display 'letter' string.
//colors= White, black,or inverse
//***************************************************************************************/
//void printString(int16_t x, int16_t y, uint8_t color, char *letter)
//{
//        while(*letter)
//        {
//                drawFont5x8(x, y, color, *letter++);
//                x=x+6;//Increment cursor by one font + one cursor space
//                if (x>(SSD1306_LCDWIDTH-1))
//                {
//                        x=0;                //go back to first column
//                        y+9;                //for5x7 font keep space in line one font height(8 bits)+ one pixel (1 bit)
//                        if (y>(SSD1306_LCDHEIGHT - 1))
//                        {
//                                return;
//                        }
//                }
//        }
//}
///**********************************************************************************************
//Function: drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t color)
//Description: Draw line from (x0,y0) to (x1 to y1) of LCD
// where    0 > (x0, x1) >= 127 and 0 > (y0, y1) >= 63,  color= White, black, inverse
//**********************************************************************************************/
//void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t color) {
//        int16_t steep = abs(y1 - y0) > abs(x1 - x0);
//        if (steep) {
//                _swap_int16_t(x0, y0);
//                _swap_int16_t(x1, y1);
//        }
//
//        if (x0 > x1) {
//                _swap_int16_t(x0, x1);
//                _swap_int16_t(y0, y1);
//        }
//
//        int16_t dx, dy;
//        dx = x1 - x0;
//        dy = abs(y1 - y0);
//
//        int16_t err = dx / 2;
//        int16_t ystep;
//
//        if (y0 < y1) {
//                ystep = 1;
//                } else {
//                ystep = -1;
//        }
//
//        for (; x0<=x1; x0++) {
//                if (steep) {
//                        drawPixel(y0, x0, color);
//                        } else {
//                        drawPixel(x0, y0, color);
//                }
//                err -= dy;
//                if (err < 0) {
//                        y0 += ystep;
//                        err += dx;
//                }
//        }
//}
//
///**********************************************************************************************
//Function: drawRect(int16_t x, int16_t y, int16_t width, int16_t height, int16_t color)
//Description: Draw rectangle from (x,y) with given width and height in pixels
//                         color= White, black, inverse
//**********************************************************************************************/
//
//void drawRect(int16_t x, int16_t y, int16_t width, int16_t height, int16_t color) {
//        drawHorizontalLine(x, y, width, color);
//        drawVerticalLine(x, y, height, color);
//        drawVerticalLine(x + width - 1, y, height, color);
//        drawHorizontalLine(x, y + height - 1, width, color);
//}
//
///**********************************************************************************************
//Function: void drawHorizontalLine(int16_t x, int16_t y, int16_t length, int16_t color)
//Description: Draw horizontal line from (x,y) with given length in pixels
//                         color= White, black, inverse
//**********************************************************************************************/
//void drawHorizontalLine(int16_t x, int16_t y, int16_t length, int16_t color) {
//        if (y < 0 || y >= SSD1306_LCDHEIGHT) { return; }
//
//        if (x < 0) {
//                length += x;
//                x = 0;
//        }
//
//        if ( (x + length) > SSD1306_LCDWIDTH) {
//                length = (SSD1306_LCDWIDTH - x);
//        }
//
//        if (length <= 0) { return; }
//
//        uint8_t * bufferPtr = buffer;
//        bufferPtr += (y >> 3) * SSD1306_LCDWIDTH;
//        bufferPtr += x;
//
//        uint8_t drawBit = 1 << (y & 7);
//
//        switch (color) {
//                case WHITE:   while (length--) {
//                        *bufferPtr++ |= drawBit;
//                }; break;
//                case BLACK:   drawBit = ~drawBit;   while (length--) {
//                        *bufferPtr++ &= drawBit;
//                }; break;
//                case INVERSE: while (length--) {
//                        *bufferPtr++ ^= drawBit;
//                }; break;
//        }
//}
//
///**********************************************************************************************
//Function: void drawVerticalLine(int16_t x, int16_t y, int16_t length int16_t color)
//Description: Draw horizontal line from (x,y) with given length in pixels
//                         color= White, black, inverse
//**********************************************************************************************/
//void drawVerticalLine(int16_t x, int16_t y, int16_t length, int16_t color) {
//        if (x < 0 || x >= SSD1306_LCDWIDTH) return;
//
//        if (y < 0) {
//                length += y;
//                y = 0;
//        }
//
//        if ( (y + length) > SSD1306_LCDHEIGHT) {
//                length = (SSD1306_LCDHEIGHT - y);
//        }
//
//        if (length <= 0) return;
//
//
//        uint8_t yOffset = y & 7;
//        uint8_t drawBit;
//        uint8_t *bufferPtr = buffer;
//
//        bufferPtr += (y >> 3) * SSD1306_LCDWIDTH;
//        bufferPtr += x;
//
//        if (yOffset) {
//                yOffset = 8 - yOffset;
//                drawBit = ~(0xFF >> (yOffset));
//
//                if (length < yOffset) {
//                        drawBit &= (0xFF >> (yOffset - length));
//                }
//
//                switch (color) {
//                        case WHITE:   *bufferPtr |=  drawBit; break;
//                        case BLACK:   *bufferPtr &= ~drawBit; break;
//                        case INVERSE: *bufferPtr ^=  drawBit; break;
//                }
//
//                if (length < yOffset) return;
//
//                length -= yOffset;
//                bufferPtr += SSD1306_LCDWIDTH;
//        }
//
//        if (length >= 8) {
//                switch (color) {
//                        case WHITE:
//                        case BLACK:
//                        drawBit = (color == WHITE) ? 0xFF : 0x00;
//                        do {
//                                *bufferPtr = drawBit;
//                                bufferPtr += SSD1306_LCDWIDTH;
//                                length -= 8;
//                        } while (length >= 8);
//                        break;
//                        case INVERSE:
//                        do {
//                                *bufferPtr = ~(*bufferPtr);
//                                bufferPtr += SSD1306_LCDWIDTH;
//                                length -= 8;
//                        } while (length >= 8);
//                        break;
//                }
//        }
//
//        if (length > 0) {
//                drawBit = (1 << (length & 7)) - 1;
//                switch (color) {
//                        case WHITE:   *bufferPtr |=  drawBit; break;
//                        case BLACK:   *bufferPtr &= ~drawBit; break;
//                        case INVERSE: *bufferPtr ^=  drawBit; break;
//                }
//        }
//}
//
///**********************************************************************************************
//Function: void drawCircle(int16_t x0, int16_t y0, int16_t radius, int16_t color)
//Description: Draw  a circle with radius 'radius' in pixels at position x0, y0 on lcd
//                         color= White, black, inverse
//**********************************************************************************************/
void drawCircle(int16_t x0, int16_t y0, int16_t radius, int16_t color) {
        int16_t x = 0, y = radius;
        int16_t dp = 1 - radius;
        do {
                if (dp < 0)
                dp = dp + 2 * (++x) + 3;
                else
                dp = dp + 2 * (++x) - 2 * (--y) + 5;

                OLED_pixel(x0 + x, y0 + y, color);     //For the 8 octants
                OLED_pixel(x0 - x, y0 + y, color);
                OLED_pixel(x0 + x, y0 - y, color);
                OLED_pixel(x0 - x, y0 - y, color);
                OLED_pixel(x0 + y, y0 + x, color);
                OLED_pixel(x0 - y, y0 + x, color);
                OLED_pixel(x0 + y, y0 - x, color);
                OLED_pixel(x0 - y, y0 - x, color);

        } while (x < y);

        OLED_pixel(x0 + radius, y0, color);
        OLED_pixel(x0, y0 + radius, color);
        OLED_pixel(x0 - radius, y0, color);
        OLED_pixel(x0, y0 - radius, color);
}


//
//void DigitalniSat(uint8_t sat, uint8_t minut, uint8_t sekund){
//
//
//}

void Digitalno_nula(uint8_t pozicija){




    oledGotoYX(2,pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(3,pozicija);
    oledPutCharDigitalFont(33);
    oledGotoYX(4,pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,pozicija);
    oledPutCharDigitalFont(33);

    oledGotoYX(2,1+pozicija);
    oledPutCharDigitalFont(38);
    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);
    oledGotoYX(3,2+pozicija);
    oledPutCharDigitalFont(40);
    oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,2+pozicija);
    oledPutCharDigitalFont(42);
    oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(6,1+pozicija);
    oledPutCharDigitalFont(44);
    oledGotoYX(6,pozicija);
    oledPutCharDigitalFont(45);

//    oledGotoYX(4,1+pozicija);
//    oledPutCharDigitalFont(46);


}

void Digitalno_Jedan(uint8_t pozicija){

    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);
    oledGotoYX(3,2+pozicija);
    oledPutCharDigitalFont(40);
    oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,2+pozicija);
    oledPutCharDigitalFont(42);
    oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);
}

void Digitalno_Dva(uint8_t pozicija){

     oledGotoYX(2,pozicija);
    oledPutCharDigitalFont(43);
     oledGotoYX(2,1+pozicija);
    oledPutCharDigitalFont(38);
    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);
    oledGotoYX(3,2+pozicija);
    oledPutCharDigitalFont(40);
      oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
      oledGotoYX(4,pozicija);
    oledPutCharDigitalFont(41);
     oledGotoYX(5,pozicija);
    oledPutCharDigitalFont(33);
        oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(6,1+pozicija);
    oledPutCharDigitalFont(44);
    oledGotoYX(6,pozicija);
    oledPutCharDigitalFont(45);
    oledGotoYX(4,1+pozicija);
    oledPutCharDigitalFont(46);
}


void Digitalno_Tri(uint8_t pozicija){

        oledGotoYX(2,pozicija);
    oledPutCharDigitalFont(43);
     oledGotoYX(2,1+pozicija);
    oledPutCharDigitalFont(38);
    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);
    oledGotoYX(3,2+pozicija);
    oledPutCharDigitalFont(40);
      oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
      oledGotoYX(4,pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,2+pozicija);
    oledPutCharDigitalFont(42);
        oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(6,1+pozicija);
    oledPutCharDigitalFont(44);
    oledGotoYX(6,pozicija);
    oledPutCharDigitalFont(45);
    oledGotoYX(4,1+pozicija);
    oledPutCharDigitalFont(46);
}

void Digitalno_Cetiri(uint8_t pozicija){

     oledGotoYX(2,pozicija);
    oledPutCharDigitalFont(43);


    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);
    oledGotoYX(3,2+pozicija);
    oledPutCharDigitalFont(40);
      oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
      oledGotoYX(4,pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,2+pozicija);
    oledPutCharDigitalFont(42);
        oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);

      oledGotoYX(3,pozicija);
    oledPutCharDigitalFont(33);

    oledGotoYX(4,1+pozicija);
    oledPutCharDigitalFont(46);

}

void Digitalno_Pet(uint8_t pozicija){


    oledGotoYX(2,pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(3,pozicija);
    oledPutCharDigitalFont(33);
    oledGotoYX(4,pozicija);
    oledPutCharDigitalFont(41);

    oledGotoYX(2,1+pozicija);
    oledPutCharDigitalFont(38);
    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);

    oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,2+pozicija);
    oledPutCharDigitalFont(42);
    oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(6,1+pozicija);
    oledPutCharDigitalFont(44);
    oledGotoYX(6,pozicija);
    oledPutCharDigitalFont(45);

    oledGotoYX(4,1+pozicija);
    oledPutCharDigitalFont(46);

}

void Digitalno_Sest(uint8_t pozicija){

    oledGotoYX(2,pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(3,pozicija);
    oledPutCharDigitalFont(33);
    oledGotoYX(4,pozicija);
    oledPutCharDigitalFont(41);

    oledGotoYX(2,1+pozicija);
    oledPutCharDigitalFont(38);
    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);

    oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,2+pozicija);
    oledPutCharDigitalFont(42);
    oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(6,1+pozicija);
    oledPutCharDigitalFont(44);
    oledGotoYX(6,pozicija);
    oledPutCharDigitalFont(45);
        oledGotoYX(5,pozicija);
    oledPutCharDigitalFont(33);

    oledGotoYX(4,1+pozicija);
    oledPutCharDigitalFont(46);

}

void Digitalno_Sedam(uint8_t pozicija){
     oledGotoYX(2,pozicija);
    oledPutCharDigitalFont(43);
     oledGotoYX(2,1+pozicija);
    oledPutCharDigitalFont(38);
    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);
    oledGotoYX(3,2+pozicija);
    oledPutCharDigitalFont(40);
      oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,2+pozicija);
    oledPutCharDigitalFont(42);
    oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);
}

void Digitalno_Osam(uint8_t pozicija){
      oledGotoYX(2,pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(3,pozicija);
    oledPutCharDigitalFont(33);
    oledGotoYX(4,pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,pozicija);
    oledPutCharDigitalFont(33);

    oledGotoYX(2,1+pozicija);
    oledPutCharDigitalFont(38);
    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);
    oledGotoYX(3,2+pozicija);
    oledPutCharDigitalFont(40);
    oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,2+pozicija);
    oledPutCharDigitalFont(42);
    oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(6,1+pozicija);
    oledPutCharDigitalFont(44);
    oledGotoYX(6,pozicija);
    oledPutCharDigitalFont(45);

    oledGotoYX(4,1+pozicija);
    oledPutCharDigitalFont(46);

}

void Digitalno_Devet(uint8_t pozicija){
          oledGotoYX(2,pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(3,pozicija);
    oledPutCharDigitalFont(33);
    oledGotoYX(4,pozicija);
    oledPutCharDigitalFont(41);


    oledGotoYX(2,1+pozicija);
    oledPutCharDigitalFont(38);
    oledGotoYX(2,2+pozicija);
    oledPutCharDigitalFont(39);
    oledGotoYX(3,2+pozicija);
    oledPutCharDigitalFont(40);
    oledGotoYX(4,2+pozicija);
    oledPutCharDigitalFont(41);
    oledGotoYX(5,2+pozicija);
    oledPutCharDigitalFont(42);
    oledGotoYX(6,2+pozicija);
    oledPutCharDigitalFont(43);
    oledGotoYX(6,1+pozicija);
    oledPutCharDigitalFont(44);
    oledGotoYX(6,pozicija);
    oledPutCharDigitalFont(45);

    oledGotoYX(4,1+pozicija);
    oledPutCharDigitalFont(46);
}