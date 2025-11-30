; Write an Assembly program that stores three 8-bit values in registers. Use
; AND, OR, and XOR instructions to clear all odd bits, set all even bits, and then
; toggle all bits. Finally, use the TEST instruction to check whether bit 0 is set in
; the final result and display "Bit 0 is ON" or "Bit 0 is OFF" using conditional jumps.
TITLE Q1 (Q1.asm)
INCLUDE Irvine32.inc

.data
msgOn  BYTE "Bit 0 is ON", 0
msgOff BYTE "Bit 0 is OFF", 0

.code
main PROC
    mov al, 10101100b
    mov bl, 11001010b
    mov cl, 11110000b

    mov al, bl
    and al, 10101010b
    or al, 01010101b

    xor al, 11111111b

    test al, 1
    jnz BitOn
    jmp BitOff

BitOn:
    mov edx, OFFSET msgOn
    call WriteString
    jmp ExitProg

BitOff:
    mov edx, OFFSET msgOff
    call WriteString

ExitProg:
    call Crlf
    exit
main ENDP

END main
