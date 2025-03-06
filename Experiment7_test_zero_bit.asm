; Program to test for zero bit in byte at 2000H
; Result stored at 2001H (00 if any bit is 0, FF if all bits are 1)
;
; This program checks each bit of a byte stored at memory location 2000H
; to determine if any bit is 0. It does this by:
; 1. Loading the byte and rotating it right 8 times
; 2. Checking the carry flag after each rotation
; 3. If carry becomes 0, we found a 0 bit
; 4. If we check all 8 bits and find no 0s, all bits must be 1
; The result FF or 00 is stored at memory location 2001H

        LDA 2000H     ; Load byte to test from memory into accumulator
        MVI B, 08H    ; Initialize counter to check all 8 bits
LOOP:   RRC           ; Rotate accumulator right, moving rightmost bit to carry
        JNC ZERO      ; If carry flag is 0, we found a 0 bit, jump to ZERO
        DCR B         ; Decrement our bit counter
        JNZ LOOP      ; If counter not zero, continue checking bits
        MVI A, 0FFH   ; If we get here, all bits were 1, load FF into accumulator
        JMP STORE     ; Jump to store the result
ZERO:   MVI A, 00H    ; Load 00 into accumulator since we found a 0 bit
STORE:  STA 2001H     ; Store the final result (FF or 00) to memory
        HLT           ; Halt program execution