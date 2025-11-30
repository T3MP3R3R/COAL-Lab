; Give an assembly language program to move -128 in ax and expand eax. Using shift and rotate instruction.
TITLE Q2 (Q2.asm)
INCLUDE Irvine32.inc

.code
main PROC
    mov ax, -128
    movsx eax, ax
    call WriteHex
    call Crlf
    shl eax, 1
    call WriteHex
    call Crlf
    ror eax, 4
    call WriteHex
    call Crlf

    exit
main ENDP

END main
