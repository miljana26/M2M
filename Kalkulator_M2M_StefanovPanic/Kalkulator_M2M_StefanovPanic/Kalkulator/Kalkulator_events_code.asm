_calculate:
;Kalkulator_events_code.c,18 :: 		float calculate(char *expression) {
; expression start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; expression end address is: 0 (R0)
; expression start address is: 0 (R0)
;Kalkulator_events_code.c,19 :: 		float result = 0;
;Kalkulator_events_code.c,20 :: 		float current_num = 0.0;
; current_num start address is: 24 (R6)
MOV	R1, #0
VMOV	S6, R1
;Kalkulator_events_code.c,21 :: 		char last_operator = '+';
; last_operator start address is: 16 (R4)
MOVS	R4, #43
;Kalkulator_events_code.c,22 :: 		int decimal_flag = 0;
; decimal_flag start address is: 20 (R5)
MOVW	R5, #0
SXTH	R5, R5
;Kalkulator_events_code.c,23 :: 		float decimal_multiplier = 0.1;
; decimal_multiplier start address is: 16 (R4)
MOVW	R1, #52429
MOVT	R1, #15820
VMOV	S4, R1
;Kalkulator_events_code.c,24 :: 		float intermediate_result = 0.0;
; intermediate_result start address is: 20 (R5)
MOV	R1, #0
VMOV	S5, R1
; expression end address is: 0 (R0)
; decimal_multiplier end address is: 16 (R4)
; decimal_flag end address is: 20 (R5)
; current_num end address is: 24 (R6)
; last_operator end address is: 16 (R4)
; intermediate_result end address is: 20 (R5)
VSTR	#1, S5, [SP, #4]
VSTR	#1, S4, [SP, #8]
MOV	R3, R0
VLDR	#1, S4, [SP, #8]
VLDR	#1, S5, [SP, #4]
;Kalkulator_events_code.c,26 :: 		while (*expression) {
L_calculate0:
; intermediate_result start address is: 20 (R5)
; decimal_multiplier start address is: 16 (R4)
; decimal_flag start address is: 20 (R5)
; last_operator start address is: 16 (R4)
; current_num start address is: 24 (R6)
; expression start address is: 12 (R3)
LDRB	R1, [R3, #0]
CMP	R1, #0
IT	EQ
BEQ	L_calculate1
;Kalkulator_events_code.c,27 :: 		if (isdigit(*expression)) {
LDRB	R1, [R3, #0]
UXTB	R0, R1
BL	_isdigit+0
CMP	R0, #0
IT	EQ
BEQ	L_calculate2
;Kalkulator_events_code.c,28 :: 		if (decimal_flag) {
CMP	R5, #0
IT	EQ
BEQ	L_calculate3
;Kalkulator_events_code.c,29 :: 		current_num += (*expression - '0') * decimal_multiplier;
LDRB	R1, [R3, #0]
SUBS	R1, #48
SXTH	R1, R1
VMOV	S0, R1
VCVT.F32	#1, S0, S0
VMUL.F32	S0, S0, S4
VADD.F32	S1, S6, S0
; current_num end address is: 24 (R6)
; current_num start address is: 4 (R1)
;Kalkulator_events_code.c,30 :: 		decimal_multiplier *= 0.1;
MOVW	R1, #52429
MOVT	R1, #15820
VMOV	S0, R1
VMUL.F32	S0, S4, S0
; decimal_multiplier end address is: 16 (R4)
; decimal_multiplier start address is: 0 (R0)
;Kalkulator_events_code.c,31 :: 		} else {
VMOV.F32	S4, S0
; current_num end address is: 4 (R1)
; decimal_multiplier end address is: 0 (R0)
VMOV.F32	S6, S1
IT	AL
BAL	L_calculate4
L_calculate3:
;Kalkulator_events_code.c,32 :: 		current_num = current_num * 10.0 + (*expression - '0');
; current_num start address is: 24 (R6)
; decimal_multiplier start address is: 16 (R4)
VMOV.F32	S0, #10
VMUL.F32	S1, S6, S0
; current_num end address is: 24 (R6)
LDRB	R1, [R3, #0]
SUBS	R1, #48
SXTH	R1, R1
VMOV	S0, R1
VCVT.F32	#1, S0, S0
VADD.F32	S1, S1, S0
; current_num start address is: 4 (R1)
; current_num end address is: 4 (R1)
; decimal_multiplier end address is: 16 (R4)
VMOV.F32	S6, S1
;Kalkulator_events_code.c,33 :: 		}
L_calculate4:
;Kalkulator_events_code.c,34 :: 		} else if (*expression == '.') {
; current_num start address is: 24 (R6)
; decimal_multiplier start address is: 16 (R4)
VSTR	#1, S4, [SP, #4]
STRH	R5, [SP, #8]
LDRSH	R5, [SP, #8]
VLDR	#1, S4, [SP, #4]
IT	AL
BAL	L_calculate5
L_calculate2:
LDRB	R1, [R3, #0]
CMP	R1, #46
IT	NE
BNE	L_calculate6
;Kalkulator_events_code.c,35 :: 		decimal_flag = 1;
MOVS	R5, #1
SXTH	R5, R5
;Kalkulator_events_code.c,36 :: 		} else if (*expression == '+' || *expression == '-' || *expression == '*' || *expression == '/') {
STRB	R4, [SP, #4]
VMOV.F32	S0, S5
LDRB	R4, [SP, #4]
IT	AL
BAL	L_calculate7
L_calculate6:
LDRB	R1, [R3, #0]
CMP	R1, #43
IT	EQ
BEQ	L__calculate64
LDRB	R1, [R3, #0]
CMP	R1, #45
IT	EQ
BEQ	L__calculate63
LDRB	R1, [R3, #0]
CMP	R1, #42
IT	EQ
BEQ	L__calculate62
LDRB	R1, [R3, #0]
CMP	R1, #47
IT	EQ
BEQ	L__calculate61
IT	AL
BAL	L_calculate10
; decimal_multiplier end address is: 16 (R4)
; decimal_flag end address is: 20 (R5)
L__calculate64:
L__calculate63:
L__calculate62:
L__calculate61:
;Kalkulator_events_code.c,37 :: 		switch (last_operator) {
IT	AL
BAL	L_calculate11
; last_operator end address is: 16 (R4)
;Kalkulator_events_code.c,38 :: 		case '+':
L_calculate13:
;Kalkulator_events_code.c,39 :: 		intermediate_result += current_num;
VADD.F32	S1, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
; intermediate_result start address is: 4 (R1)
;Kalkulator_events_code.c,40 :: 		break;
; intermediate_result end address is: 4 (R1)
IT	AL
BAL	L_calculate12
;Kalkulator_events_code.c,41 :: 		case '-':
L_calculate14:
;Kalkulator_events_code.c,42 :: 		intermediate_result -= current_num;
; intermediate_result start address is: 20 (R5)
; current_num start address is: 24 (R6)
VSUB.F32	S1, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
; intermediate_result start address is: 4 (R1)
;Kalkulator_events_code.c,43 :: 		break;
; intermediate_result end address is: 4 (R1)
IT	AL
BAL	L_calculate12
;Kalkulator_events_code.c,44 :: 		case '*':
L_calculate15:
;Kalkulator_events_code.c,45 :: 		intermediate_result *= current_num;
; intermediate_result start address is: 20 (R5)
; current_num start address is: 24 (R6)
VMUL.F32	S1, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
; intermediate_result start address is: 4 (R1)
;Kalkulator_events_code.c,46 :: 		break;
; intermediate_result end address is: 4 (R1)
IT	AL
BAL	L_calculate12
;Kalkulator_events_code.c,47 :: 		case '/':
L_calculate16:
;Kalkulator_events_code.c,48 :: 		if (current_num != 0) {
; intermediate_result start address is: 20 (R5)
; current_num start address is: 24 (R6)
VCMPE.F32	S6, #0
VMRS	#60, FPSCR
IT	EQ
BEQ	L_calculate17
;Kalkulator_events_code.c,49 :: 		intermediate_result /= current_num;
VDIV.F32	S0, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
; intermediate_result start address is: 0 (R0)
;Kalkulator_events_code.c,50 :: 		} else {
VMOV.F32	S1, S0
; intermediate_result end address is: 0 (R0)
IT	AL
BAL	L_calculate18
L_calculate17:
;Kalkulator_events_code.c,51 :: 		intermediate_result = 0;
MOV	R1, #0
; intermediate_result start address is: 0 (R0)
VMOV	S0, R1
; intermediate_result end address is: 0 (R0)
VMOV.F32	S1, S0
;Kalkulator_events_code.c,52 :: 		}
L_calculate18:
;Kalkulator_events_code.c,53 :: 		break;
; intermediate_result start address is: 4 (R1)
; intermediate_result end address is: 4 (R1)
IT	AL
BAL	L_calculate12
;Kalkulator_events_code.c,54 :: 		}
L_calculate11:
; intermediate_result start address is: 20 (R5)
; last_operator start address is: 16 (R4)
; current_num start address is: 24 (R6)
CMP	R4, #43
IT	EQ
BEQ	L_calculate13
CMP	R4, #45
IT	EQ
BEQ	L_calculate14
CMP	R4, #42
IT	EQ
BEQ	L_calculate15
CMP	R4, #47
IT	EQ
BEQ	L_calculate16
; current_num end address is: 24 (R6)
; last_operator end address is: 16 (R4)
; intermediate_result end address is: 20 (R5)
VMOV.F32	S1, S5
L_calculate12:
;Kalkulator_events_code.c,55 :: 		last_operator = *expression;
; intermediate_result start address is: 4 (R1)
LDRB	R1, [R3, #0]
; last_operator start address is: 0 (R0)
UXTB	R0, R1
;Kalkulator_events_code.c,56 :: 		current_num = 0;
MOV	R1, #0
; current_num start address is: 24 (R6)
VMOV	S6, R1
;Kalkulator_events_code.c,57 :: 		decimal_flag = 0;
; decimal_flag start address is: 8 (R2)
MOVS	R2, #0
SXTH	R2, R2
;Kalkulator_events_code.c,58 :: 		decimal_multiplier = 0.1;
MOVW	R1, #52429
MOVT	R1, #15820
; decimal_multiplier start address is: 0 (R0)
VMOV	S0, R1
;Kalkulator_events_code.c,59 :: 		} else if (*expression == 'r') { // Square root
; last_operator end address is: 0 (R0)
; decimal_flag end address is: 8 (R2)
; decimal_multiplier end address is: 0 (R0)
; intermediate_result end address is: 4 (R1)
UXTB	R4, R0
SXTH	R5, R2
IT	AL
BAL	L_calculate19
L_calculate10:
; intermediate_result start address is: 20 (R5)
; last_operator start address is: 16 (R4)
; decimal_flag start address is: 20 (R5)
; decimal_multiplier start address is: 16 (R4)
LDRB	R1, [R3, #0]
CMP	R1, #114
IT	NE
BNE	L_calculate20
;Kalkulator_events_code.c,60 :: 		intermediate_result += current_num;
VADD.F32	S0, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
;Kalkulator_events_code.c,61 :: 		intermediate_result = sqrt(intermediate_result);
BL	_sqrt+0
; intermediate_result start address is: 0 (R0)
;Kalkulator_events_code.c,62 :: 		current_num = 0;
MOV	R1, #0
; current_num start address is: 4 (R1)
VMOV	S1, R1
;Kalkulator_events_code.c,63 :: 		} else if (*expression == 's') { // Square
VSTR	#1, S0, [SP, #4]
; current_num end address is: 4 (R1)
; intermediate_result end address is: 0 (R0)
VMOV.F32	S0, S1
VLDR	#1, S1, [SP, #4]
IT	AL
BAL	L_calculate21
L_calculate20:
; intermediate_result start address is: 20 (R5)
; current_num start address is: 24 (R6)
LDRB	R1, [R3, #0]
CMP	R1, #115
IT	NE
BNE	L__calculate65
;Kalkulator_events_code.c,64 :: 		intermediate_result += current_num;
VADD.F32	S1, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
;Kalkulator_events_code.c,65 :: 		intermediate_result = intermediate_result * intermediate_result;
VMUL.F32	S1, S1, S1
; intermediate_result start address is: 4 (R1)
;Kalkulator_events_code.c,66 :: 		current_num = 0;
MOV	R1, #0
; current_num start address is: 0 (R0)
VMOV	S0, R1
; current_num end address is: 0 (R0)
; intermediate_result end address is: 4 (R1)
;Kalkulator_events_code.c,67 :: 		}
IT	AL
BAL	L_calculate22
L__calculate65:
;Kalkulator_events_code.c,63 :: 		} else if (*expression == 's') { // Square
VMOV.F32	S0, S6
VMOV.F32	S1, S5
;Kalkulator_events_code.c,67 :: 		}
L_calculate22:
; current_num start address is: 0 (R0)
; intermediate_result start address is: 4 (R1)
; current_num end address is: 0 (R0)
; intermediate_result end address is: 4 (R1)
L_calculate21:
; intermediate_result start address is: 4 (R1)
; current_num start address is: 0 (R0)
; current_num end address is: 0 (R0)
; intermediate_result end address is: 4 (R1)
; decimal_multiplier end address is: 16 (R4)
; decimal_flag end address is: 20 (R5)
; last_operator end address is: 16 (R4)
VMOV.F32	S6, S0
VMOV.F32	S0, S4
L_calculate19:
; decimal_multiplier start address is: 0 (R0)
; decimal_flag start address is: 20 (R5)
; current_num start address is: 24 (R6)
; last_operator start address is: 16 (R4)
; intermediate_result start address is: 4 (R1)
; decimal_multiplier end address is: 0 (R0)
; intermediate_result end address is: 4 (R1)
; decimal_flag end address is: 20 (R5)
; current_num end address is: 24 (R6)
; last_operator end address is: 16 (R4)
VMOV.F32	S4, S0
VMOV.F32	S0, S1
L_calculate7:
; intermediate_result start address is: 0 (R0)
; last_operator start address is: 16 (R4)
; current_num start address is: 24 (R6)
; decimal_flag start address is: 20 (R5)
; decimal_multiplier start address is: 16 (R4)
VSTR	#1, S4, [SP, #4]
; decimal_multiplier end address is: 16 (R4)
; decimal_flag end address is: 20 (R5)
; current_num end address is: 24 (R6)
; last_operator end address is: 16 (R4)
; intermediate_result end address is: 0 (R0)
VMOV.F32	S5, S0
VLDR	#1, S4, [SP, #4]
L_calculate5:
;Kalkulator_events_code.c,68 :: 		expression++;
; decimal_multiplier start address is: 16 (R4)
; decimal_flag start address is: 20 (R5)
; current_num start address is: 24 (R6)
; last_operator start address is: 16 (R4)
; intermediate_result start address is: 20 (R5)
ADDS	R3, R3, #1
;Kalkulator_events_code.c,69 :: 		}
VSTR	#1, S5, [SP, #4]
; decimal_multiplier end address is: 16 (R4)
; decimal_flag end address is: 20 (R5)
; expression end address is: 12 (R3)
VSTR	#1, S4, [SP, #8]
VLDR	#1, S4, [SP, #8]
VLDR	#1, S5, [SP, #4]
IT	AL
BAL	L_calculate0
L_calculate1:
;Kalkulator_events_code.c,71 :: 		switch (last_operator) {
IT	AL
BAL	L_calculate23
; last_operator end address is: 16 (R4)
;Kalkulator_events_code.c,72 :: 		case '+':
L_calculate25:
;Kalkulator_events_code.c,73 :: 		intermediate_result += current_num;
VADD.F32	S0, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
; intermediate_result start address is: 0 (R0)
;Kalkulator_events_code.c,74 :: 		break;
; intermediate_result end address is: 0 (R0)
IT	AL
BAL	L_calculate24
;Kalkulator_events_code.c,75 :: 		case '-':
L_calculate26:
;Kalkulator_events_code.c,76 :: 		intermediate_result -= current_num;
; intermediate_result start address is: 20 (R5)
; current_num start address is: 24 (R6)
VSUB.F32	S0, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
; intermediate_result start address is: 0 (R0)
;Kalkulator_events_code.c,77 :: 		break;
; intermediate_result end address is: 0 (R0)
IT	AL
BAL	L_calculate24
;Kalkulator_events_code.c,78 :: 		case '*':
L_calculate27:
;Kalkulator_events_code.c,79 :: 		intermediate_result *= current_num;
; intermediate_result start address is: 20 (R5)
; current_num start address is: 24 (R6)
VMUL.F32	S0, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
; intermediate_result start address is: 0 (R0)
;Kalkulator_events_code.c,80 :: 		break;
; intermediate_result end address is: 0 (R0)
IT	AL
BAL	L_calculate24
;Kalkulator_events_code.c,81 :: 		case '/':
L_calculate28:
;Kalkulator_events_code.c,82 :: 		if (current_num != 0) {
; intermediate_result start address is: 20 (R5)
; current_num start address is: 24 (R6)
VCMPE.F32	S6, #0
VMRS	#60, FPSCR
IT	EQ
BEQ	L_calculate29
;Kalkulator_events_code.c,83 :: 		intermediate_result /= current_num;
VDIV.F32	S0, S5, S6
; current_num end address is: 24 (R6)
; intermediate_result end address is: 20 (R5)
; intermediate_result start address is: 0 (R0)
;Kalkulator_events_code.c,84 :: 		} else {
; intermediate_result end address is: 0 (R0)
IT	AL
BAL	L_calculate30
L_calculate29:
;Kalkulator_events_code.c,85 :: 		intermediate_result = 0;
MOV	R1, #0
; intermediate_result start address is: 0 (R0)
VMOV	S0, R1
; intermediate_result end address is: 0 (R0)
;Kalkulator_events_code.c,86 :: 		}
L_calculate30:
;Kalkulator_events_code.c,87 :: 		break;
; intermediate_result start address is: 0 (R0)
; intermediate_result end address is: 0 (R0)
IT	AL
BAL	L_calculate24
;Kalkulator_events_code.c,88 :: 		}
L_calculate23:
; intermediate_result start address is: 20 (R5)
; last_operator start address is: 16 (R4)
; current_num start address is: 24 (R6)
CMP	R4, #43
IT	EQ
BEQ	L_calculate25
CMP	R4, #45
IT	EQ
BEQ	L_calculate26
CMP	R4, #42
IT	EQ
BEQ	L_calculate27
CMP	R4, #47
IT	EQ
BEQ	L_calculate28
; current_num end address is: 24 (R6)
; last_operator end address is: 16 (R4)
; intermediate_result end address is: 20 (R5)
VMOV.F32	S0, S5
L_calculate24:
;Kalkulator_events_code.c,90 :: 		return intermediate_result;
; intermediate_result start address is: 0 (R0)
; intermediate_result end address is: 0 (R0)
;Kalkulator_events_code.c,91 :: 		}
L_end_calculate:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _calculate
_jednako:
;Kalkulator_events_code.c,94 :: 		void jednako() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,96 :: 		result = calculate(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_calculate+0
MOVW	R0, #lo_addr(_result+0)
MOVT	R0, #hi_addr(_result+0)
VSTR	#1, S0, [R0, #0]
;Kalkulator_events_code.c,97 :: 		rezultat = result;
MOVW	R0, #lo_addr(_rezultat+0)
MOVT	R0, #hi_addr(_rezultat+0)
VSTR	#1, S0, [R0, #0]
;Kalkulator_events_code.c,99 :: 		if ((int)rezultat == rezultat) {
VCVT	#1, .F32, S1, S0
VMOV	R0, S1
SXTH	R0, R0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	NE
BNE	L_jednako31
;Kalkulator_events_code.c,100 :: 		sprintf(Label1.Caption, "%g", rezultat);
MOVW	R0, #lo_addr(_rezultat+0)
MOVT	R0, #hi_addr(_rezultat+0)
VLDR	#1, S0, [R0, #0]
MOVW	R1, #lo_addr(?lstr_1_Kalkulator_events_code+0)
MOVT	R1, #hi_addr(?lstr_1_Kalkulator_events_code+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
LDR	R0, [R0, #0]
VPUSH	#0, (S0)
PUSH	(R1)
PUSH	(R0)
BL	_sprintf+0
ADD	SP, SP, #12
;Kalkulator_events_code.c,101 :: 		} else {
IT	AL
BAL	L_jednako32
L_jednako31:
;Kalkulator_events_code.c,102 :: 		sprintf(Label1.Caption, "%g", rezultat);
MOVW	R0, #lo_addr(_rezultat+0)
MOVT	R0, #hi_addr(_rezultat+0)
VLDR	#1, S0, [R0, #0]
MOVW	R1, #lo_addr(?lstr_2_Kalkulator_events_code+0)
MOVT	R1, #hi_addr(?lstr_2_Kalkulator_events_code+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
LDR	R0, [R0, #0]
VPUSH	#0, (S0)
PUSH	(R1)
PUSH	(R0)
BL	_sprintf+0
ADD	SP, SP, #12
;Kalkulator_events_code.c,103 :: 		}
L_jednako32:
;Kalkulator_events_code.c,104 :: 		ClearRect(2, 2, 840, 130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,105 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,106 :: 		zakljucano = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,107 :: 		}
L_end_jednako:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _jednako
_ClearRect:
;Kalkulator_events_code.c,111 :: 		void ClearRect(int x1, int y1, int x2, int y2){
; y2 start address is: 12 (R3)
; x2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R7, R0
SXTH	R8, R1
SXTH	R9, R2
SXTH	R10, R3
; y2 end address is: 12 (R3)
; x2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 28 (R7)
; y1 start address is: 32 (R8)
; x2 start address is: 36 (R9)
; y2 start address is: 40 (R10)
;Kalkulator_events_code.c,112 :: 		TFT_Set_Pen(0x34D3,0);
MOVS	R1, #0
MOVW	R0, #13523
BL	_TFT_Set_Pen+0
;Kalkulator_events_code.c,113 :: 		TFT_Set_Brush(1,0x34D3,0,0,0,0);
MOVS	R5, #0
MOVS	R4, #0
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #13523
MOVS	R0, #1
PUSH	(R5)
PUSH	(R4)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;Kalkulator_events_code.c,114 :: 		TFT_Rectangle(x1,y1,x2,y2);
SXTH	R3, R10
; y2 end address is: 40 (R10)
SXTH	R2, R9
; x2 end address is: 36 (R9)
SXTH	R1, R8
; y1 end address is: 32 (R8)
SXTH	R0, R7
; x1 end address is: 28 (R7)
BL	_TFT_Rectangle+0
;Kalkulator_events_code.c,115 :: 		}
L_end_ClearRect:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ClearRect
_ButtonRoundBackOnClick:
;Kalkulator_events_code.c,117 :: 		void ButtonRoundBackOnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,119 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;Kalkulator_events_code.c,120 :: 		}
L_end_ButtonRoundBackOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRoundBackOnClick
_form:
;Kalkulator_events_code.c,122 :: 		void form() //genericka funkcija za formiranje stringa na displeju
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,124 :: 		duzina=strlen(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_duzina+0)
MOVT	R1, #hi_addr(_duzina+0)
STRH	R0, [R1, #0]
;Kalkulator_events_code.c,125 :: 		if(duzina<16)
CMP	R0, #16
IT	GE
BGE	L_form33
;Kalkulator_events_code.c,127 :: 		Label1.Caption = labell;
MOVW	R1, #lo_addr(_labell+0)
MOVT	R1, #hi_addr(_labell+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_events_code.c,128 :: 		ClearRect(2,2,840,130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,129 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,130 :: 		}
L_form33:
;Kalkulator_events_code.c,131 :: 		}
L_end_form:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _form
_ispis_tacke:
;Kalkulator_events_code.c,132 :: 		void ispis_tacke()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,134 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis_tacke34
;Kalkulator_events_code.c,136 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,137 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,138 :: 		strcat(labell, ".");
MOVW	R0, #lo_addr(?lstr3_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr3_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,139 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,140 :: 		}else
IT	AL
BAL	L_ispis_tacke35
L_ispis_tacke34:
;Kalkulator_events_code.c,142 :: 		strcat(labell, ".");
MOVW	R0, #lo_addr(?lstr4_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr4_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,143 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,144 :: 		}
L_ispis_tacke35:
;Kalkulator_events_code.c,145 :: 		}
L_end_ispis_tacke:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis_tacke
_ispis0:
;Kalkulator_events_code.c,147 :: 		void ispis0()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,149 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis036
;Kalkulator_events_code.c,151 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,152 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,153 :: 		strcat(labell, "0");
MOVW	R0, #lo_addr(?lstr5_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr5_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,154 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,155 :: 		}else
IT	AL
BAL	L_ispis037
L_ispis036:
;Kalkulator_events_code.c,157 :: 		strcat(labell, "0");
MOVW	R0, #lo_addr(?lstr6_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr6_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,158 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,159 :: 		}
L_ispis037:
;Kalkulator_events_code.c,160 :: 		}
L_end_ispis0:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis0
_ispis1:
;Kalkulator_events_code.c,162 :: 		void ispis1()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,164 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis138
;Kalkulator_events_code.c,166 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,167 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,168 :: 		strcat(labell, "1");
MOVW	R0, #lo_addr(?lstr7_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr7_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,169 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,170 :: 		}else
IT	AL
BAL	L_ispis139
L_ispis138:
;Kalkulator_events_code.c,172 :: 		strcat(labell, "1");
MOVW	R0, #lo_addr(?lstr8_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr8_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,173 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,174 :: 		}
L_ispis139:
;Kalkulator_events_code.c,175 :: 		}
L_end_ispis1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis1
_ispis2:
;Kalkulator_events_code.c,177 :: 		void ispis2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,179 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis240
;Kalkulator_events_code.c,181 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,182 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,183 :: 		strcat(labell, "2");
MOVW	R0, #lo_addr(?lstr9_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr9_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,184 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,185 :: 		}else
IT	AL
BAL	L_ispis241
L_ispis240:
;Kalkulator_events_code.c,187 :: 		strcat(labell, "2");
MOVW	R0, #lo_addr(?lstr10_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr10_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,188 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,189 :: 		}
L_ispis241:
;Kalkulator_events_code.c,190 :: 		}
L_end_ispis2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis2
_ispis3:
;Kalkulator_events_code.c,192 :: 		void ispis3()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,194 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis342
;Kalkulator_events_code.c,196 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,197 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,198 :: 		strcat(labell, "3");
MOVW	R0, #lo_addr(?lstr11_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr11_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,199 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,200 :: 		}else
IT	AL
BAL	L_ispis343
L_ispis342:
;Kalkulator_events_code.c,202 :: 		strcat(labell, "3");
MOVW	R0, #lo_addr(?lstr12_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr12_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,203 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,204 :: 		}
L_ispis343:
;Kalkulator_events_code.c,205 :: 		}
L_end_ispis3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis3
_ispis4:
;Kalkulator_events_code.c,207 :: 		void ispis4()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,209 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis444
;Kalkulator_events_code.c,211 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,212 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,213 :: 		strcat(labell, "4");
MOVW	R0, #lo_addr(?lstr13_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr13_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,214 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,215 :: 		}else
IT	AL
BAL	L_ispis445
L_ispis444:
;Kalkulator_events_code.c,217 :: 		strcat(labell, "4");
MOVW	R0, #lo_addr(?lstr14_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr14_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,218 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,219 :: 		}
L_ispis445:
;Kalkulator_events_code.c,220 :: 		}
L_end_ispis4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis4
_ispis5:
;Kalkulator_events_code.c,222 :: 		void ispis5()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,224 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis546
;Kalkulator_events_code.c,226 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,227 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,228 :: 		strcat(labell, "5");
MOVW	R0, #lo_addr(?lstr15_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr15_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,229 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,230 :: 		}else
IT	AL
BAL	L_ispis547
L_ispis546:
;Kalkulator_events_code.c,232 :: 		strcat(labell, "5");
MOVW	R0, #lo_addr(?lstr16_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr16_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,233 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,234 :: 		}
L_ispis547:
;Kalkulator_events_code.c,235 :: 		}
L_end_ispis5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis5
_ispis6:
;Kalkulator_events_code.c,237 :: 		void ispis6()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,239 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis648
;Kalkulator_events_code.c,241 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,242 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,243 :: 		strcat(labell, "6");
MOVW	R0, #lo_addr(?lstr17_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr17_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,244 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,245 :: 		}else
IT	AL
BAL	L_ispis649
L_ispis648:
;Kalkulator_events_code.c,247 :: 		strcat(labell, "6");
MOVW	R0, #lo_addr(?lstr18_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr18_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,248 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,249 :: 		}
L_ispis649:
;Kalkulator_events_code.c,250 :: 		}
L_end_ispis6:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis6
_ispis7:
;Kalkulator_events_code.c,252 :: 		void ispis7()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,254 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis750
;Kalkulator_events_code.c,256 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,257 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,258 :: 		strcat(labell, "7");
MOVW	R0, #lo_addr(?lstr19_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr19_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,259 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,260 :: 		}else
IT	AL
BAL	L_ispis751
L_ispis750:
;Kalkulator_events_code.c,262 :: 		strcat(labell, "7");
MOVW	R0, #lo_addr(?lstr20_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr20_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,263 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,264 :: 		}
L_ispis751:
;Kalkulator_events_code.c,265 :: 		}
L_end_ispis7:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis7
_ispis8:
;Kalkulator_events_code.c,267 :: 		void ispis8()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,269 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis852
;Kalkulator_events_code.c,271 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,272 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,273 :: 		strcat(labell, "8");
MOVW	R0, #lo_addr(?lstr21_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr21_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,274 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,275 :: 		}else
IT	AL
BAL	L_ispis853
L_ispis852:
;Kalkulator_events_code.c,277 :: 		strcat(labell, "8");
MOVW	R0, #lo_addr(?lstr22_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr22_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,278 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,279 :: 		}
L_ispis853:
;Kalkulator_events_code.c,280 :: 		}
L_end_ispis8:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis8
_ispis9:
;Kalkulator_events_code.c,282 :: 		void ispis9()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,284 :: 		if(zakljucano == 1)
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_ispis954
;Kalkulator_events_code.c,286 :: 		brisanje_svih_karaktera();
BL	_brisanje_svih_karaktera+0
;Kalkulator_events_code.c,287 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,288 :: 		strcat(labell, "9");
MOVW	R0, #lo_addr(?lstr23_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr23_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,289 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,290 :: 		}else
IT	AL
BAL	L_ispis955
L_ispis954:
;Kalkulator_events_code.c,292 :: 		strcat(labell, "9");
MOVW	R0, #lo_addr(?lstr24_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr24_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,293 :: 		form();
BL	_form+0
;Kalkulator_events_code.c,294 :: 		}
L_ispis955:
;Kalkulator_events_code.c,295 :: 		}
L_end_ispis9:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis9
_ispis_plus:
;Kalkulator_events_code.c,297 :: 		void ispis_plus()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,299 :: 		strcat(labell, "+");
MOVW	R0, #lo_addr(?lstr25_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr25_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,300 :: 		duzina=strlen(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_duzina+0)
MOVT	R1, #hi_addr(_duzina+0)
STRH	R0, [R1, #0]
;Kalkulator_events_code.c,301 :: 		Label1.Caption = labell;
MOVW	R1, #lo_addr(_labell+0)
MOVT	R1, #hi_addr(_labell+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_events_code.c,302 :: 		ClearRect(2,2,840,130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,303 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,304 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,305 :: 		}
L_end_ispis_plus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis_plus
_ispis_minus:
;Kalkulator_events_code.c,307 :: 		void ispis_minus()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,309 :: 		strcat(labell, "-");
MOVW	R0, #lo_addr(?lstr26_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr26_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,310 :: 		duzina=strlen(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_duzina+0)
MOVT	R1, #hi_addr(_duzina+0)
STRH	R0, [R1, #0]
;Kalkulator_events_code.c,311 :: 		Label1.Caption = labell;
MOVW	R1, #lo_addr(_labell+0)
MOVT	R1, #hi_addr(_labell+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_events_code.c,312 :: 		ClearRect(2,2,840,130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,313 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,314 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,315 :: 		}
L_end_ispis_minus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis_minus
_ispis_mnozenje:
;Kalkulator_events_code.c,317 :: 		void ispis_mnozenje()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,319 :: 		strcat(labell, "*");
MOVW	R0, #lo_addr(?lstr27_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr27_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,320 :: 		duzina=strlen(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_duzina+0)
MOVT	R1, #hi_addr(_duzina+0)
STRH	R0, [R1, #0]
;Kalkulator_events_code.c,321 :: 		Label1.Caption = labell;
MOVW	R1, #lo_addr(_labell+0)
MOVT	R1, #hi_addr(_labell+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_events_code.c,322 :: 		ClearRect(2,2,840,130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,323 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,324 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,325 :: 		}
L_end_ispis_mnozenje:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis_mnozenje
_ispis_deljenje:
;Kalkulator_events_code.c,327 :: 		void ispis_deljenje()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,329 :: 		strcat(labell, "/");
MOVW	R0, #lo_addr(?lstr28_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr28_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,330 :: 		duzina=strlen(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_duzina+0)
MOVT	R1, #hi_addr(_duzina+0)
STRH	R0, [R1, #0]
;Kalkulator_events_code.c,331 :: 		Label1.Caption = labell;
MOVW	R1, #lo_addr(_labell+0)
MOVT	R1, #hi_addr(_labell+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_events_code.c,332 :: 		ClearRect(2,2,840,130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,333 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,334 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,335 :: 		}
L_end_ispis_deljenje:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis_deljenje
_ispis_koren:
;Kalkulator_events_code.c,337 :: 		void ispis_koren()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,339 :: 		strcat(labell, "r");
MOVW	R0, #lo_addr(?lstr29_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr29_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,340 :: 		duzina=strlen(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_duzina+0)
MOVT	R1, #hi_addr(_duzina+0)
STRH	R0, [R1, #0]
;Kalkulator_events_code.c,341 :: 		Label1.Caption = labell;
MOVW	R1, #lo_addr(_labell+0)
MOVT	R1, #hi_addr(_labell+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_events_code.c,342 :: 		ClearRect(2,2,840,130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,343 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,344 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,345 :: 		}
L_end_ispis_koren:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis_koren
_ispis_kvadrat:
;Kalkulator_events_code.c,347 :: 		void ispis_kvadrat()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,349 :: 		strcat(labell, "s");
MOVW	R0, #lo_addr(?lstr30_Kalkulator_events_code+0)
MOVT	R0, #hi_addr(?lstr30_Kalkulator_events_code+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strcat+0
;Kalkulator_events_code.c,350 :: 		duzina=strlen(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_duzina+0)
MOVT	R1, #hi_addr(_duzina+0)
STRH	R0, [R1, #0]
;Kalkulator_events_code.c,351 :: 		Label1.Caption = labell;
MOVW	R1, #lo_addr(_labell+0)
MOVT	R1, #hi_addr(_labell+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_events_code.c,352 :: 		ClearRect(2,2,840,130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,353 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,354 :: 		zakljucano = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_zakljucano+0)
MOVT	R0, #hi_addr(_zakljucano+0)
STRH	R1, [R0, #0]
;Kalkulator_events_code.c,355 :: 		}
L_end_ispis_kvadrat:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ispis_kvadrat
_brisanje_jednog_karaktera:
;Kalkulator_events_code.c,357 :: 		void brisanje_jednog_karaktera()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,359 :: 		duzina = strlen(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_duzina+0)
MOVT	R1, #hi_addr(_duzina+0)
STRH	R0, [R1, #0]
;Kalkulator_events_code.c,361 :: 		if (duzina > 0) {
CMP	R0, #0
IT	LE
BLE	L_brisanje_jednog_karaktera56
;Kalkulator_events_code.c,362 :: 		labell[duzina - 1] = '\0';
MOVW	R0, #lo_addr(_duzina+0)
MOVT	R0, #hi_addr(_duzina+0)
LDRSH	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;Kalkulator_events_code.c,363 :: 		}
L_brisanje_jednog_karaktera56:
;Kalkulator_events_code.c,364 :: 		Label1.Caption = labell;
MOVW	R1, #lo_addr(_labell+0)
MOVT	R1, #hi_addr(_labell+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_events_code.c,365 :: 		ClearRect(2,2,840,130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,366 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,367 :: 		}
L_end_brisanje_jednog_karaktera:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _brisanje_jednog_karaktera
_brisanje_svih_karaktera:
;Kalkulator_events_code.c,369 :: 		void brisanje_svih_karaktera() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Kalkulator_events_code.c,370 :: 		duzina = strlen(labell);
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_duzina+0)
MOVT	R1, #hi_addr(_duzina+0)
STRH	R0, [R1, #0]
;Kalkulator_events_code.c,372 :: 		for(i = 0; i < duzina; i++) {
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_brisanje_svih_karaktera57:
MOVW	R0, #lo_addr(_duzina+0)
MOVT	R0, #hi_addr(_duzina+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L_brisanje_svih_karaktera58
;Kalkulator_events_code.c,373 :: 		labell[i] = '\0';
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_labell+0)
MOVT	R0, #hi_addr(_labell+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;Kalkulator_events_code.c,372 :: 		for(i = 0; i < duzina; i++) {
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;Kalkulator_events_code.c,374 :: 		}
IT	AL
BAL	L_brisanje_svih_karaktera57
L_brisanje_svih_karaktera58:
;Kalkulator_events_code.c,375 :: 		Label1.Caption = labell;
MOVW	R1, #lo_addr(_labell+0)
MOVT	R1, #hi_addr(_labell+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;Kalkulator_events_code.c,376 :: 		ClearRect(2, 2, 840, 130);
MOVS	R3, #130
SXTH	R3, R3
MOVW	R2, #840
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_ClearRect+0
;Kalkulator_events_code.c,377 :: 		DrawLabel(&Label1);
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
BL	_DrawLabel+0
;Kalkulator_events_code.c,378 :: 		}
L_end_brisanje_svih_karaktera:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _brisanje_svih_karaktera
