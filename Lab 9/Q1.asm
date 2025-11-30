; Write ASM instructions that calculate EAX * 21 using binary multiplication
; Hint: 21 = 2^4+ 2^2+ 2^0
TITLE Q1 (Q1.asm)
INCLUDE Irvine32.inc

.code
main PROC
    mov eax, 5 ; example
    mov ebx, eax
    shl ebx, 4
    mov ecx, eax
    shl ecx, 2
    add eax, ebx
    add eax, ecx

    call WriteInt
    call Crlf
    exit
main ENDP

END main
