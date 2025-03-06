; Program to add two 8-bit numbers
; First number in 2000H
; Second number in 2001H
; Result stored in 2002H
;
; This program adds two 8-bit numbers stored in memory locations 2000H and 2001H.
; The result is stored in memory location 2002H.
; If the sum exceeds 8 bits (255), only the lower 8 bits are stored and
; the carry flag will be set.

        LDA 2000H     ; Load first number from memory location 2000H into accumulator
        MOV B, A      ; Copy first number from accumulator to register B for later use
        LDA 2001H     ; Load second number from memory location 2001H into accumulator
        ADD B         ; Add number in register B to accumulator (A = A + B)
        STA 2002H     ; Store sum result from accumulator to memory location 2002H
        HLT           ; Halt program execution