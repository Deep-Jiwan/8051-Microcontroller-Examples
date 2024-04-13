; Code to split 45 to 4 in r2 and 5 in r3

ORG 0H      ; Start of program memory

MOV R1, #45 ; Load the number 45 into register R1

; Splitting the number 45 into individual digits
MOV A, R1   ; Move the number into accumulator
MOV B, #10  ; Load B with 10 to divide by 10
DIV AB      ; Divide the number in accumulator by 10
MOV R2, A   ; Store the quotient (4) in R2

MOV A, R1   ; Move the number into accumulator again
MOV B, #10  ; Load B with 10 again
DIV AB      ; Divide the number in accumulator by 10 again
MOV R3, B   ; Store the remainder (5) in R3

END         ; End of program