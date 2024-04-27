_main:
;Kalkulator_main.c,18 :: 		void main() {
;Kalkulator_main.c,20 :: 		Start_TP();
BL	_Start_TP+0
;Kalkulator_main.c,22 :: 		while (1) {
L_main0:
;Kalkulator_main.c,23 :: 		Check_TP();
BL	_Check_TP+0
;Kalkulator_main.c,24 :: 		}
IT	AL
BAL	L_main0
;Kalkulator_main.c,25 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
