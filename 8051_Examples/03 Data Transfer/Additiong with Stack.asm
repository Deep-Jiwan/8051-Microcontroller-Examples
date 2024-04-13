; Code to perfrom addition of 8 bit numbers using stack to copy data and move to ram space

org 120h
DATA_1: DB 45H,84H,15H,94H ; number 94158445H 
org 150h
DATA_2: DB 90H,61H,88H,48H ; number 48886190H 

org 0000h
mov r6,#00h ; aid pointer
mov r7,#04h
mov dptr, #120h
loop10:
movc a,@a+dptr ; now a has value pointer to
push 0E0h
inc r6
mov a, r6
djnz r7,loop10
pop 70H
pop 71H
pop 72H
pop 73H
; data 1 copied

clr a
mov r6,#00h ; aid pointer
mov r7,#04h
mov dptr, #150h
loop2:
movc a,@a+dptr ; now a has value pointer to
push 0E0h
inc r6
mov a, r6
djnz r7,loop2
pop 60H
pop 61H
pop 62H
pop 63H
; data 1 copied



mov r1,#73h
mov r0,#63h
mov r3,#04h
loop1:
mov a,@r1
mov r7,a
mov a,@r0
addc a,r7 ; add with carry generated from DA A in the previous step
da a ; if +6 is added, carry may be generated, this is handled in the next iteration using addc
mov r6,a
push 6
dec r1
dec r0
djnz r3,loop1

jc carry1
carry1: INC 40h

pop 41h
pop 42h
pop 43h
pop 44h

HERE: SJMP HERE

END

