; Write a program that prints the following star pattern using nested loops:
; *
; **
; ***
; ****
; *****
; Outer loop controls the number of rows.
; Inner loop prints stars (*) in each row using WriteChar.
INCLUDE Irvine32.inc

.code
main PROC
    mov ecx, 6
    mov ebx, 0

L1:
    mov eax, ebx
    mov edx, eax
    mov ecx, edx
L2:
    mov al, '*'
    call WriteChar
    loop L2

    call Crlf
    inc ebx
    mov ecx, 6
    sub ecx, ebx

    inc ecx
    loop L1

    exit
main ENDP

END main
