; Program to add 10 bytes starting from 3000H
; Result stored at 300AH
;
; This program adds 10 consecutive bytes from memory starting at address 3000H
; and stores the sum at memory location 300AH. It does this by:
; 1. Initializing HL register pair to point to first byte at 3000H
; 2. Setting counter C to 10 (0AH) for number of bytes to add
; 3. Clearing accumulator to start sum at 0
; 4. Adding each byte to accumulator in a loop
; 5. Storing final sum at 300AH

        LXI H, 3000H  ; Load starting address 3000H into HL register pair
        MVI C, 0AH    ; Initialize counter C with 10 (in hex) for number of bytes
        XRA A         ; Clear accumulator by XORing with itself (sets A to 0)
LOOP:   ADD M         ; Add byte from memory location pointed by HL to accumulator
        INX H         ; Increment HL to point to next memory location
        DCR C         ; Decrement counter C by 1
        JNZ LOOP      ; Jump back to LOOP if counter is not zero (more bytes to add)
        STA 300AH     ; Store final sum from accumulator to memory location 300AH
        HLT           ; Stop program execution