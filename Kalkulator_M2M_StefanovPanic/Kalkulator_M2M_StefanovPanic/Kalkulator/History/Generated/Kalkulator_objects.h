typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct  Button_Round {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  TTextAlignVertical TextAlignVertical;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          Corner_Radius;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton_Round;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int           ObjectsCount;
  unsigned int           Buttons_RoundCount;
  TButton_Round          * const code *Buttons_Round;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  void          (*OnSwipeLeftPtr)();
  void          (*OnSwipeRightPtr)();
  void          (*OnSwipeUpPtr)();
  void          (*OnSwipeDownPtr)();
  void          (*OnZoomInPtr)();
  void          (*OnZoomOutPtr)();
};

extern   TScreen                Screen1;
extern   TButton_Round          ButtonRound1;
extern   TButton_Round          ButtonRound2;
extern   TButton_Round          ButtonRound3;
extern   TButton_Round          ButtonRound4;
extern   TButton_Round          ButtonRound5;
extern   TLabel                 Label1;
extern   TButton_Round          ButtonRound8;
extern   TButton_Round          ButtonRound9;
extern   TButton_Round          ButtonRound10;
extern   TButton_Round          ButtonRound11;
extern   TButton_Round          ButtonRound12;
extern   TButton_Round          ButtonRound13;
extern   TButton_Round          ButtonRound14;
extern   TButton_Round          ButtonRound15;
extern   TButton_Round          ButtonRound16;
extern   TButton_Round          ButtonRound17;
extern   TButton_Round          ButtonRound18;
extern   TButton_Round          ButtonRound19;
extern   TButton_Round          ButtonRound20;
extern   TButton_Round          ButtonRound21;
extern   TButton_Round          ButtonRound22;
extern   TButton_Round          * const code Screen1_Buttons_Round[20];
extern   TLabel                 * const code Screen1_Labels[1];

extern   TScreen                Screen2;
extern   TButton_Round          ButtonRound6;
extern   TButton_Round          * const code Screen2_Buttons_Round[1];

extern   TScreen                Screen3;
extern   TButton_Round          ButtonRound7;
extern   TButton_Round          * const code Screen3_Buttons_Round[1];


/////////////////////////
// Events Code Declarations
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
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
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);