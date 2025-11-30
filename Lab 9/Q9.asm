TITLE Q9 (Q9.asm)
INCLUDE Irvine32.inc

.data
num1 DWORD 9
num2 DWORD 7
result DWORD ?

.code
BitwiseMultiply PROC
    mov ecx, 32
    xor edx, edx
repeatLoop:
    test ebx, 1
    jz skipAdd
    add edx, eax
skipAdd:
    shl eax, 1
    shr ebx, 1
    loop repeatLoop
    mov eax, edx
    ret
BitwiseMultiply ENDP

main PROC
    mov eax, num1
    mov ebx, num2
    call BitwiseMultiply
    mov result, eax
    call WriteDec
    call Crlf
    exit
main ENDP
END main