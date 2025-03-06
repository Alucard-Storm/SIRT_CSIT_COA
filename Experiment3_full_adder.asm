; Full Adder implementation in 8085
; First number in 2000H
; Second number in 2001H
; Carry in in 2002H
; Sum stored in 2003H
; Carry out stored in 2004H
;
; A full adder adds three single binary digits (including carry in)
; and produces a sum and carry out.
; Sum = A XOR B XOR Cin
; Cout = (A AND B) OR (Cin AND (A XOR B))

        LDA 2000H     ; Load first number (A) from memory into accumulator
        MOV B, A      ; Copy first number to register B for later use
        LDA 2001H     ; Load second number (B) from memory into accumulator
        XRA B         ; XOR first two numbers (A XOR B)
        MOV C, A      ; Store intermediate XOR result in register C
        LDA 2002H     ; Load carry in (Cin) from memory into accumulator
        XRA C         ; XOR with previous result to get final sum (A XOR B XOR Cin)
        STA 2003H     ; Store sum result in memory location 2003H
        
        ; Calculate carry out using: Cout = (A AND B) OR (Cin AND (A XOR B))
        LDA 2000H     ; Reload first number (A) into accumulator
        MOV B, A      ; Copy to register B
        LDA 2001H     ; Load second number (B) into accumulator
        ANA B         ; Calculate (A AND B)
        MOV D, A      ; Store intermediate carry in register D
        
        LDA 2002H     ; Load carry in (Cin) into accumulator
        MOV B, A      ; Copy to register B
        LDA 2001H     ; Load second number again
        ANA B         ; Calculate (Cin AND B)
        ORA D         ; OR with previous carry to get final carry out
        STA 2004H     ; Store carry out result in memory location 2004H
        HLT           ; Halt program execution