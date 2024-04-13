; Code to sent Data through the serial port of the controller
; Copy content of P1 to Serial output port and P2


ORG 0000H

INIT:
MOV SCON, #50H ; MODE 2 8BIT UART, 1 STOP BIT
MOV TMOD, #20H ; TIMER 1 MODE 2 AUTO RELOAD
MOV TH1, #0FDH ; 9600 BAUD RATE
SETB TR1       ; RUN TIMER
MOV P1, #0FFH  ; Set all pins of port P1 as input
MOV P2, #00H 

MAIN:
MOV A, P1
MOV P2, A
MOV SBUF, A

TRANSMIT: JNB TI, TRANSMIT
CLR TI
SJMP MAIN

END
