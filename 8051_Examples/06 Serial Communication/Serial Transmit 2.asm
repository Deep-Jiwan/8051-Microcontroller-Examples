; program to send data via serial port at 9600
; Copy data from Code space

ORG 0000H
MAIN: 
MOV DPTR,#MYDATA
MOV TMOD,#20H ; Timer 1 mode 2 auto reload
MOV TH1,#0FDH ; 9600 Baud rate
MOV SCON,#50H ; Serial communication mode 1, 8-bit data, 1 stop bit
SETB TR1 ; Start timer
MOV R1,#01EH

AGAIN:
CLR A
MOVC A,@A+DPTR
MOV SBUF,A

ERE: JNB TI,HERE
CLR TI
INC DPTR
DJNZ R1,AGAIN
SJMP MAIN
MYDATA:
DB "DEEP JIWAN - 22BCE3789 - 2024 "
END