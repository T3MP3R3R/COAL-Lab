TITLE Task 2 (Q2.asm)
INCLUDE Irvine32.inc

.data
    num1 SBYTE -128
    num2 BYTE 255
    temp BYTE ?

.code
main PROC 
    ; I'm displaying them just to verify that it's clear

    movsx eax, num1
    call WriteInt
    call Crlf
    movzx eax, num2
    call WriteInt
    call Crlf

    exit
main ENDP
END main