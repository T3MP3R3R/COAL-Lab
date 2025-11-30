; Create a procedure Extended_Add procedure to add two 64-bit (8-byte) integers
TITLE Another Aneurysm (Q6.asm)
INCLUDE Irvine32.inc

.data
num1L DWORD 0FFFFFFFFh
num1H DWORD 00000001h
num2L DWORD 00000002h
num2H DWORD 00000003h
sumL DWORD ?
sumH DWORD ?

.code
Extended_Add PROC
    mov eax, num1L
    add eax, num2L
    mov sumL, eax
    mov eax, num1H
    adc eax, num2H ; had to resort to add with carry
    mov sumH, eax
    ret
Extended_Add ENDP

main PROC
    call Extended_Add
    mov eax, sumH
    call WriteHex
    mov eax, sumL
    call WriteHex
    call Crlf
    exit
main ENDP

END main
