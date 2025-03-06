; Program to add two 16-bit numbers
; First number: 2000H (low byte), 2001H (high byte)
; Second number: 2002H (low byte), 2003H (high byte)
; Result: 2004H (low byte), 2005H (high byte)
;
; This program adds two 16-bit numbers stored in consecutive memory locations.
; The first number is stored with its low byte at 2000H and high byte at 2001H.
; The second number is stored with its low byte at 2002H and high byte at 2003H.
; The 16-bit result is stored with its low byte at 2004H and high byte at 2005H.

        LHLD 2000H    ; Load first 16-bit number into HL register pair (L=low byte, H=high byte)
        XCHG          ; Exchange contents of HL and DE (first number now in DE)
        LHLD 2002H    ; Load second 16-bit number into HL register pair
        MOV A, E      ; Move low byte of first number (E) to accumulator
        ADD L         ; Add low byte of second number (L) to accumulator
        MOV L, A      ; Store sum of low bytes back in L
        MOV A, D      ; Move high byte of first number (D) to accumulator
        ADC H         ; Add high byte of second number (H) with carry from previous addition
        MOV H, A      ; Store sum of high bytes back in H
        SHLD 2004H    ; Store complete 16-bit result in memory (2004H=low byte, 2005H=high byte)
        HLT           ; Halt program execution