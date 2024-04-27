#line 1 "E:/Kalkulator_M2M_StefanovPanic/Kalkulator/Kalkulator_driver.c"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 7 "E:/Kalkulator_M2M_StefanovPanic/Kalkulator/Kalkulator_driver.c"
sbit TFT_BLED at GPIOC_PDOR.B0;
sbit TFT_CS at GPIOC_PDOR.B11;
char TFT_DataPort at GPIOD_PDOR;
sbit TFT_RD at GPIOC_PDOR.B13;
sbit TFT_RS at GPIOC_PDOR.B12;
sbit TFT_RST at GPIOC_PDOR.B10;
sbit TFT_WR at GPIOC_PDOR.B14;






unsigned int Xcoord, Ycoord;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;


void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
 GPIOD_PDOR = (unsigned int) (_lo | (_hi << 8));
}

void Set_Index(unsigned short index) {
 TFT_RS = 0;
 Write_to_Data_Lines(0, index);
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

void Write_Command(unsigned short cmd) {
 TFT_RS = 1;
 Write_to_Data_Lines(0, cmd);
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

void Write_Data(unsigned int _data) {
 TFT_RS = 1;
 Write_to_Data_Lines( ((char *)&_data)[1] ,  ((char *)&_data)[0] );
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

static void InitializeTouchPanel() {
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_SSD1963_Board_50(800, 480);

 TFT_Set_DBC_SSD1963(255);

 PenDown = 0;
 PressedObject = 0;
 PressedObjectType = -1;
}



 TScreen* CurrentScreen;

 TScreen Screen1;
 TButton_Round ButtonRound1;
char ButtonRound1_Caption[2] = "0";

 TButton_Round ButtonRound2;
char ButtonRound2_Caption[2] = "1";

 TButton_Round ButtonRound3;
char ButtonRound3_Caption[2] = "2";

 TButton_Round ButtonRound4;
char ButtonRound4_Caption[2] = "3";

 TButton_Round ButtonRound5;
char ButtonRound5_Caption[2] = ".";

 TLabel Label1;
char Label1_Caption[2] = "";

 TButton_Round ButtonRound8;
char ButtonRound8_Caption[2] = "4";

 TButton_Round ButtonRound9;
char ButtonRound9_Caption[2] = "5";

 TButton_Round ButtonRound10;
char ButtonRound10_Caption[2] = "6";

 TButton_Round ButtonRound11;
char ButtonRound11_Caption[2] = "7";

 TButton_Round ButtonRound12;
char ButtonRound12_Caption[2] = "8";

 TButton_Round ButtonRound13;
char ButtonRound13_Caption[2] = "9";

 TButton_Round ButtonRound14;
char ButtonRound14_Caption[2] = "+";

 TButton_Round ButtonRound15;
char ButtonRound15_Caption[2] = "-";

 TButton_Round ButtonRound16;
char ButtonRound16_Caption[2] = "*";

 TButton_Round ButtonRound17;
char ButtonRound17_Caption[2] = "/";

 TButton_Round ButtonRound18;
char ButtonRound18_Caption[2] = "v";

 TButton_Round ButtonRound19;
char ButtonRound19_Caption[4] = "x^2";

 TButton_Round ButtonRound20;
char ButtonRound20_Caption[4] = "<x|";

 TButton_Round ButtonRound21;
char ButtonRound21_Caption[3] = "CE";

 TButton_Round ButtonRound22;
char ButtonRound22_Caption[2] = "=";

 TButton_Round * const code Screen1_Buttons_Round[20]=
 {
 &ButtonRound1,
 &ButtonRound2,
 &ButtonRound3,
 &ButtonRound4,
 &ButtonRound5,
 &ButtonRound8,
 &ButtonRound9,
 &ButtonRound10,
 &ButtonRound11,
 &ButtonRound12,
 &ButtonRound13,
 &ButtonRound14,
 &ButtonRound15,
 &ButtonRound16,
 &ButtonRound17,
 &ButtonRound18,
 &ButtonRound19,
 &ButtonRound20,
 &ButtonRound21,
 &ButtonRound22
 };
 TLabel * const code Screen1_Labels[1]=
 {
 &Label1
 };

 TScreen Screen2;
 TButton_Round ButtonRound6;
char ButtonRound6_Caption[5] = "back";

 TButton_Round * const code Screen2_Buttons_Round[1]=
 {
 &ButtonRound6
 };

 TScreen Screen3;
 TButton_Round ButtonRound7;
char ButtonRound7_Caption[5] = "back";

 TButton_Round * const code Screen3_Buttons_Round[1]=
 {
 &ButtonRound7
 };



static void InitializeObjects() {
 Screen1.Color = 0x34D3;
 Screen1.Width = 800;
 Screen1.Height = 480;
 Screen1.Buttons_RoundCount = 20;
 Screen1.Buttons_Round = Screen1_Buttons_Round;
 Screen1.LabelsCount = 1;
 Screen1.Labels = Screen1_Labels;
 Screen1.ObjectsCount = 21;
 Screen1.OnSwipeUpPtr = 0;
 Screen1.OnSwipeDownPtr = 0;
 Screen1.OnSwipeLeftPtr = 0;
 Screen1.OnSwipeRightPtr = 0;
 Screen1.OnZoomInPtr = 0;
 Screen1.OnZoomOutPtr = 0;

 Screen2.Color = 0x366C;
 Screen2.Width = 800;
 Screen2.Height = 480;
 Screen2.Buttons_RoundCount = 1;
 Screen2.Buttons_Round = Screen2_Buttons_Round;
 Screen2.LabelsCount = 0;
 Screen2.ObjectsCount = 1;
 Screen2.OnSwipeUpPtr = 0;
 Screen2.OnSwipeDownPtr = 0;
 Screen2.OnSwipeLeftPtr = 0;
 Screen2.OnSwipeRightPtr = 0;
 Screen2.OnZoomInPtr = 0;
 Screen2.OnZoomOutPtr = 0;

 Screen3.Color = 0xC813;
 Screen3.Width = 800;
 Screen3.Height = 480;
 Screen3.Buttons_RoundCount = 1;
 Screen3.Buttons_Round = Screen3_Buttons_Round;
 Screen3.LabelsCount = 0;
 Screen3.ObjectsCount = 1;
 Screen3.OnSwipeUpPtr = 0;
 Screen3.OnSwipeDownPtr = 0;
 Screen3.OnSwipeLeftPtr = 0;
 Screen3.OnSwipeRightPtr = 0;
 Screen3.OnZoomInPtr = 0;
 Screen3.OnZoomOutPtr = 0;


 ButtonRound1.OwnerScreen = &Screen1;
 ButtonRound1.Order = 0;
 ButtonRound1.Left = 182;
 ButtonRound1.Top = 387;
 ButtonRound1.Width = 71;
 ButtonRound1.Height = 57;
 ButtonRound1.Pen_Width = 1;
 ButtonRound1.Pen_Color = 0x0000;
 ButtonRound1.Visible = 1;
 ButtonRound1.Active = 1;
 ButtonRound1.Transparent = 1;
 ButtonRound1.Caption = ButtonRound1_Caption;
 ButtonRound1.TextAlign = _taCenter;
 ButtonRound1.TextAlignVertical= _tavMiddle;
 ButtonRound1.FontName = Tahoma11x13_Regular;
 ButtonRound1.PressColEnabled = 1;
 ButtonRound1.Font_Color = 0x0000;
 ButtonRound1.VerticalText = 0;
 ButtonRound1.Gradient = 1;
 ButtonRound1.Gradient_Orientation = 0;
 ButtonRound1.Gradient_Start_Color = 0xFFFF;
 ButtonRound1.Gradient_End_Color = 0xC618;
 ButtonRound1.Color = 0xC618;
 ButtonRound1.Press_Color = 0xE71C;
 ButtonRound1.Corner_Radius = 3;
 ButtonRound1.OnClickPtr = ispis0;

 ButtonRound2.OwnerScreen = &Screen1;
 ButtonRound2.Order = 1;
 ButtonRound2.Left = 182;
 ButtonRound2.Top = 316;
 ButtonRound2.Width = 71;
 ButtonRound2.Height = 57;
 ButtonRound2.Pen_Width = 1;
 ButtonRound2.Pen_Color = 0x0000;
 ButtonRound2.Visible = 1;
 ButtonRound2.Active = 1;
 ButtonRound2.Transparent = 1;
 ButtonRound2.Caption = ButtonRound2_Caption;
 ButtonRound2.TextAlign = _taCenter;
 ButtonRound2.TextAlignVertical= _tavMiddle;
 ButtonRound2.FontName = Tahoma11x13_Regular;
 ButtonRound2.PressColEnabled = 1;
 ButtonRound2.Font_Color = 0x0000;
 ButtonRound2.VerticalText = 0;
 ButtonRound2.Gradient = 1;
 ButtonRound2.Gradient_Orientation = 0;
 ButtonRound2.Gradient_Start_Color = 0xFFFF;
 ButtonRound2.Gradient_End_Color = 0xC618;
 ButtonRound2.Color = 0xC618;
 ButtonRound2.Press_Color = 0xE71C;
 ButtonRound2.Corner_Radius = 3;
 ButtonRound2.OnClickPtr = ispis1;

 ButtonRound3.OwnerScreen = &Screen1;
 ButtonRound3.Order = 2;
 ButtonRound3.Left = 270;
 ButtonRound3.Top = 316;
 ButtonRound3.Width = 71;
 ButtonRound3.Height = 57;
 ButtonRound3.Pen_Width = 1;
 ButtonRound3.Pen_Color = 0x0000;
 ButtonRound3.Visible = 1;
 ButtonRound3.Active = 1;
 ButtonRound3.Transparent = 1;
 ButtonRound3.Caption = ButtonRound3_Caption;
 ButtonRound3.TextAlign = _taCenter;
 ButtonRound3.TextAlignVertical= _tavMiddle;
 ButtonRound3.FontName = Tahoma11x13_Regular;
 ButtonRound3.PressColEnabled = 1;
 ButtonRound3.Font_Color = 0x0000;
 ButtonRound3.VerticalText = 0;
 ButtonRound3.Gradient = 1;
 ButtonRound3.Gradient_Orientation = 0;
 ButtonRound3.Gradient_Start_Color = 0xFFFF;
 ButtonRound3.Gradient_End_Color = 0xC618;
 ButtonRound3.Color = 0xC618;
 ButtonRound3.Press_Color = 0xE71C;
 ButtonRound3.Corner_Radius = 3;
 ButtonRound3.OnClickPtr = ispis2;

 ButtonRound4.OwnerScreen = &Screen1;
 ButtonRound4.Order = 3;
 ButtonRound4.Left = 358;
 ButtonRound4.Top = 316;
 ButtonRound4.Width = 71;
 ButtonRound4.Height = 57;
 ButtonRound4.Pen_Width = 1;
 ButtonRound4.Pen_Color = 0x0000;
 ButtonRound4.Visible = 1;
 ButtonRound4.Active = 1;
 ButtonRound4.Transparent = 1;
 ButtonRound4.Caption = ButtonRound4_Caption;
 ButtonRound4.TextAlign = _taCenter;
 ButtonRound4.TextAlignVertical= _tavMiddle;
 ButtonRound4.FontName = Tahoma11x13_Regular;
 ButtonRound4.PressColEnabled = 1;
 ButtonRound4.Font_Color = 0x0000;
 ButtonRound4.VerticalText = 0;
 ButtonRound4.Gradient = 1;
 ButtonRound4.Gradient_Orientation = 0;
 ButtonRound4.Gradient_Start_Color = 0xFFFF;
 ButtonRound4.Gradient_End_Color = 0xC618;
 ButtonRound4.Color = 0xC618;
 ButtonRound4.Press_Color = 0xE71C;
 ButtonRound4.Corner_Radius = 3;
 ButtonRound4.OnClickPtr = ispis3;

 ButtonRound5.OwnerScreen = &Screen1;
 ButtonRound5.Order = 4;
 ButtonRound5.Left = 271;
 ButtonRound5.Top = 388;
 ButtonRound5.Width = 71;
 ButtonRound5.Height = 57;
 ButtonRound5.Pen_Width = 1;
 ButtonRound5.Pen_Color = 0x0000;
 ButtonRound5.Visible = 1;
 ButtonRound5.Active = 1;
 ButtonRound5.Transparent = 1;
 ButtonRound5.Caption = ButtonRound5_Caption;
 ButtonRound5.TextAlign = _taCenter;
 ButtonRound5.TextAlignVertical= _tavMiddle;
 ButtonRound5.FontName = Tahoma11x13_Regular;
 ButtonRound5.PressColEnabled = 1;
 ButtonRound5.Font_Color = 0x0000;
 ButtonRound5.VerticalText = 0;
 ButtonRound5.Gradient = 1;
 ButtonRound5.Gradient_Orientation = 0;
 ButtonRound5.Gradient_Start_Color = 0xFFFF;
 ButtonRound5.Gradient_End_Color = 0xC618;
 ButtonRound5.Color = 0xC618;
 ButtonRound5.Press_Color = 0xE71C;
 ButtonRound5.Corner_Radius = 3;
 ButtonRound5.OnClickPtr = ispis_tacke;

 Label1.OwnerScreen = &Screen1;
 Label1.Order = 5;
 Label1.Left = 186;
 Label1.Top = 71;
 Label1.Width = 36;
 Label1.Height = 53;
 Label1.Visible = 1;
 Label1.Active = 1;
 Label1.Caption = Label1_Caption;
 Label1.FontName = Tahoma39x48_Regular;
 Label1.Font_Color = 0x0000;
 Label1.VerticalText = 0;

 ButtonRound8.OwnerScreen = &Screen1;
 ButtonRound8.Order = 6;
 ButtonRound8.Left = 182;
 ButtonRound8.Top = 246;
 ButtonRound8.Width = 71;
 ButtonRound8.Height = 57;
 ButtonRound8.Pen_Width = 1;
 ButtonRound8.Pen_Color = 0x0000;
 ButtonRound8.Visible = 1;
 ButtonRound8.Active = 1;
 ButtonRound8.Transparent = 1;
 ButtonRound8.Caption = ButtonRound8_Caption;
 ButtonRound8.TextAlign = _taCenter;
 ButtonRound8.TextAlignVertical= _tavMiddle;
 ButtonRound8.FontName = Tahoma11x13_Regular;
 ButtonRound8.PressColEnabled = 1;
 ButtonRound8.Font_Color = 0x0000;
 ButtonRound8.VerticalText = 0;
 ButtonRound8.Gradient = 1;
 ButtonRound8.Gradient_Orientation = 0;
 ButtonRound8.Gradient_Start_Color = 0xFFFF;
 ButtonRound8.Gradient_End_Color = 0xC618;
 ButtonRound8.Color = 0xC618;
 ButtonRound8.Press_Color = 0xE71C;
 ButtonRound8.Corner_Radius = 3;
 ButtonRound8.OnClickPtr = ispis4;

 ButtonRound9.OwnerScreen = &Screen1;
 ButtonRound9.Order = 7;
 ButtonRound9.Left = 270;
 ButtonRound9.Top = 246;
 ButtonRound9.Width = 71;
 ButtonRound9.Height = 57;
 ButtonRound9.Pen_Width = 1;
 ButtonRound9.Pen_Color = 0x0000;
 ButtonRound9.Visible = 1;
 ButtonRound9.Active = 1;
 ButtonRound9.Transparent = 1;
 ButtonRound9.Caption = ButtonRound9_Caption;
 ButtonRound9.TextAlign = _taCenter;
 ButtonRound9.TextAlignVertical= _tavMiddle;
 ButtonRound9.FontName = Tahoma11x13_Regular;
 ButtonRound9.PressColEnabled = 1;
 ButtonRound9.Font_Color = 0x0000;
 ButtonRound9.VerticalText = 0;
 ButtonRound9.Gradient = 1;
 ButtonRound9.Gradient_Orientation = 0;
 ButtonRound9.Gradient_Start_Color = 0xFFFF;
 ButtonRound9.Gradient_End_Color = 0xC618;
 ButtonRound9.Color = 0xC618;
 ButtonRound9.Press_Color = 0xE71C;
 ButtonRound9.Corner_Radius = 3;
 ButtonRound9.OnClickPtr = ispis5;

 ButtonRound10.OwnerScreen = &Screen1;
 ButtonRound10.Order = 8;
 ButtonRound10.Left = 358;
 ButtonRound10.Top = 246;
 ButtonRound10.Width = 71;
 ButtonRound10.Height = 57;
 ButtonRound10.Pen_Width = 1;
 ButtonRound10.Pen_Color = 0x0000;
 ButtonRound10.Visible = 1;
 ButtonRound10.Active = 1;
 ButtonRound10.Transparent = 1;
 ButtonRound10.Caption = ButtonRound10_Caption;
 ButtonRound10.TextAlign = _taCenter;
 ButtonRound10.TextAlignVertical= _tavMiddle;
 ButtonRound10.FontName = Tahoma11x13_Regular;
 ButtonRound10.PressColEnabled = 1;
 ButtonRound10.Font_Color = 0x0000;
 ButtonRound10.VerticalText = 0;
 ButtonRound10.Gradient = 1;
 ButtonRound10.Gradient_Orientation = 0;
 ButtonRound10.Gradient_Start_Color = 0xFFFF;
 ButtonRound10.Gradient_End_Color = 0xC618;
 ButtonRound10.Color = 0xC618;
 ButtonRound10.Press_Color = 0xE71C;
 ButtonRound10.Corner_Radius = 3;
 ButtonRound10.OnClickPtr = ispis6;

 ButtonRound11.OwnerScreen = &Screen1;
 ButtonRound11.Order = 9;
 ButtonRound11.Left = 182;
 ButtonRound11.Top = 175;
 ButtonRound11.Width = 71;
 ButtonRound11.Height = 57;
 ButtonRound11.Pen_Width = 1;
 ButtonRound11.Pen_Color = 0x0000;
 ButtonRound11.Visible = 1;
 ButtonRound11.Active = 1;
 ButtonRound11.Transparent = 1;
 ButtonRound11.Caption = ButtonRound11_Caption;
 ButtonRound11.TextAlign = _taCenter;
 ButtonRound11.TextAlignVertical= _tavMiddle;
 ButtonRound11.FontName = Tahoma11x13_Regular;
 ButtonRound11.PressColEnabled = 1;
 ButtonRound11.Font_Color = 0x0000;
 ButtonRound11.VerticalText = 0;
 ButtonRound11.Gradient = 1;
 ButtonRound11.Gradient_Orientation = 0;
 ButtonRound11.Gradient_Start_Color = 0xFFFF;
 ButtonRound11.Gradient_End_Color = 0xC618;
 ButtonRound11.Color = 0xC618;
 ButtonRound11.Press_Color = 0xE71C;
 ButtonRound11.Corner_Radius = 3;
 ButtonRound11.OnClickPtr = ispis7;

 ButtonRound12.OwnerScreen = &Screen1;
 ButtonRound12.Order = 10;
 ButtonRound12.Left = 270;
 ButtonRound12.Top = 175;
 ButtonRound12.Width = 71;
 ButtonRound12.Height = 57;
 ButtonRound12.Pen_Width = 1;
 ButtonRound12.Pen_Color = 0x0000;
 ButtonRound12.Visible = 1;
 ButtonRound12.Active = 1;
 ButtonRound12.Transparent = 1;
 ButtonRound12.Caption = ButtonRound12_Caption;
 ButtonRound12.TextAlign = _taCenter;
 ButtonRound12.TextAlignVertical= _tavMiddle;
 ButtonRound12.FontName = Tahoma11x13_Regular;
 ButtonRound12.PressColEnabled = 1;
 ButtonRound12.Font_Color = 0x0000;
 ButtonRound12.VerticalText = 0;
 ButtonRound12.Gradient = 1;
 ButtonRound12.Gradient_Orientation = 0;
 ButtonRound12.Gradient_Start_Color = 0xFFFF;
 ButtonRound12.Gradient_End_Color = 0xC618;
 ButtonRound12.Color = 0xC618;
 ButtonRound12.Press_Color = 0xE71C;
 ButtonRound12.Corner_Radius = 3;
 ButtonRound12.OnClickPtr = ispis8;

 ButtonRound13.OwnerScreen = &Screen1;
 ButtonRound13.Order = 11;
 ButtonRound13.Left = 358;
 ButtonRound13.Top = 175;
 ButtonRound13.Width = 71;
 ButtonRound13.Height = 57;
 ButtonRound13.Pen_Width = 1;
 ButtonRound13.Pen_Color = 0x0000;
 ButtonRound13.Visible = 1;
 ButtonRound13.Active = 1;
 ButtonRound13.Transparent = 1;
 ButtonRound13.Caption = ButtonRound13_Caption;
 ButtonRound13.TextAlign = _taCenter;
 ButtonRound13.TextAlignVertical= _tavMiddle;
 ButtonRound13.FontName = Tahoma11x13_Regular;
 ButtonRound13.PressColEnabled = 1;
 ButtonRound13.Font_Color = 0x0000;
 ButtonRound13.VerticalText = 0;
 ButtonRound13.Gradient = 1;
 ButtonRound13.Gradient_Orientation = 0;
 ButtonRound13.Gradient_Start_Color = 0xFFFF;
 ButtonRound13.Gradient_End_Color = 0xC618;
 ButtonRound13.Color = 0xC618;
 ButtonRound13.Press_Color = 0xE71C;
 ButtonRound13.Corner_Radius = 3;
 ButtonRound13.OnClickPtr = ispis9;

 ButtonRound14.OwnerScreen = &Screen1;
 ButtonRound14.Order = 12;
 ButtonRound14.Left = 446;
 ButtonRound14.Top = 175;
 ButtonRound14.Width = 71;
 ButtonRound14.Height = 57;
 ButtonRound14.Pen_Width = 1;
 ButtonRound14.Pen_Color = 0x0000;
 ButtonRound14.Visible = 1;
 ButtonRound14.Active = 1;
 ButtonRound14.Transparent = 1;
 ButtonRound14.Caption = ButtonRound14_Caption;
 ButtonRound14.TextAlign = _taCenter;
 ButtonRound14.TextAlignVertical= _tavMiddle;
 ButtonRound14.FontName = Tahoma11x13_Regular;
 ButtonRound14.PressColEnabled = 1;
 ButtonRound14.Font_Color = 0x0000;
 ButtonRound14.VerticalText = 0;
 ButtonRound14.Gradient = 1;
 ButtonRound14.Gradient_Orientation = 0;
 ButtonRound14.Gradient_Start_Color = 0xFFFF;
 ButtonRound14.Gradient_End_Color = 0xC618;
 ButtonRound14.Color = 0xC618;
 ButtonRound14.Press_Color = 0xE71C;
 ButtonRound14.Corner_Radius = 3;
 ButtonRound14.OnClickPtr = ispis_plus;

 ButtonRound15.OwnerScreen = &Screen1;
 ButtonRound15.Order = 13;
 ButtonRound15.Left = 446;
 ButtonRound15.Top = 246;
 ButtonRound15.Width = 71;
 ButtonRound15.Height = 57;
 ButtonRound15.Pen_Width = 1;
 ButtonRound15.Pen_Color = 0x0000;
 ButtonRound15.Visible = 1;
 ButtonRound15.Active = 1;
 ButtonRound15.Transparent = 1;
 ButtonRound15.Caption = ButtonRound15_Caption;
 ButtonRound15.TextAlign = _taCenter;
 ButtonRound15.TextAlignVertical= _tavMiddle;
 ButtonRound15.FontName = Tahoma11x13_Regular;
 ButtonRound15.PressColEnabled = 1;
 ButtonRound15.Font_Color = 0x0000;
 ButtonRound15.VerticalText = 0;
 ButtonRound15.Gradient = 1;
 ButtonRound15.Gradient_Orientation = 0;
 ButtonRound15.Gradient_Start_Color = 0xFFFF;
 ButtonRound15.Gradient_End_Color = 0xC618;
 ButtonRound15.Color = 0xC618;
 ButtonRound15.Press_Color = 0xE71C;
 ButtonRound15.Corner_Radius = 3;
 ButtonRound15.OnClickPtr = ispis_minus;

 ButtonRound16.OwnerScreen = &Screen1;
 ButtonRound16.Order = 14;
 ButtonRound16.Left = 446;
 ButtonRound16.Top = 316;
 ButtonRound16.Width = 71;
 ButtonRound16.Height = 57;
 ButtonRound16.Pen_Width = 1;
 ButtonRound16.Pen_Color = 0x0000;
 ButtonRound16.Visible = 1;
 ButtonRound16.Active = 1;
 ButtonRound16.Transparent = 1;
 ButtonRound16.Caption = ButtonRound16_Caption;
 ButtonRound16.TextAlign = _taCenter;
 ButtonRound16.TextAlignVertical= _tavMiddle;
 ButtonRound16.FontName = Tahoma11x13_Regular;
 ButtonRound16.PressColEnabled = 1;
 ButtonRound16.Font_Color = 0x0000;
 ButtonRound16.VerticalText = 0;
 ButtonRound16.Gradient = 1;
 ButtonRound16.Gradient_Orientation = 0;
 ButtonRound16.Gradient_Start_Color = 0xFFFF;
 ButtonRound16.Gradient_End_Color = 0xC618;
 ButtonRound16.Color = 0xC618;
 ButtonRound16.Press_Color = 0xE71C;
 ButtonRound16.Corner_Radius = 3;
 ButtonRound16.OnClickPtr = ispis_mnozenje;

 ButtonRound17.OwnerScreen = &Screen1;
 ButtonRound17.Order = 15;
 ButtonRound17.Left = 446;
 ButtonRound17.Top = 387;
 ButtonRound17.Width = 71;
 ButtonRound17.Height = 57;
 ButtonRound17.Pen_Width = 1;
 ButtonRound17.Pen_Color = 0x0000;
 ButtonRound17.Visible = 1;
 ButtonRound17.Active = 1;
 ButtonRound17.Transparent = 1;
 ButtonRound17.Caption = ButtonRound17_Caption;
 ButtonRound17.TextAlign = _taCenter;
 ButtonRound17.TextAlignVertical= _tavMiddle;
 ButtonRound17.FontName = Tahoma11x13_Regular;
 ButtonRound17.PressColEnabled = 1;
 ButtonRound17.Font_Color = 0x0000;
 ButtonRound17.VerticalText = 0;
 ButtonRound17.Gradient = 1;
 ButtonRound17.Gradient_Orientation = 0;
 ButtonRound17.Gradient_Start_Color = 0xFFFF;
 ButtonRound17.Gradient_End_Color = 0xC618;
 ButtonRound17.Color = 0xC618;
 ButtonRound17.Press_Color = 0xE71C;
 ButtonRound17.Corner_Radius = 3;
 ButtonRound17.OnClickPtr = ispis_deljenje;

 ButtonRound18.OwnerScreen = &Screen1;
 ButtonRound18.Order = 16;
 ButtonRound18.Left = 534;
 ButtonRound18.Top = 175;
 ButtonRound18.Width = 71;
 ButtonRound18.Height = 57;
 ButtonRound18.Pen_Width = 1;
 ButtonRound18.Pen_Color = 0x0000;
 ButtonRound18.Visible = 1;
 ButtonRound18.Active = 1;
 ButtonRound18.Transparent = 1;
 ButtonRound18.Caption = ButtonRound18_Caption;
 ButtonRound18.TextAlign = _taCenter;
 ButtonRound18.TextAlignVertical= _tavMiddle;
 ButtonRound18.FontName = Tahoma11x13_Regular;
 ButtonRound18.PressColEnabled = 1;
 ButtonRound18.Font_Color = 0x0000;
 ButtonRound18.VerticalText = 0;
 ButtonRound18.Gradient = 1;
 ButtonRound18.Gradient_Orientation = 0;
 ButtonRound18.Gradient_Start_Color = 0xFFFF;
 ButtonRound18.Gradient_End_Color = 0xC618;
 ButtonRound18.Color = 0xC618;
 ButtonRound18.Press_Color = 0xE71C;
 ButtonRound18.Corner_Radius = 3;
 ButtonRound18.OnClickPtr = ispis_koren;

 ButtonRound19.OwnerScreen = &Screen1;
 ButtonRound19.Order = 17;
 ButtonRound19.Left = 534;
 ButtonRound19.Top = 246;
 ButtonRound19.Width = 71;
 ButtonRound19.Height = 57;
 ButtonRound19.Pen_Width = 1;
 ButtonRound19.Pen_Color = 0x0000;
 ButtonRound19.Visible = 1;
 ButtonRound19.Active = 1;
 ButtonRound19.Transparent = 1;
 ButtonRound19.Caption = ButtonRound19_Caption;
 ButtonRound19.TextAlign = _taCenter;
 ButtonRound19.TextAlignVertical= _tavMiddle;
 ButtonRound19.FontName = Tahoma11x13_Regular;
 ButtonRound19.PressColEnabled = 1;
 ButtonRound19.Font_Color = 0x0000;
 ButtonRound19.VerticalText = 0;
 ButtonRound19.Gradient = 1;
 ButtonRound19.Gradient_Orientation = 0;
 ButtonRound19.Gradient_Start_Color = 0xFFFF;
 ButtonRound19.Gradient_End_Color = 0xC618;
 ButtonRound19.Color = 0xC618;
 ButtonRound19.Press_Color = 0xE71C;
 ButtonRound19.Corner_Radius = 3;
 ButtonRound19.OnClickPtr = ispis_kvadrat;


 ButtonRound20.OwnerScreen = &Screen1;
 ButtonRound20.Order = 18;
 ButtonRound20.Left = 534;
 ButtonRound20.Top = 316;
 ButtonRound20.Width = 71;
 ButtonRound20.Height = 57;
 ButtonRound20.Pen_Width = 1;
 ButtonRound20.Pen_Color = 0x0000;
 ButtonRound20.Visible = 1;
 ButtonRound20.Active = 1;
 ButtonRound20.Transparent = 1;
 ButtonRound20.Caption = ButtonRound20_Caption;
 ButtonRound20.TextAlign = _taCenter;
 ButtonRound20.TextAlignVertical= _tavMiddle;
 ButtonRound20.FontName = Tahoma11x13_Regular;
 ButtonRound20.PressColEnabled = 1;
 ButtonRound20.Font_Color = 0x0000;
 ButtonRound20.VerticalText = 0;
 ButtonRound20.Gradient = 1;
 ButtonRound20.Gradient_Orientation = 0;
 ButtonRound20.Gradient_Start_Color = 0xFFFF;
 ButtonRound20.Gradient_End_Color = 0xC618;
 ButtonRound20.Color = 0xC618;
 ButtonRound20.Press_Color = 0xE71C;
 ButtonRound20.Corner_Radius = 3;
 ButtonRound20.OnClickPtr = brisanje_jednog_karaktera;

 ButtonRound21.OwnerScreen = &Screen1;
 ButtonRound21.Order = 19;
 ButtonRound21.Left = 534;
 ButtonRound21.Top = 387;
 ButtonRound21.Width = 71;
 ButtonRound21.Height = 57;
 ButtonRound21.Pen_Width = 1;
 ButtonRound21.Pen_Color = 0x0000;
 ButtonRound21.Visible = 1;
 ButtonRound21.Active = 1;
 ButtonRound21.Transparent = 1;
 ButtonRound21.Caption = ButtonRound21_Caption;
 ButtonRound21.TextAlign = _taCenter;
 ButtonRound21.TextAlignVertical= _tavMiddle;
 ButtonRound21.FontName = Tahoma11x13_Regular;
 ButtonRound21.PressColEnabled = 1;
 ButtonRound21.Font_Color = 0x0000;
 ButtonRound21.VerticalText = 0;
 ButtonRound21.Gradient = 1;
 ButtonRound21.Gradient_Orientation = 0;
 ButtonRound21.Gradient_Start_Color = 0xFFFF;
 ButtonRound21.Gradient_End_Color = 0xC618;
 ButtonRound21.Color = 0xC618;
 ButtonRound21.Press_Color = 0xE71C;
 ButtonRound21.Corner_Radius = 3;
 ButtonRound21.OnClickPtr = brisanje_svih_karaktera;

 ButtonRound22.OwnerScreen = &Screen1;
 ButtonRound22.Order = 20;
 ButtonRound22.Left = 358;
 ButtonRound22.Top = 387;
 ButtonRound22.Width = 71;
 ButtonRound22.Height = 57;
 ButtonRound22.Pen_Width = 1;
 ButtonRound22.Pen_Color = 0x0000;
 ButtonRound22.Visible = 1;
 ButtonRound22.Active = 1;
 ButtonRound22.Transparent = 1;
 ButtonRound22.Caption = ButtonRound22_Caption;
 ButtonRound22.TextAlign = _taCenter;
 ButtonRound22.TextAlignVertical= _tavMiddle;
 ButtonRound22.FontName = Tahoma11x13_Regular;
 ButtonRound22.PressColEnabled = 1;
 ButtonRound22.Font_Color = 0x0000;
 ButtonRound22.VerticalText = 0;
 ButtonRound22.Gradient = 1;
 ButtonRound22.Gradient_Orientation = 0;
 ButtonRound22.Gradient_Start_Color = 0xFFFF;
 ButtonRound22.Gradient_End_Color = 0xC618;
 ButtonRound22.Color = 0xC618;
 ButtonRound22.Press_Color = 0xE71C;
 ButtonRound22.Corner_Radius = 3;
 ButtonRound22.OnClickPtr = jednako;

 ButtonRound6.OwnerScreen = &Screen2;
 ButtonRound6.Order = 0;
 ButtonRound6.Left = 248;
 ButtonRound6.Top = 132;
 ButtonRound6.Width = 187;
 ButtonRound6.Height = 130;
 ButtonRound6.Pen_Width = 1;
 ButtonRound6.Pen_Color = 0x0000;
 ButtonRound6.Visible = 1;
 ButtonRound6.Active = 1;
 ButtonRound6.Transparent = 1;
 ButtonRound6.Caption = ButtonRound6_Caption;
 ButtonRound6.TextAlign = _taCenter;
 ButtonRound6.TextAlignVertical= _tavMiddle;
 ButtonRound6.FontName = Tahoma11x13_Regular;
 ButtonRound6.PressColEnabled = 1;
 ButtonRound6.Font_Color = 0x0000;
 ButtonRound6.VerticalText = 0;
 ButtonRound6.Gradient = 1;
 ButtonRound6.Gradient_Orientation = 0;
 ButtonRound6.Gradient_Start_Color = 0xFFFF;
 ButtonRound6.Gradient_End_Color = 0xC618;
 ButtonRound6.Color = 0xC618;
 ButtonRound6.Press_Color = 0xE71C;
 ButtonRound6.Corner_Radius = 3;
 ButtonRound6.OnClickPtr = ButtonRoundBackOnClick;

 ButtonRound7.OwnerScreen = &Screen3;
 ButtonRound7.Order = 0;
 ButtonRound7.Left = 315;
 ButtonRound7.Top = 217;
 ButtonRound7.Width = 241;
 ButtonRound7.Height = 89;
 ButtonRound7.Pen_Width = 1;
 ButtonRound7.Pen_Color = 0x0000;
 ButtonRound7.Visible = 1;
 ButtonRound7.Active = 1;
 ButtonRound7.Transparent = 1;
 ButtonRound7.Caption = ButtonRound7_Caption;
 ButtonRound7.TextAlign = _taCenter;
 ButtonRound7.TextAlignVertical= _tavMiddle;
 ButtonRound7.FontName = Tahoma11x13_Regular;
 ButtonRound7.PressColEnabled = 1;
 ButtonRound7.Font_Color = 0x0000;
 ButtonRound7.VerticalText = 0;
 ButtonRound7.Gradient = 1;
 ButtonRound7.Gradient_Orientation = 0;
 ButtonRound7.Gradient_Start_Color = 0xFFFF;
 ButtonRound7.Gradient_End_Color = 0xC618;
 ButtonRound7.Color = 0xC618;
 ButtonRound7.Press_Color = 0xE71C;
 ButtonRound7.Corner_Radius = 3;
 ButtonRound7.OnClickPtr = ButtonRoundBackOnClick;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}






void DrawRoundButton(TButton_Round *Around_button) {
unsigned int ALeft, ATop;
 if (Around_button->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
 }
 TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
 TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
 if (Around_button->VerticalText != 0)
 TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
 if (Around_button->TextAlign == _taLeft)
 ALeft = Around_button->Left + 4;
 else if (Around_button->TextAlign == _taCenter)
 ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
 else if (Around_button->TextAlign == _taRight)
 ALeft = Around_button->Left + Around_button->Width - caption_length - 4;

 if (Around_button->TextAlignVertical == _tavTop)
 ATop = Around_button->Top + 3;
 else if (Around_button->TextAlignVertical == _tavMiddle)
 ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
 else if (Around_button->TextAlignVertical == _tavBottom)
 ATop = Around_button->Top + Around_button->Height - caption_height - 4;

 TFT_Write_Text(Around_button->Caption, ALeft, ATop);
 }
}

void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible != 0) {
 if (ALabel->VerticalText != 0)
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
 unsigned short round_button_idx;
 TButton_Round *local_round_button;
 unsigned short label_idx;
 TLabel *local_label;
 char save_bled;

 object_pressed = 0;
 order = 0;
 round_button_idx = 0;
 label_idx = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 TFT_BLED = 0;
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_SSD1963_Board_50(CurrentScreen->Width, CurrentScreen->Height);
 FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Fill_Screen(CurrentScreen->Color);
 TFT_Set_DBC_SSD1963(255);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
 local_round_button =  CurrentScreen->Buttons_Round[round_button_idx] ;
 if (order == local_round_button->Order) {
 round_button_idx++;
 order++;
 DrawRoundButton(local_round_button);
 }
 }

 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 }
}

void Get_Object(unsigned int X, unsigned int Y) {
 round_button_order = -1;
 label_order = -1;

 for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
 local_round_button =  CurrentScreen->Buttons_Round[_object_count] ;
 if (local_round_button->Active != 0) {
 if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
 local_round_button->Width, local_round_button->Height) == 1) {
 round_button_order = local_round_button->Order;
 exec_round_button = local_round_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
 local_label =  CurrentScreen->Labels[_object_count] ;
 if (local_label->Active != 0) {
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 label_order = local_label->Order;
 exec_label = local_label;
 }
 }
 }

 _object_count = -1;
 if (round_button_order > _object_count )
 _object_count = round_button_order;
 if (label_order > _object_count )
 _object_count = label_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
 exec_round_button = 0;
 exec_label = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->OnPressPtr != 0) {
 exec_round_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnPressPtr != 0) {
 exec_label->OnPressPtr();
 return;
 }
 }
 }

 }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

 switch (PressedObjectType) {

 case 1: {
 if (PressedObject != 0) {
 exec_round_button = (TButton_Round*)PressedObject;
 if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
 DrawRoundButton(exec_round_button);
 }
 break;
 }
 break;
 }
 }

 exec_label = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {

 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->OnUpPtr != 0)
 exec_round_button->OnUpPtr();
 if (PressedObject == (void *)exec_round_button)
 if (exec_round_button->OnClickPtr != 0)
 exec_round_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnUpPtr != 0)
 exec_label->OnUpPtr();
 if (PressedObject == (void *)exec_label)
 if (exec_label->OnClickPtr != 0)
 exec_label->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }

 }
 PressedObject = 0;
 PressedObjectType = -1;
}

void Process_TP_Down(unsigned int X, unsigned int Y) {

 object_pressed = 0;
 exec_round_button = 0;
 exec_label = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->PressColEnabled != 0) {
 object_pressed = 1;
 DrawRoundButton(exec_round_button);
 }
 PressedObject = (void *)exec_round_button;
 PressedObjectType = 1;
 if (exec_round_button->OnDownPtr != 0) {
 exec_round_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 PressedObject = (void *)exec_label;
 PressedObjectType = 2;
 if (exec_label->OnDownPtr != 0) {
 exec_label->OnDownPtr();
 return;
 }
 }
 }

 }
}

void Check_TP() {
 if (FT5XX6_PressDetect()) {
 if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {

 Process_TP_Press(Xcoord, Ycoord);
 if (PenDown == 0) {
 PenDown = 1;
 Process_TP_Down(Xcoord, Ycoord);
 }
 }
 }
 else if (PenDown == 1) {
 PenDown = 0;
 Process_TP_Up(Xcoord, Ycoord);
 }
}

void Init_MCU()
{
 GPIO_Digital_Output(&GPIOE_PDOR, _GPIO_PINMASK_24);
 GPIO_Digital_Input (&GPIOE_PDIR, _GPIO_PINMASK_25);
 GPIOE_PDOR.B24 = 1;
 while (GPIOE_PDIR.B25 == 0)
 {
 GPIOE_PDOR.B24 = 0;
 Delay_us(10);
 GPIOE_PDOR.B24 = 1;
 Delay_us(10);
 }
 I2C0_Init_Advanced(400000, &_GPIO_Module_I2C0_PE24_25);

 TFT_Set_Default_Mode();
}

char FT5XX6_Config() {
 FT5XX6_SetI2CAddress(0x38);
 if (FT5XX6_IsOperational() != FT5XX6_OK)
 return FT5XX6_FAILURE;
 FT5XX6_SetDefaultMode();
 FT5XX6_SetController(_TC_FT5X06);
 FT5XX6_SetSizeAndRotation(800,480,2);
return FT5XX6_OK;
}

void Start_TP() {
 Init_MCU();

 InitializeTouchPanel();
 if (FT5XX6_Config() == FT5XX6_OK) {
 } else {
 while(1);
 }


 InitializeObjects();
 display_width = Screen1.Width;
 display_height = Screen1.Height;
 DrawScreen(&Screen1);
}
