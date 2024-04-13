ORG 0000H    ; start (origin) at location 0

; Timer 0 initialization for 10 KHz
MOV TMOD, #01H    ; Timer 0 in mode 1
MOV TH0, #0FDH    ; Load TH0 for 10 KHz rate (high byte)
MOV TL0, #98H     ; Load TL0 for 10 KHz rate (low byte)
SETB TR0          ; Start Timer 0

; Main program loop
HERE: 
JNB TF0, HERE     ; Wait for the TF0 to roll over
CLR TF0           ; Clear the TF0 flag
CPL P2.1          ; Toggle P2.1 (serial lamp)
MOV TH0, #0FDH    ; Reload TH0
MOV TL0, #98H     ; Reload TL0

; Check for sensor input at T1
JB P3.5, INCREMENT    ; Assuming sensor is connected to T1 at P3.5
SJMP HERE

INCREMENT:
INC P0
mov p0,a           ; Increment the number of persons on P0
CJNE a, #0FFH, HERE  ; If P0 is not FFH, jump to HERE
mov P1,#0ffh           ; If FFH, then turn on LEDs connected to P1
SJMP HERE        ; Loop back to main program loop

END