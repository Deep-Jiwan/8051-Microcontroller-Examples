; 1.Write a program to send the message “riviera revive the era” to serial port. 
; Assume a SW is connected to pin P1.2. Monitor its status 
; and set the baud rate as follows: 
; SW = 0, 4800 baud rate SW = 1, 9600 baud rate Assume 
; XTAL = 11.0592 MHz, 8-bit data, and 1 stop bit.


ORG 0000H ;

start:
    MOV P1, #0FFH ;  P1 as  input
    MOV TMOD, #20H ; Set timer 1 mode 2
    SETB TR1 ; Start Timer 1

LOOP: 
    JB P1.2, SW_HIGH ; Check if SW is high
    MOV TH1, #0FAH ; If SW is low, set TH1 for 4800 baud rate
    SJMP CONTINUE

SW_HIGH:
    MOV TH1, #0FDH ; If SW is high, set TH1 for 9600 baud rate

CONTINUE:
    MOV SCON, #50H ; Set serial communication as mode 1, 8-bit data, 1 stop bit
    MOV TL1, TH1 ; Initialize Timer 1
    MOV DPTR, #MESSAGE ; Load address of message
    CLR A ; Clear accumulator

SEND_LOOP:
    CLR A
    MOVC A, @A+DPTR ; Move data from address pointed by DPTR to A
    CJNE A, #00H, SEND_DATA ; Check if end of message
    SJMP END_PROGRAM

SEND_DATA:
    MOV SBUF, A ; Move data from accumulator to serial buffer

WAIT_FOR_TX:
    JNB TI, WAIT_FOR_TX ; Wait for transmit completion
    CLR TI ; Clear Transmit flag
    INC DPTR ; Point to next character
    SJMP SEND_LOOP ; Repeat until end of message

END_PROGRAM:
    SJMP END_PROGRAM ; End program

ORG 200H
    MESSAGE:
    DB "riviera revive the era"; Message to be sent
END
