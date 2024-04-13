; STATE OF
; R1 = 0x00, Default State. Comparison not executed.
; R1 = 0x01, A == B
; R1 = 0x02, A > B
; R1 = 0x03, A < B

ORG 0000H
MOV A, #30H
MOV B, #35H
CJNE A,B,C2
SJMP C1;
C1:   ; A==B
MOV R1,#01H;
SJMP HALT

C2: 	; IF NOT EQUAL
SUBB A,B;
JNC G1  ; IF B IS GREATER
; A < B
MOV R1,#03H;
SJMP HALT;

G1: ;A > b
MOV R1,#02H;
SJMP HALT;

HALT: SJMP HALT
END