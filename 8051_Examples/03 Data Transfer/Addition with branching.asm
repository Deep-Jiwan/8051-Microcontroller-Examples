; Code to copy data from code space and perform addition

ORG 000H
MOV DPTR,#200H; point to code space
MOV R7,#10; No of data
MAIN:CLR A
MOVC A,@A+DPTR; get data pointed 
ADD A,R2
JNC NOCARRY; jump to next if no carry
INC R3; inc if carry
NOCARRY:INC DPTR; point to next
MOV R2,A; Copy answer to r2
DJNZ R7,MAIN ; check the count, if it is not zero continue with next addition
HERE:SJMP HERE

ORG 200H
DB 30H,07H,12H,10H,8H,0a0H,0b0H,40H,20H,74H
END