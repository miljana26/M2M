_Write_to_Data_Lines:
;Kalkulator_driver.c,37 :: 		void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
; _lo start address is: 4 (R1)
; _hi start address is: 0 (R0)
; _lo end address is: 4 (R1)
; _hi end address is: 0 (R0)
; _hi start address is: 0 (R0)
; _lo start address is: 4 (R1)
;Kalkulator_driver.c,38 :: 		GPIOD_PDOR = (unsigned int) (_lo | (_hi << 8));
LSLS	R2, R0, #8
UXTH	R2, R2
; _hi end address is: 0 (R0)
ORR	R3, R1, R2, LSL #0
UXTH	R3, R3
; _lo end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOD_PDOR+0)
MOVT	R2, #hi_addr(GPIOD_PDOR+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,39 :: 		}
L_end_Write_to_Data_Lines:
BX	LR
; end of _Write_to_Data_Lines
_Set_Index:
;Kalkulator_driver.c,41 :: 		void Set_Index(unsigned short index) {
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;Kalkulator_driver.c,42 :: 		TFT_RS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,43 :: 		Write_to_Data_Lines(0, index);
UXTB	R1, R0
; index end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;Kalkulator_driver.c,44 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,45 :: 		asm nop;
NOP
;Kalkulator_driver.c,46 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,47 :: 		}
L_end_Set_Index:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Index
_Write_Command:
;Kalkulator_driver.c,49 :: 		void Write_Command(unsigned short cmd) {
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
;Kalkulator_driver.c,50 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,51 :: 		Write_to_Data_Lines(0, cmd);
UXTB	R1, R0
; cmd end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;Kalkulator_driver.c,52 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,53 :: 		asm nop;
NOP
;Kalkulator_driver.c,54 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,55 :: 		}
L_end_Write_Command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Write_Command
_Write_Data:
;Kalkulator_driver.c,57 :: 		void Write_Data(unsigned int _data) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;Kalkulator_driver.c,58 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,59 :: 		Write_to_Data_Lines(Hi(_data), Lo(_data));
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
UXTB	R2, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTB	R1, R2
BL	_Write_to_Data_Lines+0
;Kalkulator_driver.c,60 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,61 :: 		asm nop;
NOP
;Kalkulator_driver.c,62 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,63 :: 		}
L_end_Write_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Write_Data
Kalkulator_driver_InitializeTouchPanel:
;Kalkulator_driver.c,65 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_driver.c,66 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R2, #lo_addr(_Write_Data+0)
MOVT	R2, #hi_addr(_Write_Data+0)
MOVW	R1, #lo_addr(_Write_Command+0)
MOVT	R1, #hi_addr(_Write_Command+0)
MOVW	R0, #lo_addr(_Set_Index+0)
MOVT	R0, #hi_addr(_Set_Index+0)
BL	_TFT_Set_Active+0
;Kalkulator_driver.c,67 :: 		TFT_Init_SSD1963_Board_50(800, 480);
MOVW	R1, #480
MOVW	R0, #800
BL	_TFT_Init_SSD1963_Board_50+0
;Kalkulator_driver.c,69 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Kalkulator_driver.c,71 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,72 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,73 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,74 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Kalkulator_driver_InitializeTouchPanel
Kalkulator_driver_InitializeObjects:
;Kalkulator_driver.c,192 :: 		static void InitializeObjects() {
;Kalkulator_driver.c,193 :: 		Screen1.Color                     = 0x34D3;
MOVW	R1, #13523
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,194 :: 		Screen1.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,195 :: 		Screen1.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,196 :: 		Screen1.Buttons_RoundCount        = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,197 :: 		Screen1.Buttons_Round             = Screen1_Buttons_Round;
MOVW	R1, #lo_addr(_Screen1_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen1_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen1+12)
MOVT	R0, #hi_addr(_Screen1+12)
STR	R1, [R0, #0]
;Kalkulator_driver.c,198 :: 		Screen1.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,199 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+20)
MOVT	R0, #hi_addr(_Screen1+20)
STR	R1, [R0, #0]
;Kalkulator_driver.c,200 :: 		Screen1.ObjectsCount              = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,201 :: 		Screen1.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STR	R1, [R0, #0]
;Kalkulator_driver.c,202 :: 		Screen1.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+36)
MOVT	R0, #hi_addr(_Screen1+36)
STR	R1, [R0, #0]
;Kalkulator_driver.c,203 :: 		Screen1.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,204 :: 		Screen1.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+28)
MOVT	R0, #hi_addr(_Screen1+28)
STR	R1, [R0, #0]
;Kalkulator_driver.c,205 :: 		Screen1.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+40)
MOVT	R0, #hi_addr(_Screen1+40)
STR	R1, [R0, #0]
;Kalkulator_driver.c,206 :: 		Screen1.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+44)
MOVT	R0, #hi_addr(_Screen1+44)
STR	R1, [R0, #0]
;Kalkulator_driver.c,208 :: 		Screen2.Color                     = 0x366C;
MOVW	R1, #13932
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,209 :: 		Screen2.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,210 :: 		Screen2.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,211 :: 		Screen2.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,212 :: 		Screen2.Buttons_Round             = Screen2_Buttons_Round;
MOVW	R1, #lo_addr(_Screen2_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen2_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen2+12)
MOVT	R0, #hi_addr(_Screen2+12)
STR	R1, [R0, #0]
;Kalkulator_driver.c,213 :: 		Screen2.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+16)
MOVT	R0, #hi_addr(_Screen2+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,214 :: 		Screen2.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,215 :: 		Screen2.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+32)
MOVT	R0, #hi_addr(_Screen2+32)
STR	R1, [R0, #0]
;Kalkulator_driver.c,216 :: 		Screen2.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+36)
MOVT	R0, #hi_addr(_Screen2+36)
STR	R1, [R0, #0]
;Kalkulator_driver.c,217 :: 		Screen2.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+24)
MOVT	R0, #hi_addr(_Screen2+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,218 :: 		Screen2.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+28)
MOVT	R0, #hi_addr(_Screen2+28)
STR	R1, [R0, #0]
;Kalkulator_driver.c,219 :: 		Screen2.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+40)
MOVT	R0, #hi_addr(_Screen2+40)
STR	R1, [R0, #0]
;Kalkulator_driver.c,220 :: 		Screen2.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+44)
MOVT	R0, #hi_addr(_Screen2+44)
STR	R1, [R0, #0]
;Kalkulator_driver.c,222 :: 		Screen3.Color                     = 0xC813;
MOVW	R1, #51219
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,223 :: 		Screen3.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen3+2)
MOVT	R0, #hi_addr(_Screen3+2)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,224 :: 		Screen3.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen3+4)
MOVT	R0, #hi_addr(_Screen3+4)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,225 :: 		Screen3.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+8)
MOVT	R0, #hi_addr(_Screen3+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,226 :: 		Screen3.Buttons_Round             = Screen3_Buttons_Round;
MOVW	R1, #lo_addr(_Screen3_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen3_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen3+12)
MOVT	R0, #hi_addr(_Screen3+12)
STR	R1, [R0, #0]
;Kalkulator_driver.c,227 :: 		Screen3.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+16)
MOVT	R0, #hi_addr(_Screen3+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,228 :: 		Screen3.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+6)
MOVT	R0, #hi_addr(_Screen3+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,229 :: 		Screen3.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+32)
MOVT	R0, #hi_addr(_Screen3+32)
STR	R1, [R0, #0]
;Kalkulator_driver.c,230 :: 		Screen3.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+36)
MOVT	R0, #hi_addr(_Screen3+36)
STR	R1, [R0, #0]
;Kalkulator_driver.c,231 :: 		Screen3.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+24)
MOVT	R0, #hi_addr(_Screen3+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,232 :: 		Screen3.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+28)
MOVT	R0, #hi_addr(_Screen3+28)
STR	R1, [R0, #0]
;Kalkulator_driver.c,233 :: 		Screen3.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+40)
MOVT	R0, #hi_addr(_Screen3+40)
STR	R1, [R0, #0]
;Kalkulator_driver.c,234 :: 		Screen3.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+44)
MOVT	R0, #hi_addr(_Screen3+44)
STR	R1, [R0, #0]
;Kalkulator_driver.c,237 :: 		ButtonRound1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,238 :: 		ButtonRound1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+4)
MOVT	R0, #hi_addr(_ButtonRound1+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,239 :: 		ButtonRound1.Left            = 182;
MOVS	R1, #182
MOVW	R0, #lo_addr(_ButtonRound1+6)
MOVT	R0, #hi_addr(_ButtonRound1+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,240 :: 		ButtonRound1.Top             = 387;
MOVW	R1, #387
MOVW	R0, #lo_addr(_ButtonRound1+8)
MOVT	R0, #hi_addr(_ButtonRound1+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,241 :: 		ButtonRound1.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound1+10)
MOVT	R0, #hi_addr(_ButtonRound1+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,242 :: 		ButtonRound1.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound1+12)
MOVT	R0, #hi_addr(_ButtonRound1+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,243 :: 		ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+14)
MOVT	R0, #hi_addr(_ButtonRound1+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,244 :: 		ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,245 :: 		ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+18)
MOVT	R0, #hi_addr(_ButtonRound1+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,246 :: 		ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+19)
MOVT	R0, #hi_addr(_ButtonRound1+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,247 :: 		ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+20)
MOVT	R0, #hi_addr(_ButtonRound1+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,248 :: 		ButtonRound1.Caption         = ButtonRound1_Caption;
MOVW	R1, #lo_addr(_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound1+24)
MOVT	R0, #hi_addr(_ButtonRound1+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,249 :: 		ButtonRound1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+28)
MOVT	R0, #hi_addr(_ButtonRound1+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,250 :: 		ButtonRound1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+29)
MOVT	R0, #hi_addr(_ButtonRound1+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,251 :: 		ButtonRound1.FontName        = Tahoma11x13_Regular;
MOVW	R2, #lo_addr(_Tahoma11x13_Regular+0)
MOVT	R2, #hi_addr(_Tahoma11x13_Regular+0)
MOVW	R0, #lo_addr(_ButtonRound1+32)
MOVT	R0, #hi_addr(_ButtonRound1+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,252 :: 		ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+49)
MOVT	R0, #hi_addr(_ButtonRound1+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,253 :: 		ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,254 :: 		ButtonRound1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+38)
MOVT	R0, #hi_addr(_ButtonRound1+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,255 :: 		ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+39)
MOVT	R0, #hi_addr(_ButtonRound1+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,256 :: 		ButtonRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+40)
MOVT	R0, #hi_addr(_ButtonRound1+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,257 :: 		ButtonRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+42)
MOVT	R0, #hi_addr(_ButtonRound1+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,258 :: 		ButtonRound1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+44)
MOVT	R0, #hi_addr(_ButtonRound1+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,259 :: 		ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+46)
MOVT	R0, #hi_addr(_ButtonRound1+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,260 :: 		ButtonRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound1+50)
MOVT	R0, #hi_addr(_ButtonRound1+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,261 :: 		ButtonRound1.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound1+48)
MOVT	R0, #hi_addr(_ButtonRound1+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,262 :: 		ButtonRound1.OnClickPtr      = ispis0;
MOVW	R1, #lo_addr(_ispis0+0)
MOVT	R1, #hi_addr(_ispis0+0)
MOVW	R0, #lo_addr(_ButtonRound1+60)
MOVT	R0, #hi_addr(_ButtonRound1+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,264 :: 		ButtonRound2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound2+0)
MOVT	R0, #hi_addr(_ButtonRound2+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,265 :: 		ButtonRound2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+4)
MOVT	R0, #hi_addr(_ButtonRound2+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,266 :: 		ButtonRound2.Left            = 182;
MOVS	R1, #182
MOVW	R0, #lo_addr(_ButtonRound2+6)
MOVT	R0, #hi_addr(_ButtonRound2+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,267 :: 		ButtonRound2.Top             = 316;
MOVW	R1, #316
MOVW	R0, #lo_addr(_ButtonRound2+8)
MOVT	R0, #hi_addr(_ButtonRound2+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,268 :: 		ButtonRound2.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound2+10)
MOVT	R0, #hi_addr(_ButtonRound2+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,269 :: 		ButtonRound2.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound2+12)
MOVT	R0, #hi_addr(_ButtonRound2+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,270 :: 		ButtonRound2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+14)
MOVT	R0, #hi_addr(_ButtonRound2+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,271 :: 		ButtonRound2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,272 :: 		ButtonRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+18)
MOVT	R0, #hi_addr(_ButtonRound2+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,273 :: 		ButtonRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+19)
MOVT	R0, #hi_addr(_ButtonRound2+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,274 :: 		ButtonRound2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+20)
MOVT	R0, #hi_addr(_ButtonRound2+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,275 :: 		ButtonRound2.Caption         = ButtonRound2_Caption;
MOVW	R1, #lo_addr(_ButtonRound2_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound2_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound2+24)
MOVT	R0, #hi_addr(_ButtonRound2+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,276 :: 		ButtonRound2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+28)
MOVT	R0, #hi_addr(_ButtonRound2+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,277 :: 		ButtonRound2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+29)
MOVT	R0, #hi_addr(_ButtonRound2+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,278 :: 		ButtonRound2.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound2+32)
MOVT	R0, #hi_addr(_ButtonRound2+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,279 :: 		ButtonRound2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+49)
MOVT	R0, #hi_addr(_ButtonRound2+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,280 :: 		ButtonRound2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,281 :: 		ButtonRound2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+38)
MOVT	R0, #hi_addr(_ButtonRound2+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,282 :: 		ButtonRound2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+39)
MOVT	R0, #hi_addr(_ButtonRound2+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,283 :: 		ButtonRound2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+40)
MOVT	R0, #hi_addr(_ButtonRound2+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,284 :: 		ButtonRound2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound2+42)
MOVT	R0, #hi_addr(_ButtonRound2+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,285 :: 		ButtonRound2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+44)
MOVT	R0, #hi_addr(_ButtonRound2+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,286 :: 		ButtonRound2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+46)
MOVT	R0, #hi_addr(_ButtonRound2+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,287 :: 		ButtonRound2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound2+50)
MOVT	R0, #hi_addr(_ButtonRound2+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,288 :: 		ButtonRound2.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound2+48)
MOVT	R0, #hi_addr(_ButtonRound2+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,289 :: 		ButtonRound2.OnClickPtr      = ispis1;
MOVW	R1, #lo_addr(_ispis1+0)
MOVT	R1, #hi_addr(_ispis1+0)
MOVW	R0, #lo_addr(_ButtonRound2+60)
MOVT	R0, #hi_addr(_ButtonRound2+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,291 :: 		ButtonRound3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound3+0)
MOVT	R0, #hi_addr(_ButtonRound3+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,292 :: 		ButtonRound3.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_ButtonRound3+4)
MOVT	R0, #hi_addr(_ButtonRound3+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,293 :: 		ButtonRound3.Left            = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_ButtonRound3+6)
MOVT	R0, #hi_addr(_ButtonRound3+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,294 :: 		ButtonRound3.Top             = 316;
MOVW	R1, #316
MOVW	R0, #lo_addr(_ButtonRound3+8)
MOVT	R0, #hi_addr(_ButtonRound3+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,295 :: 		ButtonRound3.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound3+10)
MOVT	R0, #hi_addr(_ButtonRound3+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,296 :: 		ButtonRound3.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound3+12)
MOVT	R0, #hi_addr(_ButtonRound3+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,297 :: 		ButtonRound3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+14)
MOVT	R0, #hi_addr(_ButtonRound3+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,298 :: 		ButtonRound3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+16)
MOVT	R0, #hi_addr(_ButtonRound3+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,299 :: 		ButtonRound3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+18)
MOVT	R0, #hi_addr(_ButtonRound3+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,300 :: 		ButtonRound3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+19)
MOVT	R0, #hi_addr(_ButtonRound3+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,301 :: 		ButtonRound3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+20)
MOVT	R0, #hi_addr(_ButtonRound3+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,302 :: 		ButtonRound3.Caption         = ButtonRound3_Caption;
MOVW	R1, #lo_addr(_ButtonRound3_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound3_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound3+24)
MOVT	R0, #hi_addr(_ButtonRound3+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,303 :: 		ButtonRound3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+28)
MOVT	R0, #hi_addr(_ButtonRound3+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,304 :: 		ButtonRound3.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+29)
MOVT	R0, #hi_addr(_ButtonRound3+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,305 :: 		ButtonRound3.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound3+32)
MOVT	R0, #hi_addr(_ButtonRound3+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,306 :: 		ButtonRound3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+49)
MOVT	R0, #hi_addr(_ButtonRound3+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,307 :: 		ButtonRound3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+36)
MOVT	R0, #hi_addr(_ButtonRound3+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,308 :: 		ButtonRound3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+38)
MOVT	R0, #hi_addr(_ButtonRound3+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,309 :: 		ButtonRound3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+39)
MOVT	R0, #hi_addr(_ButtonRound3+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,310 :: 		ButtonRound3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+40)
MOVT	R0, #hi_addr(_ButtonRound3+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,311 :: 		ButtonRound3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound3+42)
MOVT	R0, #hi_addr(_ButtonRound3+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,312 :: 		ButtonRound3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound3+44)
MOVT	R0, #hi_addr(_ButtonRound3+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,313 :: 		ButtonRound3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound3+46)
MOVT	R0, #hi_addr(_ButtonRound3+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,314 :: 		ButtonRound3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound3+50)
MOVT	R0, #hi_addr(_ButtonRound3+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,315 :: 		ButtonRound3.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound3+48)
MOVT	R0, #hi_addr(_ButtonRound3+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,316 :: 		ButtonRound3.OnClickPtr      = ispis2;
MOVW	R1, #lo_addr(_ispis2+0)
MOVT	R1, #hi_addr(_ispis2+0)
MOVW	R0, #lo_addr(_ButtonRound3+60)
MOVT	R0, #hi_addr(_ButtonRound3+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,318 :: 		ButtonRound4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound4+0)
MOVT	R0, #hi_addr(_ButtonRound4+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,319 :: 		ButtonRound4.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound4+4)
MOVT	R0, #hi_addr(_ButtonRound4+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,320 :: 		ButtonRound4.Left            = 358;
MOVW	R1, #358
MOVW	R0, #lo_addr(_ButtonRound4+6)
MOVT	R0, #hi_addr(_ButtonRound4+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,321 :: 		ButtonRound4.Top             = 316;
MOVW	R1, #316
MOVW	R0, #lo_addr(_ButtonRound4+8)
MOVT	R0, #hi_addr(_ButtonRound4+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,322 :: 		ButtonRound4.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound4+10)
MOVT	R0, #hi_addr(_ButtonRound4+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,323 :: 		ButtonRound4.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound4+12)
MOVT	R0, #hi_addr(_ButtonRound4+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,324 :: 		ButtonRound4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+14)
MOVT	R0, #hi_addr(_ButtonRound4+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,325 :: 		ButtonRound4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+16)
MOVT	R0, #hi_addr(_ButtonRound4+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,326 :: 		ButtonRound4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+18)
MOVT	R0, #hi_addr(_ButtonRound4+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,327 :: 		ButtonRound4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+19)
MOVT	R0, #hi_addr(_ButtonRound4+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,328 :: 		ButtonRound4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+20)
MOVT	R0, #hi_addr(_ButtonRound4+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,329 :: 		ButtonRound4.Caption         = ButtonRound4_Caption;
MOVW	R1, #lo_addr(_ButtonRound4_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound4_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound4+24)
MOVT	R0, #hi_addr(_ButtonRound4+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,330 :: 		ButtonRound4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+28)
MOVT	R0, #hi_addr(_ButtonRound4+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,331 :: 		ButtonRound4.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+29)
MOVT	R0, #hi_addr(_ButtonRound4+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,332 :: 		ButtonRound4.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound4+32)
MOVT	R0, #hi_addr(_ButtonRound4+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,333 :: 		ButtonRound4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+49)
MOVT	R0, #hi_addr(_ButtonRound4+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,334 :: 		ButtonRound4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+36)
MOVT	R0, #hi_addr(_ButtonRound4+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,335 :: 		ButtonRound4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+38)
MOVT	R0, #hi_addr(_ButtonRound4+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,336 :: 		ButtonRound4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+39)
MOVT	R0, #hi_addr(_ButtonRound4+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,337 :: 		ButtonRound4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+40)
MOVT	R0, #hi_addr(_ButtonRound4+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,338 :: 		ButtonRound4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound4+42)
MOVT	R0, #hi_addr(_ButtonRound4+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,339 :: 		ButtonRound4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound4+44)
MOVT	R0, #hi_addr(_ButtonRound4+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,340 :: 		ButtonRound4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound4+46)
MOVT	R0, #hi_addr(_ButtonRound4+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,341 :: 		ButtonRound4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound4+50)
MOVT	R0, #hi_addr(_ButtonRound4+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,342 :: 		ButtonRound4.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound4+48)
MOVT	R0, #hi_addr(_ButtonRound4+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,343 :: 		ButtonRound4.OnClickPtr      = ispis3;
MOVW	R1, #lo_addr(_ispis3+0)
MOVT	R1, #hi_addr(_ispis3+0)
MOVW	R0, #lo_addr(_ButtonRound4+60)
MOVT	R0, #hi_addr(_ButtonRound4+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,345 :: 		ButtonRound5.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound5+0)
MOVT	R0, #hi_addr(_ButtonRound5+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,346 :: 		ButtonRound5.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_ButtonRound5+4)
MOVT	R0, #hi_addr(_ButtonRound5+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,347 :: 		ButtonRound5.Left            = 271;
MOVW	R1, #271
MOVW	R0, #lo_addr(_ButtonRound5+6)
MOVT	R0, #hi_addr(_ButtonRound5+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,348 :: 		ButtonRound5.Top             = 388;
MOVW	R1, #388
MOVW	R0, #lo_addr(_ButtonRound5+8)
MOVT	R0, #hi_addr(_ButtonRound5+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,349 :: 		ButtonRound5.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound5+10)
MOVT	R0, #hi_addr(_ButtonRound5+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,350 :: 		ButtonRound5.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound5+12)
MOVT	R0, #hi_addr(_ButtonRound5+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,351 :: 		ButtonRound5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+14)
MOVT	R0, #hi_addr(_ButtonRound5+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,352 :: 		ButtonRound5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+16)
MOVT	R0, #hi_addr(_ButtonRound5+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,353 :: 		ButtonRound5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+18)
MOVT	R0, #hi_addr(_ButtonRound5+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,354 :: 		ButtonRound5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+19)
MOVT	R0, #hi_addr(_ButtonRound5+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,355 :: 		ButtonRound5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+20)
MOVT	R0, #hi_addr(_ButtonRound5+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,356 :: 		ButtonRound5.Caption         = ButtonRound5_Caption;
MOVW	R1, #lo_addr(_ButtonRound5_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound5_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound5+24)
MOVT	R0, #hi_addr(_ButtonRound5+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,357 :: 		ButtonRound5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+28)
MOVT	R0, #hi_addr(_ButtonRound5+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,358 :: 		ButtonRound5.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+29)
MOVT	R0, #hi_addr(_ButtonRound5+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,359 :: 		ButtonRound5.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound5+32)
MOVT	R0, #hi_addr(_ButtonRound5+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,360 :: 		ButtonRound5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+49)
MOVT	R0, #hi_addr(_ButtonRound5+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,361 :: 		ButtonRound5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+36)
MOVT	R0, #hi_addr(_ButtonRound5+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,362 :: 		ButtonRound5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+38)
MOVT	R0, #hi_addr(_ButtonRound5+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,363 :: 		ButtonRound5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+39)
MOVT	R0, #hi_addr(_ButtonRound5+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,364 :: 		ButtonRound5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+40)
MOVT	R0, #hi_addr(_ButtonRound5+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,365 :: 		ButtonRound5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound5+42)
MOVT	R0, #hi_addr(_ButtonRound5+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,366 :: 		ButtonRound5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound5+44)
MOVT	R0, #hi_addr(_ButtonRound5+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,367 :: 		ButtonRound5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound5+46)
MOVT	R0, #hi_addr(_ButtonRound5+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,368 :: 		ButtonRound5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound5+50)
MOVT	R0, #hi_addr(_ButtonRound5+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,369 :: 		ButtonRound5.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound5+48)
MOVT	R0, #hi_addr(_ButtonRound5+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,370 :: 		ButtonRound5.OnClickPtr      = ispis_tacke;
MOVW	R1, #lo_addr(_ispis_tacke+0)
MOVT	R1, #hi_addr(_ispis_tacke+0)
MOVW	R0, #lo_addr(_ButtonRound5+60)
MOVT	R0, #hi_addr(_ButtonRound5+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,372 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,373 :: 		Label1.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,374 :: 		Label1.Left            = 186;
MOVS	R1, #186
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,375 :: 		Label1.Top             = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,376 :: 		Label1.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,377 :: 		Label1.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,378 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,379 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,380 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_driver.c,381 :: 		Label1.FontName        = Tahoma39x48_Regular;
MOVW	R1, #lo_addr(_Tahoma39x48_Regular+0)
MOVT	R1, #hi_addr(_Tahoma39x48_Regular+0)
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R1, [R0, #0]
;Kalkulator_driver.c,382 :: 		Label1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,383 :: 		Label1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,385 :: 		ButtonRound8.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound8+0)
MOVT	R0, #hi_addr(_ButtonRound8+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,386 :: 		ButtonRound8.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_ButtonRound8+4)
MOVT	R0, #hi_addr(_ButtonRound8+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,387 :: 		ButtonRound8.Left            = 182;
MOVS	R1, #182
MOVW	R0, #lo_addr(_ButtonRound8+6)
MOVT	R0, #hi_addr(_ButtonRound8+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,388 :: 		ButtonRound8.Top             = 246;
MOVS	R1, #246
MOVW	R0, #lo_addr(_ButtonRound8+8)
MOVT	R0, #hi_addr(_ButtonRound8+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,389 :: 		ButtonRound8.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound8+10)
MOVT	R0, #hi_addr(_ButtonRound8+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,390 :: 		ButtonRound8.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound8+12)
MOVT	R0, #hi_addr(_ButtonRound8+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,391 :: 		ButtonRound8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+14)
MOVT	R0, #hi_addr(_ButtonRound8+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,392 :: 		ButtonRound8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+16)
MOVT	R0, #hi_addr(_ButtonRound8+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,393 :: 		ButtonRound8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+18)
MOVT	R0, #hi_addr(_ButtonRound8+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,394 :: 		ButtonRound8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+19)
MOVT	R0, #hi_addr(_ButtonRound8+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,395 :: 		ButtonRound8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+20)
MOVT	R0, #hi_addr(_ButtonRound8+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,396 :: 		ButtonRound8.Caption         = ButtonRound8_Caption;
MOVW	R1, #lo_addr(_ButtonRound8_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound8_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound8+24)
MOVT	R0, #hi_addr(_ButtonRound8+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,397 :: 		ButtonRound8.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+28)
MOVT	R0, #hi_addr(_ButtonRound8+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,398 :: 		ButtonRound8.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+29)
MOVT	R0, #hi_addr(_ButtonRound8+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,399 :: 		ButtonRound8.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound8+32)
MOVT	R0, #hi_addr(_ButtonRound8+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,400 :: 		ButtonRound8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+49)
MOVT	R0, #hi_addr(_ButtonRound8+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,401 :: 		ButtonRound8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+36)
MOVT	R0, #hi_addr(_ButtonRound8+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,402 :: 		ButtonRound8.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+38)
MOVT	R0, #hi_addr(_ButtonRound8+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,403 :: 		ButtonRound8.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+39)
MOVT	R0, #hi_addr(_ButtonRound8+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,404 :: 		ButtonRound8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+40)
MOVT	R0, #hi_addr(_ButtonRound8+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,405 :: 		ButtonRound8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound8+42)
MOVT	R0, #hi_addr(_ButtonRound8+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,406 :: 		ButtonRound8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound8+44)
MOVT	R0, #hi_addr(_ButtonRound8+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,407 :: 		ButtonRound8.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound8+46)
MOVT	R0, #hi_addr(_ButtonRound8+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,408 :: 		ButtonRound8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound8+50)
MOVT	R0, #hi_addr(_ButtonRound8+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,409 :: 		ButtonRound8.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound8+48)
MOVT	R0, #hi_addr(_ButtonRound8+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,410 :: 		ButtonRound8.OnClickPtr      = ispis4;
MOVW	R1, #lo_addr(_ispis4+0)
MOVT	R1, #hi_addr(_ispis4+0)
MOVW	R0, #lo_addr(_ButtonRound8+60)
MOVT	R0, #hi_addr(_ButtonRound8+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,412 :: 		ButtonRound9.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound9+0)
MOVT	R0, #hi_addr(_ButtonRound9+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,413 :: 		ButtonRound9.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_ButtonRound9+4)
MOVT	R0, #hi_addr(_ButtonRound9+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,414 :: 		ButtonRound9.Left            = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_ButtonRound9+6)
MOVT	R0, #hi_addr(_ButtonRound9+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,415 :: 		ButtonRound9.Top             = 246;
MOVS	R1, #246
MOVW	R0, #lo_addr(_ButtonRound9+8)
MOVT	R0, #hi_addr(_ButtonRound9+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,416 :: 		ButtonRound9.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound9+10)
MOVT	R0, #hi_addr(_ButtonRound9+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,417 :: 		ButtonRound9.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound9+12)
MOVT	R0, #hi_addr(_ButtonRound9+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,418 :: 		ButtonRound9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+14)
MOVT	R0, #hi_addr(_ButtonRound9+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,419 :: 		ButtonRound9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+16)
MOVT	R0, #hi_addr(_ButtonRound9+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,420 :: 		ButtonRound9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+18)
MOVT	R0, #hi_addr(_ButtonRound9+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,421 :: 		ButtonRound9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+19)
MOVT	R0, #hi_addr(_ButtonRound9+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,422 :: 		ButtonRound9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+20)
MOVT	R0, #hi_addr(_ButtonRound9+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,423 :: 		ButtonRound9.Caption         = ButtonRound9_Caption;
MOVW	R1, #lo_addr(_ButtonRound9_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound9_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound9+24)
MOVT	R0, #hi_addr(_ButtonRound9+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,424 :: 		ButtonRound9.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+28)
MOVT	R0, #hi_addr(_ButtonRound9+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,425 :: 		ButtonRound9.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+29)
MOVT	R0, #hi_addr(_ButtonRound9+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,426 :: 		ButtonRound9.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound9+32)
MOVT	R0, #hi_addr(_ButtonRound9+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,427 :: 		ButtonRound9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+49)
MOVT	R0, #hi_addr(_ButtonRound9+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,428 :: 		ButtonRound9.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+36)
MOVT	R0, #hi_addr(_ButtonRound9+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,429 :: 		ButtonRound9.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+38)
MOVT	R0, #hi_addr(_ButtonRound9+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,430 :: 		ButtonRound9.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+39)
MOVT	R0, #hi_addr(_ButtonRound9+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,431 :: 		ButtonRound9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+40)
MOVT	R0, #hi_addr(_ButtonRound9+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,432 :: 		ButtonRound9.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound9+42)
MOVT	R0, #hi_addr(_ButtonRound9+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,433 :: 		ButtonRound9.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound9+44)
MOVT	R0, #hi_addr(_ButtonRound9+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,434 :: 		ButtonRound9.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound9+46)
MOVT	R0, #hi_addr(_ButtonRound9+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,435 :: 		ButtonRound9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound9+50)
MOVT	R0, #hi_addr(_ButtonRound9+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,436 :: 		ButtonRound9.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound9+48)
MOVT	R0, #hi_addr(_ButtonRound9+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,437 :: 		ButtonRound9.OnClickPtr      = ispis5;
MOVW	R1, #lo_addr(_ispis5+0)
MOVT	R1, #hi_addr(_ispis5+0)
MOVW	R0, #lo_addr(_ButtonRound9+60)
MOVT	R0, #hi_addr(_ButtonRound9+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,439 :: 		ButtonRound10.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound10+0)
MOVT	R0, #hi_addr(_ButtonRound10+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,440 :: 		ButtonRound10.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_ButtonRound10+4)
MOVT	R0, #hi_addr(_ButtonRound10+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,441 :: 		ButtonRound10.Left            = 358;
MOVW	R1, #358
MOVW	R0, #lo_addr(_ButtonRound10+6)
MOVT	R0, #hi_addr(_ButtonRound10+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,442 :: 		ButtonRound10.Top             = 246;
MOVS	R1, #246
MOVW	R0, #lo_addr(_ButtonRound10+8)
MOVT	R0, #hi_addr(_ButtonRound10+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,443 :: 		ButtonRound10.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound10+10)
MOVT	R0, #hi_addr(_ButtonRound10+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,444 :: 		ButtonRound10.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound10+12)
MOVT	R0, #hi_addr(_ButtonRound10+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,445 :: 		ButtonRound10.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+14)
MOVT	R0, #hi_addr(_ButtonRound10+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,446 :: 		ButtonRound10.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound10+16)
MOVT	R0, #hi_addr(_ButtonRound10+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,447 :: 		ButtonRound10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+18)
MOVT	R0, #hi_addr(_ButtonRound10+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,448 :: 		ButtonRound10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+19)
MOVT	R0, #hi_addr(_ButtonRound10+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,449 :: 		ButtonRound10.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+20)
MOVT	R0, #hi_addr(_ButtonRound10+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,450 :: 		ButtonRound10.Caption         = ButtonRound10_Caption;
MOVW	R1, #lo_addr(_ButtonRound10_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound10_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound10+24)
MOVT	R0, #hi_addr(_ButtonRound10+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,451 :: 		ButtonRound10.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+28)
MOVT	R0, #hi_addr(_ButtonRound10+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,452 :: 		ButtonRound10.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+29)
MOVT	R0, #hi_addr(_ButtonRound10+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,453 :: 		ButtonRound10.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound10+32)
MOVT	R0, #hi_addr(_ButtonRound10+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,454 :: 		ButtonRound10.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+49)
MOVT	R0, #hi_addr(_ButtonRound10+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,455 :: 		ButtonRound10.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound10+36)
MOVT	R0, #hi_addr(_ButtonRound10+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,456 :: 		ButtonRound10.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound10+38)
MOVT	R0, #hi_addr(_ButtonRound10+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,457 :: 		ButtonRound10.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+39)
MOVT	R0, #hi_addr(_ButtonRound10+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,458 :: 		ButtonRound10.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound10+40)
MOVT	R0, #hi_addr(_ButtonRound10+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,459 :: 		ButtonRound10.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound10+42)
MOVT	R0, #hi_addr(_ButtonRound10+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,460 :: 		ButtonRound10.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound10+44)
MOVT	R0, #hi_addr(_ButtonRound10+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,461 :: 		ButtonRound10.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound10+46)
MOVT	R0, #hi_addr(_ButtonRound10+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,462 :: 		ButtonRound10.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound10+50)
MOVT	R0, #hi_addr(_ButtonRound10+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,463 :: 		ButtonRound10.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound10+48)
MOVT	R0, #hi_addr(_ButtonRound10+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,464 :: 		ButtonRound10.OnClickPtr      = ispis6;
MOVW	R1, #lo_addr(_ispis6+0)
MOVT	R1, #hi_addr(_ispis6+0)
MOVW	R0, #lo_addr(_ButtonRound10+60)
MOVT	R0, #hi_addr(_ButtonRound10+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,466 :: 		ButtonRound11.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound11+0)
MOVT	R0, #hi_addr(_ButtonRound11+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,467 :: 		ButtonRound11.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_ButtonRound11+4)
MOVT	R0, #hi_addr(_ButtonRound11+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,468 :: 		ButtonRound11.Left            = 182;
MOVS	R1, #182
MOVW	R0, #lo_addr(_ButtonRound11+6)
MOVT	R0, #hi_addr(_ButtonRound11+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,469 :: 		ButtonRound11.Top             = 175;
MOVS	R1, #175
MOVW	R0, #lo_addr(_ButtonRound11+8)
MOVT	R0, #hi_addr(_ButtonRound11+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,470 :: 		ButtonRound11.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound11+10)
MOVT	R0, #hi_addr(_ButtonRound11+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,471 :: 		ButtonRound11.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound11+12)
MOVT	R0, #hi_addr(_ButtonRound11+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,472 :: 		ButtonRound11.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+14)
MOVT	R0, #hi_addr(_ButtonRound11+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,473 :: 		ButtonRound11.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound11+16)
MOVT	R0, #hi_addr(_ButtonRound11+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,474 :: 		ButtonRound11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+18)
MOVT	R0, #hi_addr(_ButtonRound11+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,475 :: 		ButtonRound11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+19)
MOVT	R0, #hi_addr(_ButtonRound11+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,476 :: 		ButtonRound11.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+20)
MOVT	R0, #hi_addr(_ButtonRound11+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,477 :: 		ButtonRound11.Caption         = ButtonRound11_Caption;
MOVW	R1, #lo_addr(_ButtonRound11_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound11_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound11+24)
MOVT	R0, #hi_addr(_ButtonRound11+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,478 :: 		ButtonRound11.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+28)
MOVT	R0, #hi_addr(_ButtonRound11+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,479 :: 		ButtonRound11.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+29)
MOVT	R0, #hi_addr(_ButtonRound11+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,480 :: 		ButtonRound11.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound11+32)
MOVT	R0, #hi_addr(_ButtonRound11+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,481 :: 		ButtonRound11.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+49)
MOVT	R0, #hi_addr(_ButtonRound11+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,482 :: 		ButtonRound11.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound11+36)
MOVT	R0, #hi_addr(_ButtonRound11+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,483 :: 		ButtonRound11.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound11+38)
MOVT	R0, #hi_addr(_ButtonRound11+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,484 :: 		ButtonRound11.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+39)
MOVT	R0, #hi_addr(_ButtonRound11+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,485 :: 		ButtonRound11.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound11+40)
MOVT	R0, #hi_addr(_ButtonRound11+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,486 :: 		ButtonRound11.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound11+42)
MOVT	R0, #hi_addr(_ButtonRound11+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,487 :: 		ButtonRound11.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound11+44)
MOVT	R0, #hi_addr(_ButtonRound11+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,488 :: 		ButtonRound11.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound11+46)
MOVT	R0, #hi_addr(_ButtonRound11+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,489 :: 		ButtonRound11.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound11+50)
MOVT	R0, #hi_addr(_ButtonRound11+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,490 :: 		ButtonRound11.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound11+48)
MOVT	R0, #hi_addr(_ButtonRound11+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,491 :: 		ButtonRound11.OnClickPtr      = ispis7;
MOVW	R1, #lo_addr(_ispis7+0)
MOVT	R1, #hi_addr(_ispis7+0)
MOVW	R0, #lo_addr(_ButtonRound11+60)
MOVT	R0, #hi_addr(_ButtonRound11+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,493 :: 		ButtonRound12.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound12+0)
MOVT	R0, #hi_addr(_ButtonRound12+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,494 :: 		ButtonRound12.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_ButtonRound12+4)
MOVT	R0, #hi_addr(_ButtonRound12+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,495 :: 		ButtonRound12.Left            = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_ButtonRound12+6)
MOVT	R0, #hi_addr(_ButtonRound12+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,496 :: 		ButtonRound12.Top             = 175;
MOVS	R1, #175
MOVW	R0, #lo_addr(_ButtonRound12+8)
MOVT	R0, #hi_addr(_ButtonRound12+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,497 :: 		ButtonRound12.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound12+10)
MOVT	R0, #hi_addr(_ButtonRound12+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,498 :: 		ButtonRound12.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound12+12)
MOVT	R0, #hi_addr(_ButtonRound12+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,499 :: 		ButtonRound12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+14)
MOVT	R0, #hi_addr(_ButtonRound12+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,500 :: 		ButtonRound12.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound12+16)
MOVT	R0, #hi_addr(_ButtonRound12+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,501 :: 		ButtonRound12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+18)
MOVT	R0, #hi_addr(_ButtonRound12+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,502 :: 		ButtonRound12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+19)
MOVT	R0, #hi_addr(_ButtonRound12+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,503 :: 		ButtonRound12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+20)
MOVT	R0, #hi_addr(_ButtonRound12+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,504 :: 		ButtonRound12.Caption         = ButtonRound12_Caption;
MOVW	R1, #lo_addr(_ButtonRound12_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound12_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound12+24)
MOVT	R0, #hi_addr(_ButtonRound12+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,505 :: 		ButtonRound12.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+28)
MOVT	R0, #hi_addr(_ButtonRound12+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,506 :: 		ButtonRound12.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+29)
MOVT	R0, #hi_addr(_ButtonRound12+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,507 :: 		ButtonRound12.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound12+32)
MOVT	R0, #hi_addr(_ButtonRound12+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,508 :: 		ButtonRound12.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+49)
MOVT	R0, #hi_addr(_ButtonRound12+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,509 :: 		ButtonRound12.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound12+36)
MOVT	R0, #hi_addr(_ButtonRound12+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,510 :: 		ButtonRound12.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound12+38)
MOVT	R0, #hi_addr(_ButtonRound12+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,511 :: 		ButtonRound12.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+39)
MOVT	R0, #hi_addr(_ButtonRound12+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,512 :: 		ButtonRound12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound12+40)
MOVT	R0, #hi_addr(_ButtonRound12+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,513 :: 		ButtonRound12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound12+42)
MOVT	R0, #hi_addr(_ButtonRound12+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,514 :: 		ButtonRound12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound12+44)
MOVT	R0, #hi_addr(_ButtonRound12+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,515 :: 		ButtonRound12.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound12+46)
MOVT	R0, #hi_addr(_ButtonRound12+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,516 :: 		ButtonRound12.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound12+50)
MOVT	R0, #hi_addr(_ButtonRound12+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,517 :: 		ButtonRound12.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound12+48)
MOVT	R0, #hi_addr(_ButtonRound12+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,518 :: 		ButtonRound12.OnClickPtr      = ispis8;
MOVW	R1, #lo_addr(_ispis8+0)
MOVT	R1, #hi_addr(_ispis8+0)
MOVW	R0, #lo_addr(_ButtonRound12+60)
MOVT	R0, #hi_addr(_ButtonRound12+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,520 :: 		ButtonRound13.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound13+0)
MOVT	R0, #hi_addr(_ButtonRound13+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,521 :: 		ButtonRound13.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_ButtonRound13+4)
MOVT	R0, #hi_addr(_ButtonRound13+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,522 :: 		ButtonRound13.Left            = 358;
MOVW	R1, #358
MOVW	R0, #lo_addr(_ButtonRound13+6)
MOVT	R0, #hi_addr(_ButtonRound13+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,523 :: 		ButtonRound13.Top             = 175;
MOVS	R1, #175
MOVW	R0, #lo_addr(_ButtonRound13+8)
MOVT	R0, #hi_addr(_ButtonRound13+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,524 :: 		ButtonRound13.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound13+10)
MOVT	R0, #hi_addr(_ButtonRound13+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,525 :: 		ButtonRound13.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound13+12)
MOVT	R0, #hi_addr(_ButtonRound13+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,526 :: 		ButtonRound13.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+14)
MOVT	R0, #hi_addr(_ButtonRound13+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,527 :: 		ButtonRound13.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound13+16)
MOVT	R0, #hi_addr(_ButtonRound13+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,528 :: 		ButtonRound13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+18)
MOVT	R0, #hi_addr(_ButtonRound13+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,529 :: 		ButtonRound13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+19)
MOVT	R0, #hi_addr(_ButtonRound13+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,530 :: 		ButtonRound13.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+20)
MOVT	R0, #hi_addr(_ButtonRound13+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,531 :: 		ButtonRound13.Caption         = ButtonRound13_Caption;
MOVW	R1, #lo_addr(_ButtonRound13_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound13_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound13+24)
MOVT	R0, #hi_addr(_ButtonRound13+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,532 :: 		ButtonRound13.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+28)
MOVT	R0, #hi_addr(_ButtonRound13+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,533 :: 		ButtonRound13.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+29)
MOVT	R0, #hi_addr(_ButtonRound13+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,534 :: 		ButtonRound13.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound13+32)
MOVT	R0, #hi_addr(_ButtonRound13+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,535 :: 		ButtonRound13.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+49)
MOVT	R0, #hi_addr(_ButtonRound13+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,536 :: 		ButtonRound13.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound13+36)
MOVT	R0, #hi_addr(_ButtonRound13+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,537 :: 		ButtonRound13.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound13+38)
MOVT	R0, #hi_addr(_ButtonRound13+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,538 :: 		ButtonRound13.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+39)
MOVT	R0, #hi_addr(_ButtonRound13+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,539 :: 		ButtonRound13.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound13+40)
MOVT	R0, #hi_addr(_ButtonRound13+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,540 :: 		ButtonRound13.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound13+42)
MOVT	R0, #hi_addr(_ButtonRound13+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,541 :: 		ButtonRound13.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound13+44)
MOVT	R0, #hi_addr(_ButtonRound13+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,542 :: 		ButtonRound13.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound13+46)
MOVT	R0, #hi_addr(_ButtonRound13+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,543 :: 		ButtonRound13.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound13+50)
MOVT	R0, #hi_addr(_ButtonRound13+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,544 :: 		ButtonRound13.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound13+48)
MOVT	R0, #hi_addr(_ButtonRound13+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,545 :: 		ButtonRound13.OnClickPtr      = ispis9;
MOVW	R1, #lo_addr(_ispis9+0)
MOVT	R1, #hi_addr(_ispis9+0)
MOVW	R0, #lo_addr(_ButtonRound13+60)
MOVT	R0, #hi_addr(_ButtonRound13+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,547 :: 		ButtonRound14.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound14+0)
MOVT	R0, #hi_addr(_ButtonRound14+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,548 :: 		ButtonRound14.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_ButtonRound14+4)
MOVT	R0, #hi_addr(_ButtonRound14+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,549 :: 		ButtonRound14.Left            = 446;
MOVW	R1, #446
MOVW	R0, #lo_addr(_ButtonRound14+6)
MOVT	R0, #hi_addr(_ButtonRound14+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,550 :: 		ButtonRound14.Top             = 175;
MOVS	R1, #175
MOVW	R0, #lo_addr(_ButtonRound14+8)
MOVT	R0, #hi_addr(_ButtonRound14+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,551 :: 		ButtonRound14.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound14+10)
MOVT	R0, #hi_addr(_ButtonRound14+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,552 :: 		ButtonRound14.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound14+12)
MOVT	R0, #hi_addr(_ButtonRound14+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,553 :: 		ButtonRound14.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+14)
MOVT	R0, #hi_addr(_ButtonRound14+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,554 :: 		ButtonRound14.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound14+16)
MOVT	R0, #hi_addr(_ButtonRound14+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,555 :: 		ButtonRound14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+18)
MOVT	R0, #hi_addr(_ButtonRound14+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,556 :: 		ButtonRound14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+19)
MOVT	R0, #hi_addr(_ButtonRound14+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,557 :: 		ButtonRound14.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+20)
MOVT	R0, #hi_addr(_ButtonRound14+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,558 :: 		ButtonRound14.Caption         = ButtonRound14_Caption;
MOVW	R1, #lo_addr(_ButtonRound14_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound14_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound14+24)
MOVT	R0, #hi_addr(_ButtonRound14+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,559 :: 		ButtonRound14.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+28)
MOVT	R0, #hi_addr(_ButtonRound14+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,560 :: 		ButtonRound14.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+29)
MOVT	R0, #hi_addr(_ButtonRound14+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,561 :: 		ButtonRound14.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound14+32)
MOVT	R0, #hi_addr(_ButtonRound14+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,562 :: 		ButtonRound14.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+49)
MOVT	R0, #hi_addr(_ButtonRound14+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,563 :: 		ButtonRound14.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound14+36)
MOVT	R0, #hi_addr(_ButtonRound14+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,564 :: 		ButtonRound14.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound14+38)
MOVT	R0, #hi_addr(_ButtonRound14+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,565 :: 		ButtonRound14.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+39)
MOVT	R0, #hi_addr(_ButtonRound14+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,566 :: 		ButtonRound14.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound14+40)
MOVT	R0, #hi_addr(_ButtonRound14+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,567 :: 		ButtonRound14.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound14+42)
MOVT	R0, #hi_addr(_ButtonRound14+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,568 :: 		ButtonRound14.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound14+44)
MOVT	R0, #hi_addr(_ButtonRound14+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,569 :: 		ButtonRound14.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound14+46)
MOVT	R0, #hi_addr(_ButtonRound14+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,570 :: 		ButtonRound14.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound14+50)
MOVT	R0, #hi_addr(_ButtonRound14+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,571 :: 		ButtonRound14.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound14+48)
MOVT	R0, #hi_addr(_ButtonRound14+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,572 :: 		ButtonRound14.OnClickPtr      = ispis_plus;
MOVW	R1, #lo_addr(_ispis_plus+0)
MOVT	R1, #hi_addr(_ispis_plus+0)
MOVW	R0, #lo_addr(_ButtonRound14+60)
MOVT	R0, #hi_addr(_ButtonRound14+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,574 :: 		ButtonRound15.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound15+0)
MOVT	R0, #hi_addr(_ButtonRound15+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,575 :: 		ButtonRound15.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound15+4)
MOVT	R0, #hi_addr(_ButtonRound15+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,576 :: 		ButtonRound15.Left            = 446;
MOVW	R1, #446
MOVW	R0, #lo_addr(_ButtonRound15+6)
MOVT	R0, #hi_addr(_ButtonRound15+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,577 :: 		ButtonRound15.Top             = 246;
MOVS	R1, #246
MOVW	R0, #lo_addr(_ButtonRound15+8)
MOVT	R0, #hi_addr(_ButtonRound15+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,578 :: 		ButtonRound15.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound15+10)
MOVT	R0, #hi_addr(_ButtonRound15+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,579 :: 		ButtonRound15.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound15+12)
MOVT	R0, #hi_addr(_ButtonRound15+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,580 :: 		ButtonRound15.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+14)
MOVT	R0, #hi_addr(_ButtonRound15+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,581 :: 		ButtonRound15.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound15+16)
MOVT	R0, #hi_addr(_ButtonRound15+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,582 :: 		ButtonRound15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+18)
MOVT	R0, #hi_addr(_ButtonRound15+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,583 :: 		ButtonRound15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+19)
MOVT	R0, #hi_addr(_ButtonRound15+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,584 :: 		ButtonRound15.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+20)
MOVT	R0, #hi_addr(_ButtonRound15+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,585 :: 		ButtonRound15.Caption         = ButtonRound15_Caption;
MOVW	R1, #lo_addr(_ButtonRound15_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound15_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound15+24)
MOVT	R0, #hi_addr(_ButtonRound15+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,586 :: 		ButtonRound15.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+28)
MOVT	R0, #hi_addr(_ButtonRound15+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,587 :: 		ButtonRound15.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+29)
MOVT	R0, #hi_addr(_ButtonRound15+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,588 :: 		ButtonRound15.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound15+32)
MOVT	R0, #hi_addr(_ButtonRound15+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,589 :: 		ButtonRound15.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+49)
MOVT	R0, #hi_addr(_ButtonRound15+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,590 :: 		ButtonRound15.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound15+36)
MOVT	R0, #hi_addr(_ButtonRound15+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,591 :: 		ButtonRound15.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound15+38)
MOVT	R0, #hi_addr(_ButtonRound15+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,592 :: 		ButtonRound15.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+39)
MOVT	R0, #hi_addr(_ButtonRound15+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,593 :: 		ButtonRound15.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound15+40)
MOVT	R0, #hi_addr(_ButtonRound15+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,594 :: 		ButtonRound15.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound15+42)
MOVT	R0, #hi_addr(_ButtonRound15+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,595 :: 		ButtonRound15.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound15+44)
MOVT	R0, #hi_addr(_ButtonRound15+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,596 :: 		ButtonRound15.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound15+46)
MOVT	R0, #hi_addr(_ButtonRound15+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,597 :: 		ButtonRound15.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound15+50)
MOVT	R0, #hi_addr(_ButtonRound15+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,598 :: 		ButtonRound15.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound15+48)
MOVT	R0, #hi_addr(_ButtonRound15+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,599 :: 		ButtonRound15.OnClickPtr      = ispis_minus;
MOVW	R1, #lo_addr(_ispis_minus+0)
MOVT	R1, #hi_addr(_ispis_minus+0)
MOVW	R0, #lo_addr(_ButtonRound15+60)
MOVT	R0, #hi_addr(_ButtonRound15+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,601 :: 		ButtonRound16.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound16+0)
MOVT	R0, #hi_addr(_ButtonRound16+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,602 :: 		ButtonRound16.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_ButtonRound16+4)
MOVT	R0, #hi_addr(_ButtonRound16+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,603 :: 		ButtonRound16.Left            = 446;
MOVW	R1, #446
MOVW	R0, #lo_addr(_ButtonRound16+6)
MOVT	R0, #hi_addr(_ButtonRound16+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,604 :: 		ButtonRound16.Top             = 316;
MOVW	R1, #316
MOVW	R0, #lo_addr(_ButtonRound16+8)
MOVT	R0, #hi_addr(_ButtonRound16+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,605 :: 		ButtonRound16.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound16+10)
MOVT	R0, #hi_addr(_ButtonRound16+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,606 :: 		ButtonRound16.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound16+12)
MOVT	R0, #hi_addr(_ButtonRound16+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,607 :: 		ButtonRound16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+14)
MOVT	R0, #hi_addr(_ButtonRound16+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,608 :: 		ButtonRound16.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound16+16)
MOVT	R0, #hi_addr(_ButtonRound16+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,609 :: 		ButtonRound16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+18)
MOVT	R0, #hi_addr(_ButtonRound16+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,610 :: 		ButtonRound16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+19)
MOVT	R0, #hi_addr(_ButtonRound16+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,611 :: 		ButtonRound16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+20)
MOVT	R0, #hi_addr(_ButtonRound16+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,612 :: 		ButtonRound16.Caption         = ButtonRound16_Caption;
MOVW	R1, #lo_addr(_ButtonRound16_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound16_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound16+24)
MOVT	R0, #hi_addr(_ButtonRound16+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,613 :: 		ButtonRound16.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+28)
MOVT	R0, #hi_addr(_ButtonRound16+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,614 :: 		ButtonRound16.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+29)
MOVT	R0, #hi_addr(_ButtonRound16+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,615 :: 		ButtonRound16.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound16+32)
MOVT	R0, #hi_addr(_ButtonRound16+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,616 :: 		ButtonRound16.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+49)
MOVT	R0, #hi_addr(_ButtonRound16+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,617 :: 		ButtonRound16.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound16+36)
MOVT	R0, #hi_addr(_ButtonRound16+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,618 :: 		ButtonRound16.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound16+38)
MOVT	R0, #hi_addr(_ButtonRound16+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,619 :: 		ButtonRound16.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+39)
MOVT	R0, #hi_addr(_ButtonRound16+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,620 :: 		ButtonRound16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound16+40)
MOVT	R0, #hi_addr(_ButtonRound16+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,621 :: 		ButtonRound16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound16+42)
MOVT	R0, #hi_addr(_ButtonRound16+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,622 :: 		ButtonRound16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound16+44)
MOVT	R0, #hi_addr(_ButtonRound16+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,623 :: 		ButtonRound16.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound16+46)
MOVT	R0, #hi_addr(_ButtonRound16+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,624 :: 		ButtonRound16.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound16+50)
MOVT	R0, #hi_addr(_ButtonRound16+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,625 :: 		ButtonRound16.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound16+48)
MOVT	R0, #hi_addr(_ButtonRound16+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,626 :: 		ButtonRound16.OnClickPtr      = ispis_mnozenje;
MOVW	R1, #lo_addr(_ispis_mnozenje+0)
MOVT	R1, #hi_addr(_ispis_mnozenje+0)
MOVW	R0, #lo_addr(_ButtonRound16+60)
MOVT	R0, #hi_addr(_ButtonRound16+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,628 :: 		ButtonRound17.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound17+0)
MOVT	R0, #hi_addr(_ButtonRound17+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,629 :: 		ButtonRound17.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_ButtonRound17+4)
MOVT	R0, #hi_addr(_ButtonRound17+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,630 :: 		ButtonRound17.Left            = 446;
MOVW	R1, #446
MOVW	R0, #lo_addr(_ButtonRound17+6)
MOVT	R0, #hi_addr(_ButtonRound17+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,631 :: 		ButtonRound17.Top             = 387;
MOVW	R1, #387
MOVW	R0, #lo_addr(_ButtonRound17+8)
MOVT	R0, #hi_addr(_ButtonRound17+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,632 :: 		ButtonRound17.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound17+10)
MOVT	R0, #hi_addr(_ButtonRound17+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,633 :: 		ButtonRound17.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound17+12)
MOVT	R0, #hi_addr(_ButtonRound17+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,634 :: 		ButtonRound17.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+14)
MOVT	R0, #hi_addr(_ButtonRound17+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,635 :: 		ButtonRound17.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound17+16)
MOVT	R0, #hi_addr(_ButtonRound17+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,636 :: 		ButtonRound17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+18)
MOVT	R0, #hi_addr(_ButtonRound17+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,637 :: 		ButtonRound17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+19)
MOVT	R0, #hi_addr(_ButtonRound17+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,638 :: 		ButtonRound17.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+20)
MOVT	R0, #hi_addr(_ButtonRound17+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,639 :: 		ButtonRound17.Caption         = ButtonRound17_Caption;
MOVW	R1, #lo_addr(_ButtonRound17_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound17_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound17+24)
MOVT	R0, #hi_addr(_ButtonRound17+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,640 :: 		ButtonRound17.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+28)
MOVT	R0, #hi_addr(_ButtonRound17+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,641 :: 		ButtonRound17.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+29)
MOVT	R0, #hi_addr(_ButtonRound17+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,642 :: 		ButtonRound17.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound17+32)
MOVT	R0, #hi_addr(_ButtonRound17+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,643 :: 		ButtonRound17.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+49)
MOVT	R0, #hi_addr(_ButtonRound17+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,644 :: 		ButtonRound17.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound17+36)
MOVT	R0, #hi_addr(_ButtonRound17+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,645 :: 		ButtonRound17.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound17+38)
MOVT	R0, #hi_addr(_ButtonRound17+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,646 :: 		ButtonRound17.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+39)
MOVT	R0, #hi_addr(_ButtonRound17+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,647 :: 		ButtonRound17.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound17+40)
MOVT	R0, #hi_addr(_ButtonRound17+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,648 :: 		ButtonRound17.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound17+42)
MOVT	R0, #hi_addr(_ButtonRound17+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,649 :: 		ButtonRound17.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound17+44)
MOVT	R0, #hi_addr(_ButtonRound17+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,650 :: 		ButtonRound17.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound17+46)
MOVT	R0, #hi_addr(_ButtonRound17+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,651 :: 		ButtonRound17.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound17+50)
MOVT	R0, #hi_addr(_ButtonRound17+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,652 :: 		ButtonRound17.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound17+48)
MOVT	R0, #hi_addr(_ButtonRound17+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,653 :: 		ButtonRound17.OnClickPtr      = ispis_deljenje;
MOVW	R1, #lo_addr(_ispis_deljenje+0)
MOVT	R1, #hi_addr(_ispis_deljenje+0)
MOVW	R0, #lo_addr(_ButtonRound17+60)
MOVT	R0, #hi_addr(_ButtonRound17+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,655 :: 		ButtonRound18.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound18+0)
MOVT	R0, #hi_addr(_ButtonRound18+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,656 :: 		ButtonRound18.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_ButtonRound18+4)
MOVT	R0, #hi_addr(_ButtonRound18+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,657 :: 		ButtonRound18.Left            = 534;
MOVW	R1, #534
MOVW	R0, #lo_addr(_ButtonRound18+6)
MOVT	R0, #hi_addr(_ButtonRound18+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,658 :: 		ButtonRound18.Top             = 175;
MOVS	R1, #175
MOVW	R0, #lo_addr(_ButtonRound18+8)
MOVT	R0, #hi_addr(_ButtonRound18+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,659 :: 		ButtonRound18.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound18+10)
MOVT	R0, #hi_addr(_ButtonRound18+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,660 :: 		ButtonRound18.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound18+12)
MOVT	R0, #hi_addr(_ButtonRound18+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,661 :: 		ButtonRound18.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+14)
MOVT	R0, #hi_addr(_ButtonRound18+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,662 :: 		ButtonRound18.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound18+16)
MOVT	R0, #hi_addr(_ButtonRound18+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,663 :: 		ButtonRound18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+18)
MOVT	R0, #hi_addr(_ButtonRound18+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,664 :: 		ButtonRound18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+19)
MOVT	R0, #hi_addr(_ButtonRound18+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,665 :: 		ButtonRound18.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+20)
MOVT	R0, #hi_addr(_ButtonRound18+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,666 :: 		ButtonRound18.Caption         = ButtonRound18_Caption;
MOVW	R1, #lo_addr(_ButtonRound18_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound18_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound18+24)
MOVT	R0, #hi_addr(_ButtonRound18+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,667 :: 		ButtonRound18.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+28)
MOVT	R0, #hi_addr(_ButtonRound18+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,668 :: 		ButtonRound18.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+29)
MOVT	R0, #hi_addr(_ButtonRound18+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,669 :: 		ButtonRound18.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound18+32)
MOVT	R0, #hi_addr(_ButtonRound18+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,670 :: 		ButtonRound18.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+49)
MOVT	R0, #hi_addr(_ButtonRound18+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,671 :: 		ButtonRound18.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound18+36)
MOVT	R0, #hi_addr(_ButtonRound18+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,672 :: 		ButtonRound18.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound18+38)
MOVT	R0, #hi_addr(_ButtonRound18+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,673 :: 		ButtonRound18.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+39)
MOVT	R0, #hi_addr(_ButtonRound18+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,674 :: 		ButtonRound18.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound18+40)
MOVT	R0, #hi_addr(_ButtonRound18+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,675 :: 		ButtonRound18.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound18+42)
MOVT	R0, #hi_addr(_ButtonRound18+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,676 :: 		ButtonRound18.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound18+44)
MOVT	R0, #hi_addr(_ButtonRound18+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,677 :: 		ButtonRound18.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound18+46)
MOVT	R0, #hi_addr(_ButtonRound18+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,678 :: 		ButtonRound18.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound18+50)
MOVT	R0, #hi_addr(_ButtonRound18+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,679 :: 		ButtonRound18.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound18+48)
MOVT	R0, #hi_addr(_ButtonRound18+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,680 :: 		ButtonRound18.OnClickPtr      = ispis_koren;
MOVW	R1, #lo_addr(_ispis_koren+0)
MOVT	R1, #hi_addr(_ispis_koren+0)
MOVW	R0, #lo_addr(_ButtonRound18+60)
MOVT	R0, #hi_addr(_ButtonRound18+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,682 :: 		ButtonRound19.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound19+0)
MOVT	R0, #hi_addr(_ButtonRound19+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,683 :: 		ButtonRound19.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_ButtonRound19+4)
MOVT	R0, #hi_addr(_ButtonRound19+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,684 :: 		ButtonRound19.Left            = 534;
MOVW	R1, #534
MOVW	R0, #lo_addr(_ButtonRound19+6)
MOVT	R0, #hi_addr(_ButtonRound19+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,685 :: 		ButtonRound19.Top             = 246;
MOVS	R1, #246
MOVW	R0, #lo_addr(_ButtonRound19+8)
MOVT	R0, #hi_addr(_ButtonRound19+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,686 :: 		ButtonRound19.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound19+10)
MOVT	R0, #hi_addr(_ButtonRound19+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,687 :: 		ButtonRound19.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound19+12)
MOVT	R0, #hi_addr(_ButtonRound19+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,688 :: 		ButtonRound19.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+14)
MOVT	R0, #hi_addr(_ButtonRound19+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,689 :: 		ButtonRound19.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound19+16)
MOVT	R0, #hi_addr(_ButtonRound19+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,690 :: 		ButtonRound19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+18)
MOVT	R0, #hi_addr(_ButtonRound19+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,691 :: 		ButtonRound19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+19)
MOVT	R0, #hi_addr(_ButtonRound19+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,692 :: 		ButtonRound19.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+20)
MOVT	R0, #hi_addr(_ButtonRound19+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,693 :: 		ButtonRound19.Caption         = ButtonRound19_Caption;
MOVW	R1, #lo_addr(_ButtonRound19_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound19_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound19+24)
MOVT	R0, #hi_addr(_ButtonRound19+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,694 :: 		ButtonRound19.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+28)
MOVT	R0, #hi_addr(_ButtonRound19+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,695 :: 		ButtonRound19.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+29)
MOVT	R0, #hi_addr(_ButtonRound19+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,696 :: 		ButtonRound19.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound19+32)
MOVT	R0, #hi_addr(_ButtonRound19+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,697 :: 		ButtonRound19.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+49)
MOVT	R0, #hi_addr(_ButtonRound19+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,698 :: 		ButtonRound19.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound19+36)
MOVT	R0, #hi_addr(_ButtonRound19+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,699 :: 		ButtonRound19.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound19+38)
MOVT	R0, #hi_addr(_ButtonRound19+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,700 :: 		ButtonRound19.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+39)
MOVT	R0, #hi_addr(_ButtonRound19+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,701 :: 		ButtonRound19.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound19+40)
MOVT	R0, #hi_addr(_ButtonRound19+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,702 :: 		ButtonRound19.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound19+42)
MOVT	R0, #hi_addr(_ButtonRound19+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,703 :: 		ButtonRound19.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound19+44)
MOVT	R0, #hi_addr(_ButtonRound19+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,704 :: 		ButtonRound19.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound19+46)
MOVT	R0, #hi_addr(_ButtonRound19+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,705 :: 		ButtonRound19.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound19+50)
MOVT	R0, #hi_addr(_ButtonRound19+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,706 :: 		ButtonRound19.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound19+48)
MOVT	R0, #hi_addr(_ButtonRound19+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,707 :: 		ButtonRound19.OnClickPtr      = ispis_kvadrat;
MOVW	R1, #lo_addr(_ispis_kvadrat+0)
MOVT	R1, #hi_addr(_ispis_kvadrat+0)
MOVW	R0, #lo_addr(_ButtonRound19+60)
MOVT	R0, #hi_addr(_ButtonRound19+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,710 :: 		ButtonRound20.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound20+0)
MOVT	R0, #hi_addr(_ButtonRound20+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,711 :: 		ButtonRound20.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_ButtonRound20+4)
MOVT	R0, #hi_addr(_ButtonRound20+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,712 :: 		ButtonRound20.Left            = 534;
MOVW	R1, #534
MOVW	R0, #lo_addr(_ButtonRound20+6)
MOVT	R0, #hi_addr(_ButtonRound20+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,713 :: 		ButtonRound20.Top             = 316;
MOVW	R1, #316
MOVW	R0, #lo_addr(_ButtonRound20+8)
MOVT	R0, #hi_addr(_ButtonRound20+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,714 :: 		ButtonRound20.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound20+10)
MOVT	R0, #hi_addr(_ButtonRound20+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,715 :: 		ButtonRound20.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound20+12)
MOVT	R0, #hi_addr(_ButtonRound20+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,716 :: 		ButtonRound20.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+14)
MOVT	R0, #hi_addr(_ButtonRound20+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,717 :: 		ButtonRound20.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound20+16)
MOVT	R0, #hi_addr(_ButtonRound20+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,718 :: 		ButtonRound20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+18)
MOVT	R0, #hi_addr(_ButtonRound20+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,719 :: 		ButtonRound20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+19)
MOVT	R0, #hi_addr(_ButtonRound20+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,720 :: 		ButtonRound20.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+20)
MOVT	R0, #hi_addr(_ButtonRound20+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,721 :: 		ButtonRound20.Caption         = ButtonRound20_Caption;
MOVW	R1, #lo_addr(_ButtonRound20_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound20_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound20+24)
MOVT	R0, #hi_addr(_ButtonRound20+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,722 :: 		ButtonRound20.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+28)
MOVT	R0, #hi_addr(_ButtonRound20+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,723 :: 		ButtonRound20.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+29)
MOVT	R0, #hi_addr(_ButtonRound20+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,724 :: 		ButtonRound20.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound20+32)
MOVT	R0, #hi_addr(_ButtonRound20+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,725 :: 		ButtonRound20.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+49)
MOVT	R0, #hi_addr(_ButtonRound20+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,726 :: 		ButtonRound20.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound20+36)
MOVT	R0, #hi_addr(_ButtonRound20+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,727 :: 		ButtonRound20.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound20+38)
MOVT	R0, #hi_addr(_ButtonRound20+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,728 :: 		ButtonRound20.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+39)
MOVT	R0, #hi_addr(_ButtonRound20+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,729 :: 		ButtonRound20.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound20+40)
MOVT	R0, #hi_addr(_ButtonRound20+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,730 :: 		ButtonRound20.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound20+42)
MOVT	R0, #hi_addr(_ButtonRound20+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,731 :: 		ButtonRound20.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound20+44)
MOVT	R0, #hi_addr(_ButtonRound20+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,732 :: 		ButtonRound20.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound20+46)
MOVT	R0, #hi_addr(_ButtonRound20+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,733 :: 		ButtonRound20.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound20+50)
MOVT	R0, #hi_addr(_ButtonRound20+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,734 :: 		ButtonRound20.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound20+48)
MOVT	R0, #hi_addr(_ButtonRound20+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,735 :: 		ButtonRound20.OnClickPtr      = brisanje_jednog_karaktera;
MOVW	R1, #lo_addr(_brisanje_jednog_karaktera+0)
MOVT	R1, #hi_addr(_brisanje_jednog_karaktera+0)
MOVW	R0, #lo_addr(_ButtonRound20+60)
MOVT	R0, #hi_addr(_ButtonRound20+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,737 :: 		ButtonRound21.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound21+0)
MOVT	R0, #hi_addr(_ButtonRound21+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,738 :: 		ButtonRound21.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_ButtonRound21+4)
MOVT	R0, #hi_addr(_ButtonRound21+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,739 :: 		ButtonRound21.Left            = 534;
MOVW	R1, #534
MOVW	R0, #lo_addr(_ButtonRound21+6)
MOVT	R0, #hi_addr(_ButtonRound21+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,740 :: 		ButtonRound21.Top             = 387;
MOVW	R1, #387
MOVW	R0, #lo_addr(_ButtonRound21+8)
MOVT	R0, #hi_addr(_ButtonRound21+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,741 :: 		ButtonRound21.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound21+10)
MOVT	R0, #hi_addr(_ButtonRound21+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,742 :: 		ButtonRound21.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound21+12)
MOVT	R0, #hi_addr(_ButtonRound21+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,743 :: 		ButtonRound21.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound21+14)
MOVT	R0, #hi_addr(_ButtonRound21+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,744 :: 		ButtonRound21.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound21+16)
MOVT	R0, #hi_addr(_ButtonRound21+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,745 :: 		ButtonRound21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound21+18)
MOVT	R0, #hi_addr(_ButtonRound21+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,746 :: 		ButtonRound21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound21+19)
MOVT	R0, #hi_addr(_ButtonRound21+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,747 :: 		ButtonRound21.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound21+20)
MOVT	R0, #hi_addr(_ButtonRound21+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,748 :: 		ButtonRound21.Caption         = ButtonRound21_Caption;
MOVW	R1, #lo_addr(_ButtonRound21_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound21_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound21+24)
MOVT	R0, #hi_addr(_ButtonRound21+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,749 :: 		ButtonRound21.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound21+28)
MOVT	R0, #hi_addr(_ButtonRound21+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,750 :: 		ButtonRound21.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound21+29)
MOVT	R0, #hi_addr(_ButtonRound21+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,751 :: 		ButtonRound21.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound21+32)
MOVT	R0, #hi_addr(_ButtonRound21+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,752 :: 		ButtonRound21.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound21+49)
MOVT	R0, #hi_addr(_ButtonRound21+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,753 :: 		ButtonRound21.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound21+36)
MOVT	R0, #hi_addr(_ButtonRound21+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,754 :: 		ButtonRound21.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound21+38)
MOVT	R0, #hi_addr(_ButtonRound21+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,755 :: 		ButtonRound21.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound21+39)
MOVT	R0, #hi_addr(_ButtonRound21+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,756 :: 		ButtonRound21.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound21+40)
MOVT	R0, #hi_addr(_ButtonRound21+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,757 :: 		ButtonRound21.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound21+42)
MOVT	R0, #hi_addr(_ButtonRound21+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,758 :: 		ButtonRound21.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound21+44)
MOVT	R0, #hi_addr(_ButtonRound21+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,759 :: 		ButtonRound21.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound21+46)
MOVT	R0, #hi_addr(_ButtonRound21+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,760 :: 		ButtonRound21.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound21+50)
MOVT	R0, #hi_addr(_ButtonRound21+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,761 :: 		ButtonRound21.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound21+48)
MOVT	R0, #hi_addr(_ButtonRound21+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,762 :: 		ButtonRound21.OnClickPtr      = brisanje_svih_karaktera;
MOVW	R1, #lo_addr(_brisanje_svih_karaktera+0)
MOVT	R1, #hi_addr(_brisanje_svih_karaktera+0)
MOVW	R0, #lo_addr(_ButtonRound21+60)
MOVT	R0, #hi_addr(_ButtonRound21+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,764 :: 		ButtonRound22.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound22+0)
MOVT	R0, #hi_addr(_ButtonRound22+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,765 :: 		ButtonRound22.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_ButtonRound22+4)
MOVT	R0, #hi_addr(_ButtonRound22+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,766 :: 		ButtonRound22.Left            = 358;
MOVW	R1, #358
MOVW	R0, #lo_addr(_ButtonRound22+6)
MOVT	R0, #hi_addr(_ButtonRound22+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,767 :: 		ButtonRound22.Top             = 387;
MOVW	R1, #387
MOVW	R0, #lo_addr(_ButtonRound22+8)
MOVT	R0, #hi_addr(_ButtonRound22+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,768 :: 		ButtonRound22.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound22+10)
MOVT	R0, #hi_addr(_ButtonRound22+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,769 :: 		ButtonRound22.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound22+12)
MOVT	R0, #hi_addr(_ButtonRound22+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,770 :: 		ButtonRound22.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound22+14)
MOVT	R0, #hi_addr(_ButtonRound22+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,771 :: 		ButtonRound22.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound22+16)
MOVT	R0, #hi_addr(_ButtonRound22+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,772 :: 		ButtonRound22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound22+18)
MOVT	R0, #hi_addr(_ButtonRound22+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,773 :: 		ButtonRound22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound22+19)
MOVT	R0, #hi_addr(_ButtonRound22+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,774 :: 		ButtonRound22.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound22+20)
MOVT	R0, #hi_addr(_ButtonRound22+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,775 :: 		ButtonRound22.Caption         = ButtonRound22_Caption;
MOVW	R1, #lo_addr(_ButtonRound22_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound22_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound22+24)
MOVT	R0, #hi_addr(_ButtonRound22+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,776 :: 		ButtonRound22.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound22+28)
MOVT	R0, #hi_addr(_ButtonRound22+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,777 :: 		ButtonRound22.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound22+29)
MOVT	R0, #hi_addr(_ButtonRound22+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,778 :: 		ButtonRound22.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound22+32)
MOVT	R0, #hi_addr(_ButtonRound22+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,779 :: 		ButtonRound22.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound22+49)
MOVT	R0, #hi_addr(_ButtonRound22+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,780 :: 		ButtonRound22.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound22+36)
MOVT	R0, #hi_addr(_ButtonRound22+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,781 :: 		ButtonRound22.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound22+38)
MOVT	R0, #hi_addr(_ButtonRound22+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,782 :: 		ButtonRound22.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound22+39)
MOVT	R0, #hi_addr(_ButtonRound22+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,783 :: 		ButtonRound22.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound22+40)
MOVT	R0, #hi_addr(_ButtonRound22+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,784 :: 		ButtonRound22.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound22+42)
MOVT	R0, #hi_addr(_ButtonRound22+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,785 :: 		ButtonRound22.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound22+44)
MOVT	R0, #hi_addr(_ButtonRound22+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,786 :: 		ButtonRound22.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound22+46)
MOVT	R0, #hi_addr(_ButtonRound22+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,787 :: 		ButtonRound22.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound22+50)
MOVT	R0, #hi_addr(_ButtonRound22+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,788 :: 		ButtonRound22.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound22+48)
MOVT	R0, #hi_addr(_ButtonRound22+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,789 :: 		ButtonRound22.OnClickPtr      = jednako;
MOVW	R1, #lo_addr(_jednako+0)
MOVT	R1, #hi_addr(_jednako+0)
MOVW	R0, #lo_addr(_ButtonRound22+60)
MOVT	R0, #hi_addr(_ButtonRound22+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,791 :: 		ButtonRound6.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_ButtonRound6+0)
MOVT	R0, #hi_addr(_ButtonRound6+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,792 :: 		ButtonRound6.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+4)
MOVT	R0, #hi_addr(_ButtonRound6+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,793 :: 		ButtonRound6.Left            = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_ButtonRound6+6)
MOVT	R0, #hi_addr(_ButtonRound6+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,794 :: 		ButtonRound6.Top             = 132;
MOVS	R1, #132
MOVW	R0, #lo_addr(_ButtonRound6+8)
MOVT	R0, #hi_addr(_ButtonRound6+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,795 :: 		ButtonRound6.Width           = 187;
MOVS	R1, #187
MOVW	R0, #lo_addr(_ButtonRound6+10)
MOVT	R0, #hi_addr(_ButtonRound6+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,796 :: 		ButtonRound6.Height          = 130;
MOVS	R1, #130
MOVW	R0, #lo_addr(_ButtonRound6+12)
MOVT	R0, #hi_addr(_ButtonRound6+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,797 :: 		ButtonRound6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+14)
MOVT	R0, #hi_addr(_ButtonRound6+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,798 :: 		ButtonRound6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+16)
MOVT	R0, #hi_addr(_ButtonRound6+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,799 :: 		ButtonRound6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+18)
MOVT	R0, #hi_addr(_ButtonRound6+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,800 :: 		ButtonRound6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+19)
MOVT	R0, #hi_addr(_ButtonRound6+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,801 :: 		ButtonRound6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+20)
MOVT	R0, #hi_addr(_ButtonRound6+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,802 :: 		ButtonRound6.Caption         = ButtonRound6_Caption;
MOVW	R1, #lo_addr(_ButtonRound6_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound6_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound6+24)
MOVT	R0, #hi_addr(_ButtonRound6+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,803 :: 		ButtonRound6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+28)
MOVT	R0, #hi_addr(_ButtonRound6+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,804 :: 		ButtonRound6.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+29)
MOVT	R0, #hi_addr(_ButtonRound6+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,805 :: 		ButtonRound6.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound6+32)
MOVT	R0, #hi_addr(_ButtonRound6+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,806 :: 		ButtonRound6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+49)
MOVT	R0, #hi_addr(_ButtonRound6+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,807 :: 		ButtonRound6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+36)
MOVT	R0, #hi_addr(_ButtonRound6+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,808 :: 		ButtonRound6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+38)
MOVT	R0, #hi_addr(_ButtonRound6+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,809 :: 		ButtonRound6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+39)
MOVT	R0, #hi_addr(_ButtonRound6+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,810 :: 		ButtonRound6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+40)
MOVT	R0, #hi_addr(_ButtonRound6+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,811 :: 		ButtonRound6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound6+42)
MOVT	R0, #hi_addr(_ButtonRound6+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,812 :: 		ButtonRound6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound6+44)
MOVT	R0, #hi_addr(_ButtonRound6+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,813 :: 		ButtonRound6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound6+46)
MOVT	R0, #hi_addr(_ButtonRound6+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,814 :: 		ButtonRound6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound6+50)
MOVT	R0, #hi_addr(_ButtonRound6+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,815 :: 		ButtonRound6.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound6+48)
MOVT	R0, #hi_addr(_ButtonRound6+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,816 :: 		ButtonRound6.OnClickPtr      = ButtonRoundBackOnClick;
MOVW	R1, #lo_addr(_ButtonRoundBackOnClick+0)
MOVT	R1, #hi_addr(_ButtonRoundBackOnClick+0)
MOVW	R0, #lo_addr(_ButtonRound6+60)
MOVT	R0, #hi_addr(_ButtonRound6+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,818 :: 		ButtonRound7.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_ButtonRound7+0)
MOVT	R0, #hi_addr(_ButtonRound7+0)
STR	R1, [R0, #0]
;Kalkulator_driver.c,819 :: 		ButtonRound7.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+4)
MOVT	R0, #hi_addr(_ButtonRound7+4)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,820 :: 		ButtonRound7.Left            = 315;
MOVW	R1, #315
MOVW	R0, #lo_addr(_ButtonRound7+6)
MOVT	R0, #hi_addr(_ButtonRound7+6)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,821 :: 		ButtonRound7.Top             = 217;
MOVS	R1, #217
MOVW	R0, #lo_addr(_ButtonRound7+8)
MOVT	R0, #hi_addr(_ButtonRound7+8)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,822 :: 		ButtonRound7.Width           = 241;
MOVS	R1, #241
MOVW	R0, #lo_addr(_ButtonRound7+10)
MOVT	R0, #hi_addr(_ButtonRound7+10)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,823 :: 		ButtonRound7.Height          = 89;
MOVS	R1, #89
MOVW	R0, #lo_addr(_ButtonRound7+12)
MOVT	R0, #hi_addr(_ButtonRound7+12)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,824 :: 		ButtonRound7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+14)
MOVT	R0, #hi_addr(_ButtonRound7+14)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,825 :: 		ButtonRound7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+16)
MOVT	R0, #hi_addr(_ButtonRound7+16)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,826 :: 		ButtonRound7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+18)
MOVT	R0, #hi_addr(_ButtonRound7+18)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,827 :: 		ButtonRound7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+19)
MOVT	R0, #hi_addr(_ButtonRound7+19)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,828 :: 		ButtonRound7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+20)
MOVT	R0, #hi_addr(_ButtonRound7+20)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,829 :: 		ButtonRound7.Caption         = ButtonRound7_Caption;
MOVW	R1, #lo_addr(_ButtonRound7_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound7_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound7+24)
MOVT	R0, #hi_addr(_ButtonRound7+24)
STR	R1, [R0, #0]
;Kalkulator_driver.c,830 :: 		ButtonRound7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+28)
MOVT	R0, #hi_addr(_ButtonRound7+28)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,831 :: 		ButtonRound7.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+29)
MOVT	R0, #hi_addr(_ButtonRound7+29)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,832 :: 		ButtonRound7.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound7+32)
MOVT	R0, #hi_addr(_ButtonRound7+32)
STR	R2, [R0, #0]
;Kalkulator_driver.c,833 :: 		ButtonRound7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+49)
MOVT	R0, #hi_addr(_ButtonRound7+49)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,834 :: 		ButtonRound7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+36)
MOVT	R0, #hi_addr(_ButtonRound7+36)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,835 :: 		ButtonRound7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+38)
MOVT	R0, #hi_addr(_ButtonRound7+38)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,836 :: 		ButtonRound7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+39)
MOVT	R0, #hi_addr(_ButtonRound7+39)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,837 :: 		ButtonRound7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+40)
MOVT	R0, #hi_addr(_ButtonRound7+40)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,838 :: 		ButtonRound7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound7+42)
MOVT	R0, #hi_addr(_ButtonRound7+42)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,839 :: 		ButtonRound7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound7+44)
MOVT	R0, #hi_addr(_ButtonRound7+44)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,840 :: 		ButtonRound7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound7+46)
MOVT	R0, #hi_addr(_ButtonRound7+46)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,841 :: 		ButtonRound7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound7+50)
MOVT	R0, #hi_addr(_ButtonRound7+50)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,842 :: 		ButtonRound7.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound7+48)
MOVT	R0, #hi_addr(_ButtonRound7+48)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,843 :: 		ButtonRound7.OnClickPtr      = ButtonRoundBackOnClick;
MOVW	R1, #lo_addr(_ButtonRoundBackOnClick+0)
MOVT	R1, #hi_addr(_ButtonRoundBackOnClick+0)
MOVW	R0, #lo_addr(_ButtonRound7+60)
MOVT	R0, #hi_addr(_ButtonRound7+60)
STR	R1, [R0, #0]
;Kalkulator_driver.c,844 :: 		}
L_end_InitializeObjects:
BX	LR
; end of Kalkulator_driver_InitializeObjects
Kalkulator_driver_IsInsideObject:
;Kalkulator_driver.c,846 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;Kalkulator_driver.c,847 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_Kalkulator_driver_IsInsideObject97
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_Kalkulator_driver_IsInsideObject96
; X end address is: 0 (R0)
;Kalkulator_driver.c,848 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_Kalkulator_driver_IsInsideObject95
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_Kalkulator_driver_IsInsideObject94
; Y end address is: 4 (R1)
L_Kalkulator_driver_IsInsideObject93:
;Kalkulator_driver.c,849 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;Kalkulator_driver.c,847 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_Kalkulator_driver_IsInsideObject97:
L_Kalkulator_driver_IsInsideObject96:
;Kalkulator_driver.c,848 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_Kalkulator_driver_IsInsideObject95:
L_Kalkulator_driver_IsInsideObject94:
;Kalkulator_driver.c,851 :: 		return 0;
MOVS	R0, #0
;Kalkulator_driver.c,852 :: 		}
L_end_IsInsideObject:
BX	LR
; end of Kalkulator_driver_IsInsideObject
_DrawRoundButton:
;Kalkulator_driver.c,859 :: 		void DrawRoundButton(TButton_Round *Around_button) {
; Around_button start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Around_button end address is: 0 (R0)
; Around_button start address is: 0 (R0)
;Kalkulator_driver.c,861 :: 		if (Around_button->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton4
;Kalkulator_driver.c,862 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton5
;Kalkulator_driver.c,863 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Kalkulator_driver.c,865 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Kalkulator_driver.c,864 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;Kalkulator_driver.c,865 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Kalkulator_driver.c,864 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Kalkulator_driver.c,866 :: 		}
IT	AL
BAL	L_DrawRoundButton6
L_DrawRoundButton5:
;Kalkulator_driver.c,869 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;Kalkulator_driver.c,868 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;Kalkulator_driver.c,869 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Kalkulator_driver.c,868 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;Kalkulator_driver.c,870 :: 		}
L_DrawRoundButton6:
;Kalkulator_driver.c,871 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;Kalkulator_driver.c,874 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDW	R1, R0, #48
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;Kalkulator_driver.c,873 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;Kalkulator_driver.c,872 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;Kalkulator_driver.c,874 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;Kalkulator_driver.c,872 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;Kalkulator_driver.c,873 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;Kalkulator_driver.c,874 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;Kalkulator_driver.c,875 :: 		if (Around_button->VerticalText != 0)
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton7
;Kalkulator_driver.c,876 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawRoundButton8
L_DrawRoundButton7:
;Kalkulator_driver.c,878 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawRoundButton8:
;Kalkulator_driver.c,879 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;Kalkulator_driver.c,880 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton9
;Kalkulator_driver.c,881 :: 		ALeft = Around_button->Left + 4;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton10
L_DrawRoundButton9:
;Kalkulator_driver.c,882 :: 		else if (Around_button->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton11
;Kalkulator_driver.c,883 :: 		ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton12
L_DrawRoundButton11:
;Kalkulator_driver.c,884 :: 		else if (Around_button->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton13
;Kalkulator_driver.c,885 :: 		ALeft = Around_button->Left + Around_button->Width - caption_length - 4;
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #8]
L_DrawRoundButton13:
L_DrawRoundButton12:
L_DrawRoundButton10:
;Kalkulator_driver.c,887 :: 		if (Around_button->TextAlignVertical == _tavTop)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton14
;Kalkulator_driver.c,888 :: 		ATop = Around_button->Top + 3;
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R1, R1, #3
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton15
L_DrawRoundButton14:
;Kalkulator_driver.c,889 :: 		else if (Around_button->TextAlignVertical == _tavMiddle)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton16
;Kalkulator_driver.c,890 :: 		ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton17
L_DrawRoundButton16:
;Kalkulator_driver.c,891 :: 		else if (Around_button->TextAlignVertical == _tavBottom)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton18
;Kalkulator_driver.c,892 :: 		ATop  = Around_button->Top + Around_button->Height - caption_height - 4;
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #10]
L_DrawRoundButton18:
L_DrawRoundButton17:
L_DrawRoundButton15:
;Kalkulator_driver.c,894 :: 		TFT_Write_Text(Around_button->Caption, ALeft, ATop);
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
LDRH	R2, [SP, #10]
MOV	R0, R1
LDRH	R1, [SP, #8]
BL	_TFT_Write_Text+0
;Kalkulator_driver.c,895 :: 		}
L_DrawRoundButton4:
;Kalkulator_driver.c,896 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;Kalkulator_driver.c,898 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;Kalkulator_driver.c,899 :: 		if (ALabel->Visible != 0) {
ADDW	R1, R0, #27
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel19
;Kalkulator_driver.c,900 :: 		if (ALabel->VerticalText != 0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel20
;Kalkulator_driver.c,901 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawLabel21
L_DrawLabel20:
;Kalkulator_driver.c,903 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawLabel21:
;Kalkulator_driver.c,904 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;Kalkulator_driver.c,905 :: 		}
L_DrawLabel19:
;Kalkulator_driver.c,906 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawScreen:
;Kalkulator_driver.c,908 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;Kalkulator_driver.c,916 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;Kalkulator_driver.c,917 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;Kalkulator_driver.c,918 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;Kalkulator_driver.c,919 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;Kalkulator_driver.c,920 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;Kalkulator_driver.c,922 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen100
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen99
IT	AL
BAL	L_DrawScreen24
L__DrawScreen100:
L__DrawScreen99:
;Kalkulator_driver.c,923 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOC_PDOR+0)
MOVT	R2, #hi_addr(GPIOC_PDOR+0)
_LX	[R2, ByteOffset(GPIOC_PDOR+0)]
STRB	R1, [SP, #20]
;Kalkulator_driver.c,924 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R2, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,925 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R3, #lo_addr(_Write_Data+0)
MOVT	R3, #hi_addr(_Write_Data+0)
MOVW	R2, #lo_addr(_Write_Command+0)
MOVT	R2, #hi_addr(_Write_Command+0)
MOVW	R1, #lo_addr(_Set_Index+0)
MOVT	R1, #hi_addr(_Set_Index+0)
MOV	R0, R1
MOV	R1, R2
MOV	R2, R3
BL	_TFT_Set_Active+0
;Kalkulator_driver.c,926 :: 		TFT_Init_SSD1963_Board_50(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_SSD1963_Board_50+0
;Kalkulator_driver.c,927 :: 		FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_FT5XX6_SetSize+0
;Kalkulator_driver.c,928 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;Kalkulator_driver.c,929 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;Kalkulator_driver.c,930 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;Kalkulator_driver.c,931 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;Kalkulator_driver.c,932 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #20]
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;Kalkulator_driver.c,933 :: 		}
IT	AL
BAL	L_DrawScreen25
L_DrawScreen24:
;Kalkulator_driver.c,935 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen25:
;Kalkulator_driver.c,938 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen26:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen27
;Kalkulator_driver.c,939 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen28
;Kalkulator_driver.c,940 :: 		local_round_button = GetRoundButton(round_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;Kalkulator_driver.c,941 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen29
;Kalkulator_driver.c,942 :: 		round_button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;Kalkulator_driver.c,943 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Kalkulator_driver.c,944 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #8]
BL	_DrawRoundButton+0
;Kalkulator_driver.c,945 :: 		}
L_DrawScreen29:
;Kalkulator_driver.c,946 :: 		}
L_DrawScreen28:
;Kalkulator_driver.c,948 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen30
;Kalkulator_driver.c,949 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;Kalkulator_driver.c,950 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen31
;Kalkulator_driver.c,951 :: 		label_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;Kalkulator_driver.c,952 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;Kalkulator_driver.c,953 :: 		DrawLabel(local_label);
LDR	R0, [SP, #16]
BL	_DrawLabel+0
;Kalkulator_driver.c,954 :: 		}
L_DrawScreen31:
;Kalkulator_driver.c,955 :: 		}
L_DrawScreen30:
;Kalkulator_driver.c,957 :: 		}
IT	AL
BAL	L_DrawScreen26
L_DrawScreen27:
;Kalkulator_driver.c,958 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _DrawScreen
_Get_Object:
;Kalkulator_driver.c,960 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Kalkulator_driver.c,961 :: 		round_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,962 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,964 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object32:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object33
;Kalkulator_driver.c,965 :: 		local_round_button = GetRoundButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_button+0)
MOVT	R2, #hi_addr(_local_round_button+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,966 :: 		if (local_round_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object35
;Kalkulator_driver.c,968 :: 		local_round_button->Width, local_round_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_button+0)
MOVT	R6, #hi_addr(_local_round_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;Kalkulator_driver.c,967 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;Kalkulator_driver.c,968 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Kalkulator_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object36
;Kalkulator_driver.c,969 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,970 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,971 :: 		}
L_Get_Object36:
;Kalkulator_driver.c,972 :: 		}
L_Get_Object35:
;Kalkulator_driver.c,964 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Kalkulator_driver.c,973 :: 		}
IT	AL
BAL	L_Get_Object32
L_Get_Object33:
;Kalkulator_driver.c,976 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object37:
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
; X start address is: 28 (R7)
; X end address is: 28 (R7)
; Y start address is: 32 (R8)
; Y end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object38
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
;Kalkulator_driver.c,977 :: 		local_label = GetLabel(_object_count);
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,978 :: 		if (local_label->Active != 0) {
ADDW	R2, R3, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object40
;Kalkulator_driver.c,980 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;Kalkulator_driver.c,979 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;Kalkulator_driver.c,980 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	Kalkulator_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object41
;Kalkulator_driver.c,981 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,982 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,983 :: 		}
L_Get_Object41:
;Kalkulator_driver.c,984 :: 		}
L_Get_Object40:
;Kalkulator_driver.c,976 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;Kalkulator_driver.c,985 :: 		}
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
IT	AL
BAL	L_Get_Object37
L_Get_Object38:
;Kalkulator_driver.c,987 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,988 :: 		if (round_button_order >  _object_count )
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object42
;Kalkulator_driver.c,989 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object42:
;Kalkulator_driver.c,990 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object43
;Kalkulator_driver.c,991 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object43:
;Kalkulator_driver.c,992 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;Kalkulator_driver.c,995 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Kalkulator_driver.c,996 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,997 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,999 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;Kalkulator_driver.c,1001 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press44
;Kalkulator_driver.c,1002 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press45
;Kalkulator_driver.c,1003 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press46
;Kalkulator_driver.c,1004 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press47
;Kalkulator_driver.c,1005 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;Kalkulator_driver.c,1006 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Kalkulator_driver.c,1007 :: 		}
L_Process_TP_Press47:
;Kalkulator_driver.c,1008 :: 		}
L_Process_TP_Press46:
;Kalkulator_driver.c,1009 :: 		}
L_Process_TP_Press45:
;Kalkulator_driver.c,1011 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press48
;Kalkulator_driver.c,1012 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press49
;Kalkulator_driver.c,1013 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press50
;Kalkulator_driver.c,1014 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;Kalkulator_driver.c,1015 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;Kalkulator_driver.c,1016 :: 		}
L_Process_TP_Press50:
;Kalkulator_driver.c,1017 :: 		}
L_Process_TP_Press49:
;Kalkulator_driver.c,1018 :: 		}
L_Process_TP_Press48:
;Kalkulator_driver.c,1020 :: 		}
L_Process_TP_Press44:
;Kalkulator_driver.c,1021 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;Kalkulator_driver.c,1023 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Kalkulator_driver.c,1025 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up51
;Kalkulator_driver.c,1027 :: 		case 1: {
L_Process_TP_Up53:
;Kalkulator_driver.c,1028 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up54
;Kalkulator_driver.c,1029 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,1030 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up103
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up102
L__Process_TP_Up101:
;Kalkulator_driver.c,1031 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;Kalkulator_driver.c,1030 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up103:
L__Process_TP_Up102:
;Kalkulator_driver.c,1033 :: 		break;
IT	AL
BAL	L_Process_TP_Up52
;Kalkulator_driver.c,1034 :: 		}
L_Process_TP_Up54:
;Kalkulator_driver.c,1035 :: 		break;
IT	AL
BAL	L_Process_TP_Up52
;Kalkulator_driver.c,1037 :: 		}
L_Process_TP_Up51:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_Process_TP_Up53
L_Process_TP_Up52:
;Kalkulator_driver.c,1039 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,1041 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;Kalkulator_driver.c,1044 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up58
;Kalkulator_driver.c,1046 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up59
;Kalkulator_driver.c,1047 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up60
;Kalkulator_driver.c,1048 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up61
;Kalkulator_driver.c,1049 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up61:
;Kalkulator_driver.c,1050 :: 		if (PressedObject == (void *)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up62
;Kalkulator_driver.c,1051 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up63
;Kalkulator_driver.c,1052 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up63:
L_Process_TP_Up62:
;Kalkulator_driver.c,1053 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,1054 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,1055 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Kalkulator_driver.c,1056 :: 		}
L_Process_TP_Up60:
;Kalkulator_driver.c,1057 :: 		}
L_Process_TP_Up59:
;Kalkulator_driver.c,1060 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up64
;Kalkulator_driver.c,1061 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up65
;Kalkulator_driver.c,1062 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up66
;Kalkulator_driver.c,1063 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up66:
;Kalkulator_driver.c,1064 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up67
;Kalkulator_driver.c,1065 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up68
;Kalkulator_driver.c,1066 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up68:
L_Process_TP_Up67:
;Kalkulator_driver.c,1067 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,1068 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,1069 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;Kalkulator_driver.c,1070 :: 		}
L_Process_TP_Up65:
;Kalkulator_driver.c,1071 :: 		}
L_Process_TP_Up64:
;Kalkulator_driver.c,1073 :: 		}
L_Process_TP_Up58:
;Kalkulator_driver.c,1074 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,1075 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,1076 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;Kalkulator_driver.c,1078 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;Kalkulator_driver.c,1080 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Kalkulator_driver.c,1081 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,1082 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,1084 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;Kalkulator_driver.c,1086 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down69
;Kalkulator_driver.c,1087 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down70
;Kalkulator_driver.c,1088 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down71
;Kalkulator_driver.c,1089 :: 		if (exec_round_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down72
;Kalkulator_driver.c,1090 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;Kalkulator_driver.c,1091 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;Kalkulator_driver.c,1092 :: 		}
L_Process_TP_Down72:
;Kalkulator_driver.c,1093 :: 		PressedObject = (void *)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,1094 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,1095 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down73
;Kalkulator_driver.c,1096 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;Kalkulator_driver.c,1097 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Kalkulator_driver.c,1098 :: 		}
L_Process_TP_Down73:
;Kalkulator_driver.c,1099 :: 		}
L_Process_TP_Down71:
;Kalkulator_driver.c,1100 :: 		}
L_Process_TP_Down70:
;Kalkulator_driver.c,1102 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down74
;Kalkulator_driver.c,1103 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down75
;Kalkulator_driver.c,1104 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;Kalkulator_driver.c,1105 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;Kalkulator_driver.c,1106 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down76
;Kalkulator_driver.c,1107 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;Kalkulator_driver.c,1108 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;Kalkulator_driver.c,1109 :: 		}
L_Process_TP_Down76:
;Kalkulator_driver.c,1110 :: 		}
L_Process_TP_Down75:
;Kalkulator_driver.c,1111 :: 		}
L_Process_TP_Down74:
;Kalkulator_driver.c,1113 :: 		}
L_Process_TP_Down69:
;Kalkulator_driver.c,1114 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;Kalkulator_driver.c,1116 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_driver.c,1117 :: 		if (FT5XX6_PressDetect()) {
BL	_FT5XX6_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP77
;Kalkulator_driver.c,1118 :: 		if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_FT5XX6_GetCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP78
;Kalkulator_driver.c,1120 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;Kalkulator_driver.c,1121 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP79
;Kalkulator_driver.c,1122 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,1123 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;Kalkulator_driver.c,1124 :: 		}
L_Check_TP79:
;Kalkulator_driver.c,1125 :: 		}
L_Check_TP78:
;Kalkulator_driver.c,1126 :: 		}
IT	AL
BAL	L_Check_TP80
L_Check_TP77:
;Kalkulator_driver.c,1127 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP81
;Kalkulator_driver.c,1128 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;Kalkulator_driver.c,1129 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;Kalkulator_driver.c,1130 :: 		}
L_Check_TP81:
L_Check_TP80:
;Kalkulator_driver.c,1131 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;Kalkulator_driver.c,1133 :: 		void Init_MCU()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_driver.c,1135 :: 		GPIO_Digital_Output(&GPIOE_PDOR, _GPIO_PINMASK_24);
MOV	R1, #16777216
MOVW	R0, #lo_addr(GPIOE_PDOR+0)
MOVT	R0, #hi_addr(GPIOE_PDOR+0)
BL	_GPIO_Digital_Output+0
;Kalkulator_driver.c,1136 :: 		GPIO_Digital_Input (&GPIOE_PDIR, _GPIO_PINMASK_25);
MOV	R1, #33554432
MOVW	R0, #lo_addr(GPIOE_PDIR+0)
MOVT	R0, #hi_addr(GPIOE_PDIR+0)
BL	_GPIO_Digital_Input+0
;Kalkulator_driver.c,1137 :: 		GPIOE_PDOR.B24 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_PDOR+0)
MOVT	R0, #hi_addr(GPIOE_PDOR+0)
_SX	[R0, ByteOffset(GPIOE_PDOR+0)]
;Kalkulator_driver.c,1138 :: 		while (GPIOE_PDIR.B25 == 0)
L_Init_MCU82:
MOVW	R0, #lo_addr(GPIOE_PDIR+0)
MOVT	R0, #hi_addr(GPIOE_PDIR+0)
_LX	[R0, ByteOffset(GPIOE_PDIR+0)]
CMP	R0, #0
IT	NE
BNE	L_Init_MCU83
;Kalkulator_driver.c,1140 :: 		GPIOE_PDOR.B24 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_PDOR+0)
MOVT	R0, #hi_addr(GPIOE_PDOR+0)
_SX	[R0, ByteOffset(GPIOE_PDOR+0)]
;Kalkulator_driver.c,1141 :: 		Delay_us(10);
MOVW	R7, #398
MOVT	R7, #0
NOP
NOP
L_Init_MCU84:
SUBS	R7, R7, #1
BNE	L_Init_MCU84
NOP
NOP
NOP
;Kalkulator_driver.c,1142 :: 		GPIOE_PDOR.B24 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_PDOR+0)
MOVT	R0, #hi_addr(GPIOE_PDOR+0)
_SX	[R0, ByteOffset(GPIOE_PDOR+0)]
;Kalkulator_driver.c,1143 :: 		Delay_us(10);
MOVW	R7, #398
MOVT	R7, #0
NOP
NOP
L_Init_MCU86:
SUBS	R7, R7, #1
BNE	L_Init_MCU86
NOP
NOP
NOP
;Kalkulator_driver.c,1144 :: 		}
IT	AL
BAL	L_Init_MCU82
L_Init_MCU83:
;Kalkulator_driver.c,1145 :: 		I2C0_Init_Advanced(400000, &_GPIO_Module_I2C0_PE24_25);
MOVW	R1, #lo_addr(__GPIO_Module_I2C0_PE24_25+0)
MOVT	R1, #hi_addr(__GPIO_Module_I2C0_PE24_25+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C0_Init_Advanced+0
;Kalkulator_driver.c,1147 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;Kalkulator_driver.c,1148 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_FT5XX6_Config:
;Kalkulator_driver.c,1150 :: 		char FT5XX6_Config()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_driver.c,1151 :: 		FT5XX6_SetI2CAddress(0x38);
MOVS	R0, #56
BL	_FT5XX6_SetI2CAddress+0
;Kalkulator_driver.c,1152 :: 		if (FT5XX6_IsOperational() != FT5XX6_OK)
BL	_FT5XX6_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_FT5XX6_Config88
;Kalkulator_driver.c,1153 :: 		return  FT5XX6_FAILURE;
MOVS	R0, #1
IT	AL
BAL	L_end_FT5XX6_Config
L_FT5XX6_Config88:
;Kalkulator_driver.c,1154 :: 		FT5XX6_SetDefaultMode();
BL	_FT5XX6_SetDefaultMode+0
;Kalkulator_driver.c,1155 :: 		FT5XX6_SetController(_TC_FT5X06);
MOVS	R0, #1
BL	_FT5XX6_SetController+0
;Kalkulator_driver.c,1156 :: 		FT5XX6_SetSizeAndRotation(800,480,2);
MOVS	R2, #2
MOVW	R1, #480
MOVW	R0, #800
BL	_FT5XX6_SetSizeAndRotation+0
;Kalkulator_driver.c,1157 :: 		return FT5XX6_OK;
MOVS	R0, #0
;Kalkulator_driver.c,1158 :: 		}
L_end_FT5XX6_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FT5XX6_Config
_Start_TP:
;Kalkulator_driver.c,1160 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_driver.c,1161 :: 		Init_MCU();
BL	_Init_MCU+0
;Kalkulator_driver.c,1163 :: 		InitializeTouchPanel();
BL	Kalkulator_driver_InitializeTouchPanel+0
;Kalkulator_driver.c,1164 :: 		if (FT5XX6_Config() == FT5XX6_OK) {
BL	_FT5XX6_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP89
;Kalkulator_driver.c,1165 :: 		} else {
IT	AL
BAL	L_Start_TP90
L_Start_TP89:
;Kalkulator_driver.c,1166 :: 		while(1);
L_Start_TP91:
IT	AL
BAL	L_Start_TP91
;Kalkulator_driver.c,1167 :: 		}
L_Start_TP90:
;Kalkulator_driver.c,1170 :: 		InitializeObjects();
BL	Kalkulator_driver_InitializeObjects+0
;Kalkulator_driver.c,1171 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,1172 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;Kalkulator_driver.c,1173 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;Kalkulator_driver.c,1174 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
Kalkulator_driver____?ag:
L_end_Kalkulator_driver___?ag:
BX	LR
; end of Kalkulator_driver____?ag
