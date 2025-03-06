; 4:1 Multiplexer simulation in 8085
; Input data in 2000H-2003H
; Select lines in 2004H (00,01,10,11)
; Output stored in 2005H
;
; This program implements a 4:1 multiplexer that selects one of four inputs
; based on a 2-bit select line value. The select value in binary determines
; which input gets passed to the output:
; 00 -> Input at 2000H
; 01 -> Input at 2001H 
; 10 -> Input at 2002H
; 11 -> Input at 2003H

        LDA 2004H     ; Load select lines from memory location 2004H into accumulator
        MOV B, A      ; Copy select lines from accumulator to register B for safekeeping
        ANI 03H       ; Mask with 0000 0011 to ensure only lower 2 bits are considered
        CPI 00H       ; Compare accumulator with 00H to check for first input selection
        JNZ NEXT1     ; If not zero (not 00), jump to check next possibility
        LDA 2000H     ; Select first input from 2000H if select lines were 00
        JMP STORE     ; Jump to store the selected input
NEXT1:  CPI 01H       ; Compare accumulator with 01H to check for second input selection
        JNZ NEXT2     ; If not 01, jump to check next possibility
        LDA 2001H     ; Select second input from 2001H if select lines were 01
        JMP STORE     ; Jump to store the selected input
NEXT2:  CPI 02H       ; Compare accumulator with 02H to check for third input selection
        JNZ NEXT3     ; If not 02, jump to last possibility (must be 11)
        LDA 2002H     ; Select third input from 2002H if select lines were 10
        JMP STORE     ; Jump to store the selected input
NEXT3:  LDA 2003H     ; Select fourth input from 2003H if select lines were 11
STORE:  STA 2005H     ; Store the selected input to output location 2005H
        HLT           ; Halt the program execution