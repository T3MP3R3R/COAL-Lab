TITLE Q10 (Q10.asm)
INCLUDE Irvine32.inc

.data
x DWORD 84
y DWORD 36
result DWORD ?

.code
GCD PROC
    mov eax, x
    mov ebx, y
    cmp eax, 0
    jge skip1
    neg eax
skip1:
    cmp ebx, 0
    jge skip2
    neg ebx
skip2:

L1:
    mov edx, 0
    div ebx
    mov eax, ebx
    mov ebx, edx
    cmp ebx, 0
    jne L1
    mov result, eax
    ret
GCD ENDP

main PROC
    call GCD
    mov eax, result
    call WriteDec
    call Crlf
    exit
main ENDP
END main