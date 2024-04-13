; Code to implement a square wave on p2.1 using interrupts

ORG 0000H
LJMP MAIN

ORG 000BH ; Timer Interrupt
CPL P2.1
RETI

MAIN: 
    MOV TMOD,#02H
    MOV P0,#0FFH
    MOV TH0,#0D1H
    MOV IE,#82H        ; Interrupt enabled
    SETB TR0
    MOV P2, #00H
    MOV P1, #00H

BACK: 
    MOV A,P0
    MOV P1,A
    SJMP BACK
END