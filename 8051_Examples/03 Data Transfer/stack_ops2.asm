; Stack operations Push and Pop

ORG 0000H;
MOV R0, #25H;
MOV R1, #35H;
MOV R2, #45H;
MOV R4, #65H;
MOV R3, #55H;


PUSH 0;
PUSH 1;
PUSH 2;
PUSH 3;
PUSH 4;

POP 0;
POP 1;
POP 2;
POP 3;
POP 4;

HALT : SJMP HALT
END
