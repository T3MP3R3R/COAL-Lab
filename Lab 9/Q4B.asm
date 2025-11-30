TITLE Q4 With SHRD (Q4.asm)
INCLUDE Irvine32.inc

.data
Val1 WORD 1001h ; example values
Val2 WORD 1234h

.code
main PROC
    mov ax, Val1
    mov bx, Val2
    shrd bx, ax, 1
    mov Val1, ax
    mov Val2, bx
    movzx eax, bx
    call WriteHex
    call Crlf

    exit
main ENDP
END main