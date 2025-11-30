; Write a program that prints numbers from 1 to 10 using a LOOP instruction.
; Use ECX as the counter.
; Use WriteInt to display each number.
; Print each number on a new line with Crlf.
TITLE Question 2 (Q2.asm)
INCLUDE Irvine32.inc

.data
num DWORD 1

.code
main PROC
    mov ecx, 10
    mov eax, 1

L1:
    call WriteInt
    call Crlf
    inc eax
    loop L1

    exit
main ENDP

END main
