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