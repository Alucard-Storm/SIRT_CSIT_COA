; Half Adder implementation in 8085
; First number in 2000H
; Second number in 2001H
; Sum stored in 2002H
; Carry stored in 2003H
;
; A half adder adds two single binary digits and produces a sum and carry.
; Sum = A XOR B
; Carry = A AND B
;
; Example: 1 + 1 = 0 (sum) with 1 (carry)
;         1 + 0 = 1 (sum) with 0 (carry)

        LDA 2000H     ; Load first number from memory into accumulator
        MOV B, A      ; Copy first number from accumulator to register B
        LDA 2001H     ; Load second number from memory into accumulator
        XRA B         ; XOR accumulator with B to get sum (A XOR B)
        STA 2002H     ; Store sum result in memory
        LDA 2000H     ; Reload first number into accumulator
        ANA B         ; AND accumulator with B to get carry (A AND B)
        STA 2003H     ; Store carry result in memory
        HLT           ; Halt program execution