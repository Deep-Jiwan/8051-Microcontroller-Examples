; Code for I/O port application and generation of delay with timer (covered later on)

ORG 0000H

MAIN:
MOV P0,#55H;
MOV P1,#55H;
MOV P2,#55H;
ACALL DELAY;

MOV P0,#0AAH;
MOV P1,#0AAH;
MOV P2,#0AAH;
ACALL DELAY;
SJMP MAIN




DELAY:
MOV R0,#04H
LOOP:
MOV TL0,#00H
MOV TH0,#00H
CLR TF0;
SETB TR0;
CHECK: JNB TF0,CHECK
CLR TF0;
CLR TR0;
DJNZ R0,LOOP
RET

END