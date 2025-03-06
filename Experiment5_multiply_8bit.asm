; Program to multiply two 8-bit numbers using shift and add algorithm
; Numbers stored at 2000H and 2001H
; Result stored at 2002H (lower byte) and 2003H (upper byte)
;
; This program implements binary multiplication by repeatedly:
; 1. Checking the rightmost bit of multiplier
; 2. Adding multiplicand to result if bit is 1
; 3. Shifting multiplicand left and multiplier right
; The 16-bit result is split across two memory locations

        LDA 2000H     ; Load multiplicand from memory into accumulator
        MOV B, A      ; Store multiplicand in register B
        LDA 2001H     ; Load multiplier from memory into accumulator
        MOV C, A      ; Store multiplier in register C
        MVI D, 00H    ; Initialize upper byte of result to 0
        MVI E, 00H    ; Initialize lower byte of result to 0
        MVI H, 08H    ; Set counter for 8 iterations (8-bit multiplication)

LOOP:   MOV A, C      ; Move multiplier to accumulator
        RAR           ; Rotate accumulator right through carry
        MOV C, A      ; Save rotated multiplier back to C
        JNC SKIP      ; If rightmost bit was 0, skip addition
        
        MOV A, E      ; Load lower byte of partial result
        ADD B         ; Add multiplicand to lower byte
        MOV E, A      ; Store updated lower byte
        MOV A, D      ; Load upper byte of partial result
        ACI 00H       ; Add carry from previous addition
        MOV D, A      ; Store updated upper byte

SKIP:   MOV A, B      ; Load multiplicand into accumulator
        RAL           ; Shift multiplicand left through carry
        MOV B, A      ; Store shifted multiplicand
        DCR H         ; Decrement iteration counter
        JNZ LOOP      ; If counter not zero, continue multiplication
        
        MOV A, E      ; Load final lower byte of result
        STA 2002H     ; Store lower byte to memory
        MOV A, D      ; Load final upper byte of result
        STA 2003H     ; Store upper byte to memory
        HLT           ; End program execution