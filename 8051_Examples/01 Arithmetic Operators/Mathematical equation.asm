; Code to evaluate the expression below:
; A^2 + 4(A+C) - B/D

ORG 0000H
MOV A, #05H ; A=5, B=4, C=3, D=2
MOV B, #03H
ADD A, B
JNC L1       ; Check for carry, else jump to L1
INC R0
L1: MOV R1, A ; Move the value of A+C into register
; 4*(A+C), A+C=R1
MOV A, #04H
MOV B, R1
MUL AB
MOV R1, A
; A^2
MOV A, #05H
MOV B, A
MUL AB
MOV R2, A
; B/D ... 4/2
MOV A, #04H
MOV B, #02H
DIV AB
MOV R3, A
; A^2 + 4(A+C)
MOV A, R1
ADD A, R2
JNC L2
INC R0
L2: MOV R2, A
; R2 - B/D
MOV A, R2
MOV B, R3
SUBB A, B
MOV R4, A
DA A ; Decimal Adjust
MOV R1, A ; Store the result in R1
HALT: SJMP HALT
END
