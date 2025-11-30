; Write a series of instructions that shift the lowest bit of AX into the highest bit of BX
; without using the SHRD instruction.
TITLE Q4 Without SHRD (Q4.asm)
INCLUDE Irvine32.inc

.data
Val1 WORD 1001h
Val2 WORD 1234h

.code
main PROC
    mov ax, Val1
    mov bx, Val2

    shr bx, 1 ; shift bx right by 1
    mov cx, ax
    shl cx, 15 ; take the least significant bit of ax and move to MSB of cx
    or  bx, cx ; combine

    mov Val1, ax
    mov Val2, bx

    movzx eax, bx
    call WriteHex
    call Crlf

    exit
main ENDP

END main
