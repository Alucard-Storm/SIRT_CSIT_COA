; Program to load registers from memory
; Data at 2000H -> C
; Data at 2001H -> D
; Data at 2002H -> E
; Data at 2001H -> A
;
; This program loads data from consecutive memory locations starting at 2000H
; into different registers. The data from 2001H is loaded twice - once into
; register D and once into accumulator A.
; 
; Memory map:
; 2000H: Value loaded into register C
; 2001H: Value loaded into register D and accumulator A
; 2002H: Value loaded into register E

        LDA 2000H     ; Load value from memory location 2000H into accumulator
        MOV C, A      ; Copy value from accumulator into register C
        LDA 2001H     ; Load value from memory location 2001H into accumulator
        MOV D, A      ; Copy value from accumulator into register D
        LDA 2002H     ; Load value from memory location 2002H into accumulator
        MOV E, A      ; Copy value from accumulator into register E
        LDA 2001H     ; Load value from memory location 2001H into accumulator again
        HLT           ; Halt program execution