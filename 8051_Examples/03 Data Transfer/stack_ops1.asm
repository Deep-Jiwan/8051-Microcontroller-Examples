; Stack operations 

ORG 0000H;
MOV R0, #25H;
MOV R1, #35H;
MOV R2, #45H;
MOV R3, #55H;
MOV R4, #65H;

PUSH 0;
PUSH 1;
PUSH 2;
PUSH 3;
PUSH 4;

HALT : SJMP HALT
END
