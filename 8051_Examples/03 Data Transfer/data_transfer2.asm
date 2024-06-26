; Code to transfer data within Code Space.

ORG 0000H;
MOV DPTR, #200H; DATA POINTER POINT TO 200H
MOV R1,#0EH; LENGTH OF STRING
MOV R0,#40H; DESTINATION ADDRESS

LOOP:   CLR A;
        MOVC A, @A+DPTR; MOVE THE DATA POINTED TO, TO THE ACCUMULATOR
        MOV @R0,A; MOVE THE COPIED DATA TO LOCAITON POINTED BY R0. @ IS DE-REFERENCE (In CPP Terms)
        INC DPTR; POINT TO THE NEXT MEM LOCATION, CHARACTER
        INC R0; INCREMENT RO, SIMILAR TO INCREMENTING INDEX..
        DJNZ R1,LOOP; DECREMENT, JUMP IF NOT ZERO TO LOOP

MOV R0,#40H; R0 IS SOURCE POINTER
MOV R1,#60H; R1 IS THE DESTINATION POINTER
MOV R3,#0EH; R3 IS THE LENGTH OF THE STRING

LOOP2:  CLR A;
        MOV A,@R0;
        MOV @R1,A;
        INC R0;
        INC R1;
        DJNZ R3,LOOP2;

HERE:   SJMP HERE;

ORG 0200H;
DB "VIT UNIVERSITY";
END