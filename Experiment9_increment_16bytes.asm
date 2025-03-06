; Program to increment 16 bytes starting from 2000H
; This program reads 16 consecutive bytes from memory starting at address 2000H,
; increments each byte by 1, and stores it back in the same memory location

        LXI H, 2000H  ; Load starting address into H-L register pair
        MVI C, 10H    ; Initialize counter C with 16 (in hex)
LOOP:   MOV A, M      ; Copy contents of memory location pointed by H-L to accumulator
        INR A         ; Increment value in accumulator by 1
        MOV M, A      ; Store incremented value back to memory location pointed by H-L
        INX H         ; Increment H-L register pair to point to next memory location
        DCR C         ; Decrement counter C
        JNZ LOOP      ; Jump back to LOOP if counter is not zero (Z flag not set)
        HLT           ; Stop program execution