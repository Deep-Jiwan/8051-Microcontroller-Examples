; Stack operations
; Using Physical Ram addresses to copy data

ORG 0000H

MOV SP,#0DH; Specify where the stack should point to
MOV 08H,#10H;
MOV 09H,#11H;
MOV 0AH,#12H;
MOV 0BH,#13H;
MOV 0CH,#14H;
MOV 0DH,#16H;

POP 0;
POP 1;
POP 2;
POP 3;
POP 4;

HALT : SJMP HALT
END
