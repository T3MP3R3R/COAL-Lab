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