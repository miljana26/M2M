_oledInit:
;OLED_096.c,143 :: 		void oledInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;OLED_096.c,145 :: 		oledCommand( SSD1308_Display_Off_Cmd );
MOVS	R0, #174
BL	_oledCommand+0
;OLED_096.c,146 :: 		delay_ms( 100 );
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_oledInit0:
SUBS	R7, R7, #1
BNE	L_oledInit0
NOP
NOP
NOP
;OLED_096.c,147 :: 		oledCommand( SSD1308_Display_On_Cmd );
MOVS	R0, #175
BL	_oledCommand+0
;OLED_096.c,148 :: 		delay_ms( 100 );
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_oledInit2:
SUBS	R7, R7, #1
BNE	L_oledInit2
NOP
NOP
NOP
;OLED_096.c,149 :: 		oledCommand( SSD1308_Normal_Display_Cmd );
MOVS	R0, #166
BL	_oledCommand+0
;OLED_096.c,150 :: 		oledCommand( SSD1308_Dectivate_Scroll_Cmd );
MOVS	R0, #46
BL	_oledCommand+0
;OLED_096.c,151 :: 		}
L_end_oledInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _oledInit
_oledCommand:
;OLED_096.c,156 :: 		void oledCommand( uint8_t ch )
; ch start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
;OLED_096.c,159 :: 		bytes[0] = SSD1308_Command_Mode;
ADD	R2, SP, #4
MOVS	R1, #128
STRB	R1, [R2, #0]
;OLED_096.c,160 :: 		bytes[1] = ch;
ADDS	R1, R2, #1
STRB	R0, [R1, #0]
; ch end address is: 0 (R0)
;OLED_096.c,161 :: 		I2C1_Start();
BL	_I2C1_Start+0
;OLED_096.c,162 :: 		I2C1_Write( SSD1308_Address, bytes, 2,  END_MODE_STOP );
ADD	R1, SP, #4
MOVW	R3, #1
MOVS	R2, #2
MOVS	R0, #60
BL	_I2C1_Write+0
;OLED_096.c,163 :: 		}
L_end_oledCommand:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oledCommand
_oledDisplayOffset:
;OLED_096.c,166 :: 		void oledDisplayOffset( uint8_t offset )
; offset start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; offset end address is: 0 (R0)
; offset start address is: 0 (R0)
;OLED_096.c,169 :: 		bytes[0] = SSD1308_Command_Mode;
ADD	R3, SP, #4
MOVS	R1, #128
STRB	R1, [R3, #0]
;OLED_096.c,170 :: 		bytes[1] = 0xD3;
ADDS	R2, R3, #1
MOVS	R1, #211
STRB	R1, [R2, #0]
;OLED_096.c,171 :: 		bytes[2] = offset;
ADDS	R1, R3, #2
STRB	R0, [R1, #0]
; offset end address is: 0 (R0)
;OLED_096.c,172 :: 		I2C1_Start();
BL	_I2C1_Start+0
;OLED_096.c,173 :: 		I2C1_Write( SSD1308_Address, bytes, 3,  END_MODE_STOP );
ADD	R1, SP, #4
MOVW	R3, #1
MOVS	R2, #3
MOVS	R0, #60
BL	_I2C1_Write+0
;OLED_096.c,174 :: 		}
L_end_oledDisplayOffset:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oledDisplayOffset
_oledData:
;OLED_096.c,177 :: 		void oledData( uint8_t dats )
; dats start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; dats end address is: 0 (R0)
; dats start address is: 0 (R0)
;OLED_096.c,180 :: 		bytes[0] = SSD1308_Data_Mode;
ADD	R2, SP, #4
MOVS	R1, #64
STRB	R1, [R2, #0]
;OLED_096.c,181 :: 		bytes[1] = dats;
ADDS	R1, R2, #1
STRB	R0, [R1, #0]
; dats end address is: 0 (R0)
;OLED_096.c,182 :: 		I2C1_Start();
BL	_I2C1_Start+0
;OLED_096.c,183 :: 		I2C1_Write( SSD1308_Address, bytes, 2,  END_MODE_STOP );
ADD	R1, SP, #4
MOVW	R3, #1
MOVS	R2, #2
MOVS	R0, #60
BL	_I2C1_Write+0
;OLED_096.c,184 :: 		}
L_end_oledData:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oledData
_oledGotoYX:
;OLED_096.c,187 :: 		void oledGotoYX(unsigned char Row, unsigned char Column)
; Row start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R1, [SP, #4]
; Row end address is: 0 (R0)
; Row start address is: 0 (R0)
;OLED_096.c,189 :: 		oledCommand( 0xB0 + Row);
ADDW	R2, R0, #176
; Row end address is: 0 (R0)
UXTB	R0, R2
BL	_oledCommand+0
;OLED_096.c,190 :: 		oledCommand( 0x00 + (8*Column & 0x0F) );
LDRB	R2, [SP, #4]
LSLS	R2, R2, #3
SXTH	R2, R2
AND	R2, R2, #15
UXTB	R0, R2
BL	_oledCommand+0
;OLED_096.c,191 :: 		oledCommand( 0x10 + ((8*Column>>4)&0x0F) );
LDRB	R2, [SP, #4]
LSLS	R2, R2, #3
SXTH	R2, R2
ASRS	R2, R2, #4
SXTH	R2, R2
AND	R2, R2, #15
SXTH	R2, R2
ADDS	R2, #16
UXTB	R0, R2
BL	_oledCommand+0
;OLED_096.c,192 :: 		}
L_end_oledGotoYX:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oledGotoYX
_oledPutChar:
;OLED_096.c,195 :: 		void oledPutChar( char ch )
; ch start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
;OLED_096.c,198 :: 		const uint8_t *base = &OledFont[ch - 32][0];
SUBW	R1, R0, #32
SXTH	R1, R1
LSLS	R2, R1, #3
MOVW	R1, #lo_addr(_OledFont+0)
MOVT	R1, #hi_addr(_OledFont+0)
ADDS	R1, R1, R2
; base start address is: 12 (R3)
MOV	R3, R1
;OLED_096.c,201 :: 		if ( ( ch < 32 ) || ( ch > 127 ) )
CMP	R0, #32
IT	CC
BCC	L__oledPutChar31
CMP	R0, #127
IT	HI
BHI	L__oledPutChar30
; ch end address is: 0 (R0)
IT	AL
BAL	L_oledPutChar6
L__oledPutChar31:
L__oledPutChar30:
;OLED_096.c,202 :: 		ch = ' ';
L_oledPutChar6:
;OLED_096.c,207 :: 		bytes[0] = SSD1308_Data_Mode;
ADD	R2, SP, #4
MOVS	R1, #64
STRB	R1, [R2, #0]
;OLED_096.c,208 :: 		memmove( bytes + 1, base, 8 );
ADDS	R1, R2, #1
MOVS	R2, #8
SXTH	R2, R2
MOV	R0, R1
; base end address is: 12 (R3)
MOV	R1, R3
BL	_memmove+0
;OLED_096.c,209 :: 		I2C1_Start();
BL	_I2C1_Start+0
;OLED_096.c,210 :: 		I2C1_Write( SSD1308_Address, bytes, 9,  END_MODE_STOP );
ADD	R1, SP, #4
MOVW	R3, #1
MOVS	R2, #9
MOVS	R0, #60
BL	_I2C1_Write+0
;OLED_096.c,211 :: 		}
L_end_oledPutChar:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _oledPutChar
_oledPrint:
;OLED_096.c,214 :: 		void oledPrint( char *s )
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #8]
;OLED_096.c,216 :: 		uint8_t i = 0, red = 0;
MOVS	R1, #0
STRB	R1, [SP, #4]
MOVS	R1, #0
STRB	R1, [SP, #5]
;OLED_096.c,217 :: 		while (*s){
L_oledPrint7:
LDR	R1, [SP, #8]
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_oledPrint8
;OLED_096.c,218 :: 		oledPutChar( *s++);
LDR	R1, [SP, #8]
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_oledPutChar+0
LDR	R1, [SP, #8]
ADDS	R1, R1, #1
STR	R1, [SP, #8]
;OLED_096.c,219 :: 		i++;
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
STRB	R1, [SP, #4]
;OLED_096.c,220 :: 		if(i>14){
CMP	R1, #14
IT	LS
BLS	L_oledPrint9
;OLED_096.c,221 :: 		red++;
LDRB	R1, [SP, #5]
ADDS	R1, R1, #1
STRB	R1, [SP, #5]
;OLED_096.c,222 :: 		oledGotoYX(red, 0);
UXTB	R0, R1
MOVS	R1, #0
BL	_oledGotoYX+0
;OLED_096.c,223 :: 		i = 0;
MOVS	R1, #0
STRB	R1, [SP, #4]
;OLED_096.c,224 :: 		}
L_oledPrint9:
;OLED_096.c,225 :: 		}
IT	AL
BAL	L_oledPrint7
L_oledPrint8:
;OLED_096.c,226 :: 		}
L_end_oledPrint:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _oledPrint
_oledClear:
;OLED_096.c,229 :: 		void oledClear()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;OLED_096.c,231 :: 		uint16_t row=0;
;OLED_096.c,232 :: 		uint16_t col = 0;
;OLED_096.c,233 :: 		for (  row = 0; row < 8; row++ ) {
MOVS	R0, #0
STRH	R0, [SP, #4]
L_oledClear10:
LDRH	R0, [SP, #4]
CMP	R0, #8
IT	CS
BCS	L_oledClear11
;OLED_096.c,234 :: 		for (  col = 0; col < 16; col++ ) {
MOVS	R0, #0
STRH	R0, [SP, #6]
L_oledClear13:
LDRH	R0, [SP, #6]
CMP	R0, #16
IT	CS
BCS	L_oledClear14
;OLED_096.c,235 :: 		oledGotoYX( row, col );
LDRH	R1, [SP, #6]
LDRH	R0, [SP, #4]
BL	_oledGotoYX+0
;OLED_096.c,236 :: 		oledPutChar( ' ' );
MOVS	R0, #32
BL	_oledPutChar+0
;OLED_096.c,234 :: 		for (  col = 0; col < 16; col++ ) {
LDRH	R0, [SP, #6]
ADDS	R0, R0, #1
STRH	R0, [SP, #6]
;OLED_096.c,237 :: 		}
IT	AL
BAL	L_oledClear13
L_oledClear14:
;OLED_096.c,233 :: 		for (  row = 0; row < 8; row++ ) {
LDRH	R0, [SP, #4]
ADDS	R0, R0, #1
STRH	R0, [SP, #4]
;OLED_096.c,238 :: 		}
IT	AL
BAL	L_oledClear10
L_oledClear11:
;OLED_096.c,239 :: 		}
L_end_oledClear:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oledClear
_OLED_rscroll:
;OLED_096.c,242 :: 		void OLED_rscroll(char start, char stop) {
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
STRB	R1, [SP, #8]
;OLED_096.c,243 :: 		oledCommand(0x26);
MOVS	R0, #38
BL	_oledCommand+0
;OLED_096.c,244 :: 		oledCommand(0X00);
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,245 :: 		oledCommand(start);
LDRB	R0, [SP, #4]
BL	_oledCommand+0
;OLED_096.c,246 :: 		oledCommand(0X00);
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,247 :: 		oledCommand(stop);
LDRB	R0, [SP, #8]
BL	_oledCommand+0
;OLED_096.c,248 :: 		oledCommand(0X00);
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,249 :: 		oledCommand(0XFF);
MOVS	R0, #255
BL	_oledCommand+0
;OLED_096.c,250 :: 		oledCommand(0x2F); //Activate scroll
MOVS	R0, #47
BL	_oledCommand+0
;OLED_096.c,251 :: 		}
L_end_OLED_rscroll:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OLED_rscroll
_OLED_lscroll:
;OLED_096.c,253 :: 		void OLED_lscroll(char start, char stop) {
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
STRB	R1, [SP, #8]
;OLED_096.c,254 :: 		oledCommand(0x27);
MOVS	R0, #39
BL	_oledCommand+0
;OLED_096.c,255 :: 		oledCommand(0X00);
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,256 :: 		oledCommand(start);
LDRB	R0, [SP, #4]
BL	_oledCommand+0
;OLED_096.c,257 :: 		oledCommand(0X00);
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,258 :: 		oledCommand(stop);
LDRB	R0, [SP, #8]
BL	_oledCommand+0
;OLED_096.c,259 :: 		oledCommand(0X00);
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,260 :: 		oledCommand(0XFF);
MOVS	R0, #255
BL	_oledCommand+0
;OLED_096.c,261 :: 		oledCommand(0x2F); //Activate scroll
MOVS	R0, #47
BL	_oledCommand+0
;OLED_096.c,262 :: 		}
L_end_OLED_lscroll:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OLED_lscroll
_OLED_stopscroll:
;OLED_096.c,263 :: 		void OLED_stopscroll() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;OLED_096.c,264 :: 		oledCommand(0x2E);
MOVS	R0, #46
BL	_oledCommand+0
;OLED_096.c,265 :: 		}
L_end_OLED_stopscroll:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_stopscroll
_OLED_pixel:
;OLED_096.c,266 :: 		void OLED_pixel(short x, short y, char color){ //hmm, dosent include error checking..
; color start address is: 8 (R2)
; y start address is: 4 (R1)
; x start address is: 0 (R0)
SXTB	R5, R1
SXTB	R1, R0
; color end address is: 8 (R2)
; y end address is: 4 (R1)
; x end address is: 0 (R0)
; x start address is: 4 (R1)
; y start address is: 20 (R5)
; color start address is: 8 (R2)
;OLED_096.c,267 :: 		char y_bit = y%8;
MOVS	R4, #8
SXTB	R4, R4
SDIV	R3, R5, R4
MLS	R3, R4, R3, R5
SXTB	R3, R3
; y_bit start address is: 0 (R0)
UXTB	R0, R3
;OLED_096.c,268 :: 		short y_row = (y - y_bit)*16 + x;
UXTB	R3, R3
SUB	R3, R5, R3
SXTH	R3, R3
; y end address is: 20 (R5)
LSLS	R3, R3, #4
SXTH	R3, R3
ADDS	R3, R3, R1
SXTH	R3, R3
; x end address is: 4 (R1)
;OLED_096.c,269 :: 		buffer[y_row] |= (color?1:0) << y_bit;
SXTB	R3, R3
LSLS	R4, R3, #1
MOVW	R3, #lo_addr(OLED_096_buffer+0)
MOVT	R3, #hi_addr(OLED_096_buffer+0)
ADDS	R5, R3, R4
CMP	R2, #0
IT	EQ
BEQ	L_OLED_pixel16
; color end address is: 8 (R2)
; ?FLOC___OLED_pixel?T68 start address is: 4 (R1)
MOVS	R1, #1
SXTB	R1, R1
; ?FLOC___OLED_pixel?T68 end address is: 4 (R1)
IT	AL
BAL	L_OLED_pixel17
L_OLED_pixel16:
; ?FLOC___OLED_pixel?T68 start address is: 4 (R1)
MOVS	R1, #0
SXTB	R1, R1
; ?FLOC___OLED_pixel?T68 end address is: 4 (R1)
L_OLED_pixel17:
; ?FLOC___OLED_pixel?T68 start address is: 4 (R1)
LSL	R4, R1, R0
SXTH	R4, R4
; y_bit end address is: 0 (R0)
; ?FLOC___OLED_pixel?T68 end address is: 4 (R1)
LDRH	R3, [R5, #0]
ORRS	R3, R4
STRH	R3, [R5, #0]
;OLED_096.c,270 :: 		}
L_end_OLED_pixel:
BX	LR
; end of _OLED_pixel
_oledPutCharDigitalFont:
;OLED_096.c,274 :: 		void oledPutCharDigitalFont( char ch )
; ch start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
;OLED_096.c,275 :: 		{          const uint8_t *base = &digitalFont[ch - 32][0];
SUBW	R1, R0, #32
SXTH	R1, R1
LSLS	R2, R1, #3
MOVW	R1, #lo_addr(_digitalFont+0)
MOVT	R1, #hi_addr(_digitalFont+0)
ADDS	R1, R1, R2
; base start address is: 12 (R3)
MOV	R3, R1
;OLED_096.c,277 :: 		if ( ( ch < 32 ) || ( ch > 127 ) )
CMP	R0, #32
IT	CC
BCC	L__oledPutCharDigitalFont34
CMP	R0, #127
IT	HI
BHI	L__oledPutCharDigitalFont33
; ch end address is: 0 (R0)
IT	AL
BAL	L_oledPutCharDigitalFont20
L__oledPutCharDigitalFont34:
L__oledPutCharDigitalFont33:
;OLED_096.c,278 :: 		ch = ' ';
L_oledPutCharDigitalFont20:
;OLED_096.c,283 :: 		bytes[0] = SSD1308_Data_Mode;
ADD	R2, SP, #4
MOVS	R1, #64
STRB	R1, [R2, #0]
;OLED_096.c,284 :: 		memmove( bytes + 1, base, 8 );
ADDS	R1, R2, #1
MOVS	R2, #8
SXTH	R2, R2
MOV	R0, R1
; base end address is: 12 (R3)
MOV	R1, R3
BL	_memmove+0
;OLED_096.c,285 :: 		I2C1_Start();
BL	_I2C1_Start+0
;OLED_096.c,286 :: 		I2C1_Write( SSD1308_Address, bytes, 9, END_MODE_STOP );
ADD	R1, SP, #4
MOVW	R3, #1
MOVS	R2, #9
MOVS	R0, #60
BL	_I2C1_Write+0
;OLED_096.c,290 :: 		}
L_end_oledPutCharDigitalFont:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _oledPutCharDigitalFont
_Init_OLED:
;OLED_096.c,294 :: 		void Init_OLED()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;OLED_096.c,297 :: 		oledCommand(SSD1306_DISPLAYOFF);
MOVS	R0, #174
BL	_oledCommand+0
;OLED_096.c,298 :: 		oledCommand(SSD1306_SETDISPLAYCLOCKDIV);
MOVS	R0, #213
BL	_oledCommand+0
;OLED_096.c,299 :: 		oledCommand(0x80);
MOVS	R0, #128
BL	_oledCommand+0
;OLED_096.c,300 :: 		oledCommand(SSD1306_SETMULTIPLEX);
MOVS	R0, #168
BL	_oledCommand+0
;OLED_096.c,301 :: 		oledCommand(64-1);//height-1
MOVS	R0, #63
BL	_oledCommand+0
;OLED_096.c,302 :: 		oledCommand(SSD1306_SETDISPLAYOFFSET);
MOVS	R0, #211
BL	_oledCommand+0
;OLED_096.c,303 :: 		oledCommand(0x00);//no offset
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,304 :: 		oledCommand(SSD1306_SETSTARTLINE| 0x00);//set start line
MOVS	R0, #64
BL	_oledCommand+0
;OLED_096.c,305 :: 		oledCommand(SSD1306_CHARGEPUMP);//charge pump
MOVS	R0, #141
BL	_oledCommand+0
;OLED_096.c,306 :: 		oledCommand(0x14);//dclk upto 14-15
MOVS	R0, #20
BL	_oledCommand+0
;OLED_096.c,307 :: 		oledCommand(SSD1306_MEMORYMODE);
MOVS	R0, #32
BL	_oledCommand+0
;OLED_096.c,308 :: 		oledCommand(0x00);//OLED RAM
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,309 :: 		oledCommand(SSD1306_SEGREMAP| 0x01);
MOVS	R0, #161
BL	_oledCommand+0
;OLED_096.c,310 :: 		oledCommand(SSD1306_COMSCANDEC);
MOVS	R0, #200
BL	_oledCommand+0
;OLED_096.c,311 :: 		oledCommand(SSD1306_SETCOMPINS);
MOVS	R0, #218
BL	_oledCommand+0
;OLED_096.c,312 :: 		oledCommand(0x12);
MOVS	R0, #18
BL	_oledCommand+0
;OLED_096.c,313 :: 		oledCommand(SSD1306_SETCONTRAST);
MOVS	R0, #129
BL	_oledCommand+0
;OLED_096.c,314 :: 		oledCommand(0xcf);
MOVS	R0, #207
BL	_oledCommand+0
;OLED_096.c,315 :: 		oledCommand(SSD1306_SETPRECHARGE);
MOVS	R0, #217
BL	_oledCommand+0
;OLED_096.c,316 :: 		oledCommand(0xf1);
MOVS	R0, #241
BL	_oledCommand+0
;OLED_096.c,317 :: 		oledCommand(SSD1306_SETVCOMDETECT);
MOVS	R0, #219
BL	_oledCommand+0
;OLED_096.c,318 :: 		oledCommand(0x40);
MOVS	R0, #64
BL	_oledCommand+0
;OLED_096.c,319 :: 		oledCommand(SSD1306_DISPLAYALLON_RESUME);
MOVS	R0, #164
BL	_oledCommand+0
;OLED_096.c,320 :: 		oledCommand(SSD1306_NORMALDISPLAY);
MOVS	R0, #166
BL	_oledCommand+0
;OLED_096.c,321 :: 		oledCommand(SSD1306_DISPLAYON);
MOVS	R0, #175
BL	_oledCommand+0
;OLED_096.c,322 :: 		oledCommand(SSD1306_COLUMNADDR);
MOVS	R0, #33
BL	_oledCommand+0
;OLED_096.c,323 :: 		oledCommand(0x00);
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,324 :: 		oledCommand(0x7f);
MOVS	R0, #127
BL	_oledCommand+0
;OLED_096.c,325 :: 		oledCommand(SSD1306_PAGEADDR);
MOVS	R0, #34
BL	_oledCommand+0
;OLED_096.c,326 :: 		oledCommand(0x00);
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,327 :: 		oledCommand(0x07);
MOVS	R0, #7
BL	_oledCommand+0
;OLED_096.c,359 :: 		}
L_end_Init_OLED:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_OLED
_display:
;OLED_096.c,362 :: 		void display(unsigned int *matrix) {
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #8]
;OLED_096.c,364 :: 		oledCommand(0 | 0x0);  // low col = 0
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,365 :: 		oledCommand(0 | 0x0);  // hi col = 0
MOVS	R0, #0
BL	_oledCommand+0
;OLED_096.c,366 :: 		oledCommand(0 | 0x1); // line #0
MOVS	R0, #1
BL	_oledCommand+0
;OLED_096.c,367 :: 		for (i=0; i<(128*64/8); i++) {
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
UXTH	R0, R2
L_display21:
; i start address is: 0 (R0)
CMP	R0, #1024
IT	CS
BCS	L_display22
;OLED_096.c,369 :: 		oledData(matrix[i]); //transmit write command
LSLS	R2, R0, #1
LDR	R1, [SP, #8]
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
UXTB	R1, R1
STRH	R0, [SP, #4]
UXTB	R0, R1
BL	_oledData+0
LDRH	R0, [SP, #4]
;OLED_096.c,367 :: 		for (i=0; i<(128*64/8); i++) {
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 8 (R2)
UXTH	R2, R1
;OLED_096.c,371 :: 		}
UXTH	R0, R2
; i end address is: 8 (R2)
IT	AL
BAL	L_display21
L_display22:
;OLED_096.c,373 :: 		}
L_end_display:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _display
_drawCircle:
;OLED_096.c,838 :: 		void drawCircle(int16_t x0, int16_t y0, int16_t radius, int16_t color) {
; color start address is: 12 (R3)
; radius start address is: 8 (R2)
; y0 start address is: 4 (R1)
; x0 start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; color end address is: 12 (R3)
; radius end address is: 8 (R2)
; y0 end address is: 4 (R1)
; x0 end address is: 0 (R0)
; x0 start address is: 0 (R0)
; y0 start address is: 4 (R1)
; radius start address is: 8 (R2)
; color start address is: 12 (R3)
;OLED_096.c,839 :: 		int16_t x = 0, y = radius;
; x start address is: 20 (R5)
MOVW	R5, #0
SXTH	R5, R5
; y start address is: 24 (R6)
SXTH	R6, R2
;OLED_096.c,840 :: 		int16_t dp = 1 - radius;
RSB	R4, R2, #1
; dp start address is: 28 (R7)
SXTH	R7, R4
; x0 end address is: 0 (R0)
; y0 end address is: 4 (R1)
; radius end address is: 8 (R2)
; color end address is: 12 (R3)
; x end address is: 20 (R5)
; y end address is: 24 (R6)
; dp end address is: 28 (R7)
SXTH	R9, R0
SXTH	R0, R6
SXTH	R6, R3
SXTH	R3, R5
SXTH	R8, R1
SXTH	R1, R7
SXTH	R7, R2
;OLED_096.c,841 :: 		do {
IT	AL
BAL	L_drawCircle24
L__drawCircle35:
;OLED_096.c,856 :: 		} while (x < y);
SXTH	R1, R12
SXTH	R0, R10
SXTH	R3, R11
;OLED_096.c,841 :: 		do {
L_drawCircle24:
;OLED_096.c,842 :: 		if (dp < 0)
; x0 start address is: 36 (R9)
; y0 start address is: 32 (R8)
; radius start address is: 28 (R7)
; color start address is: 24 (R6)
; dp start address is: 4 (R1)
; y start address is: 0 (R0)
; x start address is: 12 (R3)
; color start address is: 24 (R6)
; color end address is: 24 (R6)
; radius start address is: 28 (R7)
; radius end address is: 28 (R7)
; y0 start address is: 32 (R8)
; y0 end address is: 32 (R8)
; x0 start address is: 36 (R9)
; x0 end address is: 36 (R9)
CMP	R1, #0
IT	GE
BGE	L_drawCircle27
; color end address is: 24 (R6)
; radius end address is: 28 (R7)
; y0 end address is: 32 (R8)
; x0 end address is: 36 (R9)
;OLED_096.c,843 :: 		dp = dp + 2 * (++x) + 3;
; x0 start address is: 36 (R9)
; y0 start address is: 32 (R8)
; radius start address is: 28 (R7)
; color start address is: 24 (R6)
ADDS	R4, R3, #1
SXTH	R4, R4
; x end address is: 12 (R3)
; x start address is: 44 (R11)
SXTH	R11, R4
LSLS	R4, R4, #1
SXTH	R4, R4
ADD	R12, R1, R4, LSL #0
SXTH	R12, R12
; dp end address is: 4 (R1)
ADD	R12, R12, #3
SXTH	R12, R12
; dp start address is: 48 (R12)
; dp end address is: 48 (R12)
; x end address is: 44 (R11)
SXTH	R10, R0
IT	AL
BAL	L_drawCircle28
L_drawCircle27:
;OLED_096.c,845 :: 		dp = dp + 2 * (++x) - 2 * (--y) + 5;
; x start address is: 12 (R3)
; dp start address is: 4 (R1)
ADDS	R4, R3, #1
SXTH	R4, R4
; x end address is: 12 (R3)
; x start address is: 44 (R11)
SXTH	R11, R4
LSLS	R4, R4, #1
SXTH	R4, R4
ADD	R12, R1, R4, LSL #0
SXTH	R12, R12
; dp end address is: 4 (R1)
SUBS	R4, R0, #1
SXTH	R4, R4
; y end address is: 0 (R0)
; y start address is: 40 (R10)
SXTH	R10, R4
LSLS	R4, R4, #1
SXTH	R4, R4
SUB	R12, R12, R4, LSL #0
SXTH	R12, R12
ADD	R12, R12, #5
SXTH	R12, R12
; dp start address is: 48 (R12)
; dp end address is: 48 (R12)
; y end address is: 40 (R10)
; x end address is: 44 (R11)
L_drawCircle28:
;OLED_096.c,847 :: 		OLED_pixel(x0 + x, y0 + y, color);     //For the 8 octants
; dp start address is: 48 (R12)
; y start address is: 40 (R10)
; x start address is: 44 (R11)
ADD	R5, R8, R10, LSL #0
ADD	R4, R9, R11, LSL #0
UXTB	R2, R6
SXTB	R1, R5
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,848 :: 		OLED_pixel(x0 - x, y0 + y, color);
ADD	R5, R8, R10, LSL #0
SUB	R4, R9, R11, LSL #0
UXTB	R2, R6
SXTB	R1, R5
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,849 :: 		OLED_pixel(x0 + x, y0 - y, color);
SUB	R5, R8, R10, LSL #0
ADD	R4, R9, R11, LSL #0
UXTB	R2, R6
SXTB	R1, R5
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,850 :: 		OLED_pixel(x0 - x, y0 - y, color);
SUB	R5, R8, R10, LSL #0
SUB	R4, R9, R11, LSL #0
UXTB	R2, R6
SXTB	R1, R5
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,851 :: 		OLED_pixel(x0 + y, y0 + x, color);
ADD	R5, R8, R11, LSL #0
ADD	R4, R9, R10, LSL #0
UXTB	R2, R6
SXTB	R1, R5
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,852 :: 		OLED_pixel(x0 - y, y0 + x, color);
ADD	R5, R8, R11, LSL #0
SUB	R4, R9, R10, LSL #0
UXTB	R2, R6
SXTB	R1, R5
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,853 :: 		OLED_pixel(x0 + y, y0 - x, color);
SUB	R5, R8, R11, LSL #0
ADD	R4, R9, R10, LSL #0
UXTB	R2, R6
SXTB	R1, R5
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,854 :: 		OLED_pixel(x0 - y, y0 - x, color);
SUB	R5, R8, R11, LSL #0
SUB	R4, R9, R10, LSL #0
UXTB	R2, R6
SXTB	R1, R5
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,856 :: 		} while (x < y);
CMP	R11, R10
IT	LT
BLT	L__drawCircle35
; dp end address is: 48 (R12)
; y end address is: 40 (R10)
; x end address is: 44 (R11)
;OLED_096.c,858 :: 		OLED_pixel(x0 + radius, y0, color);
ADD	R4, R9, R7, LSL #0
UXTB	R2, R6
SXTB	R1, R8
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,859 :: 		OLED_pixel(x0, y0 + radius, color);
ADD	R4, R8, R7, LSL #0
UXTB	R2, R6
SXTB	R1, R4
SXTB	R0, R9
BL	_OLED_pixel+0
;OLED_096.c,860 :: 		OLED_pixel(x0 - radius, y0, color);
SUB	R4, R9, R7, LSL #0
UXTB	R2, R6
SXTB	R1, R8
SXTB	R0, R4
BL	_OLED_pixel+0
;OLED_096.c,861 :: 		OLED_pixel(x0, y0 - radius, color);
SUB	R4, R8, R7, LSL #0
; radius end address is: 28 (R7)
; y0 end address is: 32 (R8)
UXTB	R2, R6
; color end address is: 24 (R6)
SXTB	R1, R4
SXTB	R0, R9
; x0 end address is: 36 (R9)
BL	_OLED_pixel+0
;OLED_096.c,862 :: 		}
L_end_drawCircle:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _drawCircle
_Digitalno_nula:
;OLED_096.c,871 :: 		void Digitalno_nula(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,876 :: 		oledGotoYX(2,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,877 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,878 :: 		oledGotoYX(3,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,879 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,880 :: 		oledGotoYX(4,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,881 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,882 :: 		oledGotoYX(5,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,883 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,885 :: 		oledGotoYX(2,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,886 :: 		oledPutCharDigitalFont(38);
MOVS	R0, #38
BL	_oledPutCharDigitalFont+0
;OLED_096.c,887 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,888 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,889 :: 		oledGotoYX(3,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,890 :: 		oledPutCharDigitalFont(40);
MOVS	R0, #40
BL	_oledPutCharDigitalFont+0
;OLED_096.c,891 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,892 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,893 :: 		oledGotoYX(5,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,894 :: 		oledPutCharDigitalFont(42);
MOVS	R0, #42
BL	_oledPutCharDigitalFont+0
;OLED_096.c,895 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,896 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,897 :: 		oledGotoYX(6,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,898 :: 		oledPutCharDigitalFont(44);
MOVS	R0, #44
BL	_oledPutCharDigitalFont+0
;OLED_096.c,899 :: 		oledGotoYX(6,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,900 :: 		oledPutCharDigitalFont(45);
MOVS	R0, #45
BL	_oledPutCharDigitalFont+0
;OLED_096.c,906 :: 		}
L_end_Digitalno_nula:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_nula
_Digitalno_Jedan:
;OLED_096.c,908 :: 		void Digitalno_Jedan(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,910 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,911 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,912 :: 		oledGotoYX(3,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,913 :: 		oledPutCharDigitalFont(40);
MOVS	R0, #40
BL	_oledPutCharDigitalFont+0
;OLED_096.c,914 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,915 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,916 :: 		oledGotoYX(5,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,917 :: 		oledPutCharDigitalFont(42);
MOVS	R0, #42
BL	_oledPutCharDigitalFont+0
;OLED_096.c,918 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,919 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,920 :: 		}
L_end_Digitalno_Jedan:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_Jedan
_Digitalno_Dva:
;OLED_096.c,922 :: 		void Digitalno_Dva(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,924 :: 		oledGotoYX(2,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,925 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,926 :: 		oledGotoYX(2,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,927 :: 		oledPutCharDigitalFont(38);
MOVS	R0, #38
BL	_oledPutCharDigitalFont+0
;OLED_096.c,928 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,929 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,930 :: 		oledGotoYX(3,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,931 :: 		oledPutCharDigitalFont(40);
MOVS	R0, #40
BL	_oledPutCharDigitalFont+0
;OLED_096.c,932 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,933 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,934 :: 		oledGotoYX(4,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,935 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,936 :: 		oledGotoYX(5,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,937 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,938 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,939 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,940 :: 		oledGotoYX(6,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,941 :: 		oledPutCharDigitalFont(44);
MOVS	R0, #44
BL	_oledPutCharDigitalFont+0
;OLED_096.c,942 :: 		oledGotoYX(6,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,943 :: 		oledPutCharDigitalFont(45);
MOVS	R0, #45
BL	_oledPutCharDigitalFont+0
;OLED_096.c,944 :: 		oledGotoYX(4,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,945 :: 		oledPutCharDigitalFont(46);
MOVS	R0, #46
BL	_oledPutCharDigitalFont+0
;OLED_096.c,946 :: 		}
L_end_Digitalno_Dva:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_Dva
_Digitalno_Tri:
;OLED_096.c,949 :: 		void Digitalno_Tri(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,951 :: 		oledGotoYX(2,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,952 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,953 :: 		oledGotoYX(2,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,954 :: 		oledPutCharDigitalFont(38);
MOVS	R0, #38
BL	_oledPutCharDigitalFont+0
;OLED_096.c,955 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,956 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,957 :: 		oledGotoYX(3,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,958 :: 		oledPutCharDigitalFont(40);
MOVS	R0, #40
BL	_oledPutCharDigitalFont+0
;OLED_096.c,959 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,960 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,961 :: 		oledGotoYX(4,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,962 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,963 :: 		oledGotoYX(5,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,964 :: 		oledPutCharDigitalFont(42);
MOVS	R0, #42
BL	_oledPutCharDigitalFont+0
;OLED_096.c,965 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,966 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,967 :: 		oledGotoYX(6,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,968 :: 		oledPutCharDigitalFont(44);
MOVS	R0, #44
BL	_oledPutCharDigitalFont+0
;OLED_096.c,969 :: 		oledGotoYX(6,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,970 :: 		oledPutCharDigitalFont(45);
MOVS	R0, #45
BL	_oledPutCharDigitalFont+0
;OLED_096.c,971 :: 		oledGotoYX(4,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,972 :: 		oledPutCharDigitalFont(46);
MOVS	R0, #46
BL	_oledPutCharDigitalFont+0
;OLED_096.c,973 :: 		}
L_end_Digitalno_Tri:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_Tri
_Digitalno_Cetiri:
;OLED_096.c,975 :: 		void Digitalno_Cetiri(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,977 :: 		oledGotoYX(2,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,978 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,981 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,982 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,983 :: 		oledGotoYX(3,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,984 :: 		oledPutCharDigitalFont(40);
MOVS	R0, #40
BL	_oledPutCharDigitalFont+0
;OLED_096.c,985 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,986 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,987 :: 		oledGotoYX(4,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,988 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,989 :: 		oledGotoYX(5,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,990 :: 		oledPutCharDigitalFont(42);
MOVS	R0, #42
BL	_oledPutCharDigitalFont+0
;OLED_096.c,991 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,992 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,994 :: 		oledGotoYX(3,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,995 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,997 :: 		oledGotoYX(4,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,998 :: 		oledPutCharDigitalFont(46);
MOVS	R0, #46
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1000 :: 		}
L_end_Digitalno_Cetiri:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_Cetiri
_Digitalno_Pet:
;OLED_096.c,1002 :: 		void Digitalno_Pet(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,1005 :: 		oledGotoYX(2,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1006 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1007 :: 		oledGotoYX(3,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,1008 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1009 :: 		oledGotoYX(4,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1010 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1012 :: 		oledGotoYX(2,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1013 :: 		oledPutCharDigitalFont(38);
MOVS	R0, #38
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1014 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1015 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1017 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1018 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1019 :: 		oledGotoYX(5,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,1020 :: 		oledPutCharDigitalFont(42);
MOVS	R0, #42
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1021 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1022 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1023 :: 		oledGotoYX(6,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1024 :: 		oledPutCharDigitalFont(44);
MOVS	R0, #44
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1025 :: 		oledGotoYX(6,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1026 :: 		oledPutCharDigitalFont(45);
MOVS	R0, #45
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1028 :: 		oledGotoYX(4,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1029 :: 		oledPutCharDigitalFont(46);
MOVS	R0, #46
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1031 :: 		}
L_end_Digitalno_Pet:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_Pet
_Digitalno_Sest:
;OLED_096.c,1033 :: 		void Digitalno_Sest(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,1035 :: 		oledGotoYX(2,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1036 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1037 :: 		oledGotoYX(3,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,1038 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1039 :: 		oledGotoYX(4,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1040 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1042 :: 		oledGotoYX(2,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1043 :: 		oledPutCharDigitalFont(38);
MOVS	R0, #38
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1044 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1045 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1047 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1048 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1049 :: 		oledGotoYX(5,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,1050 :: 		oledPutCharDigitalFont(42);
MOVS	R0, #42
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1051 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1052 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1053 :: 		oledGotoYX(6,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1054 :: 		oledPutCharDigitalFont(44);
MOVS	R0, #44
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1055 :: 		oledGotoYX(6,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1056 :: 		oledPutCharDigitalFont(45);
MOVS	R0, #45
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1057 :: 		oledGotoYX(5,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,1058 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1060 :: 		oledGotoYX(4,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1061 :: 		oledPutCharDigitalFont(46);
MOVS	R0, #46
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1063 :: 		}
L_end_Digitalno_Sest:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_Sest
_Digitalno_Sedam:
;OLED_096.c,1065 :: 		void Digitalno_Sedam(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,1066 :: 		oledGotoYX(2,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1067 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1068 :: 		oledGotoYX(2,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1069 :: 		oledPutCharDigitalFont(38);
MOVS	R0, #38
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1070 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1071 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1072 :: 		oledGotoYX(3,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,1073 :: 		oledPutCharDigitalFont(40);
MOVS	R0, #40
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1074 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1075 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1076 :: 		oledGotoYX(5,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,1077 :: 		oledPutCharDigitalFont(42);
MOVS	R0, #42
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1078 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1079 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1080 :: 		}
L_end_Digitalno_Sedam:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_Sedam
_Digitalno_Osam:
;OLED_096.c,1082 :: 		void Digitalno_Osam(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,1083 :: 		oledGotoYX(2,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1084 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1085 :: 		oledGotoYX(3,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,1086 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1087 :: 		oledGotoYX(4,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1088 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1089 :: 		oledGotoYX(5,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,1090 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1092 :: 		oledGotoYX(2,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1093 :: 		oledPutCharDigitalFont(38);
MOVS	R0, #38
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1094 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1095 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1096 :: 		oledGotoYX(3,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,1097 :: 		oledPutCharDigitalFont(40);
MOVS	R0, #40
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1098 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1099 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1100 :: 		oledGotoYX(5,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,1101 :: 		oledPutCharDigitalFont(42);
MOVS	R0, #42
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1102 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1103 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1104 :: 		oledGotoYX(6,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1105 :: 		oledPutCharDigitalFont(44);
MOVS	R0, #44
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1106 :: 		oledGotoYX(6,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1107 :: 		oledPutCharDigitalFont(45);
MOVS	R0, #45
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1109 :: 		oledGotoYX(4,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1110 :: 		oledPutCharDigitalFont(46);
MOVS	R0, #46
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1112 :: 		}
L_end_Digitalno_Osam:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_Osam
_Digitalno_Devet:
;OLED_096.c,1114 :: 		void Digitalno_Devet(uint8_t pozicija){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;OLED_096.c,1115 :: 		oledGotoYX(2,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1116 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1117 :: 		oledGotoYX(3,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,1118 :: 		oledPutCharDigitalFont(33);
MOVS	R0, #33
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1119 :: 		oledGotoYX(4,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1120 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1123 :: 		oledGotoYX(2,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1124 :: 		oledPutCharDigitalFont(38);
MOVS	R0, #38
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1125 :: 		oledGotoYX(2,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #2
BL	_oledGotoYX+0
;OLED_096.c,1126 :: 		oledPutCharDigitalFont(39);
MOVS	R0, #39
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1127 :: 		oledGotoYX(3,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #3
BL	_oledGotoYX+0
;OLED_096.c,1128 :: 		oledPutCharDigitalFont(40);
MOVS	R0, #40
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1129 :: 		oledGotoYX(4,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1130 :: 		oledPutCharDigitalFont(41);
MOVS	R0, #41
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1131 :: 		oledGotoYX(5,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #5
BL	_oledGotoYX+0
;OLED_096.c,1132 :: 		oledPutCharDigitalFont(42);
MOVS	R0, #42
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1133 :: 		oledGotoYX(6,2+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #2
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1134 :: 		oledPutCharDigitalFont(43);
MOVS	R0, #43
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1135 :: 		oledGotoYX(6,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1136 :: 		oledPutCharDigitalFont(44);
MOVS	R0, #44
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1137 :: 		oledGotoYX(6,pozicija);
LDRB	R1, [SP, #4]
MOVS	R0, #6
BL	_oledGotoYX+0
;OLED_096.c,1138 :: 		oledPutCharDigitalFont(45);
MOVS	R0, #45
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1140 :: 		oledGotoYX(4,1+pozicija);
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
UXTB	R1, R1
MOVS	R0, #4
BL	_oledGotoYX+0
;OLED_096.c,1141 :: 		oledPutCharDigitalFont(46);
MOVS	R0, #46
BL	_oledPutCharDigitalFont+0
;OLED_096.c,1142 :: 		}
L_end_Digitalno_Devet:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Digitalno_Devet
