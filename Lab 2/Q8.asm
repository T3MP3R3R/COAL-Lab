TITLE Register-Based Expressions (Q8.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

    mov ebx, 6F1h
    sub ebx, eax
    add ebx, 92d
    add ebx, 47o
    sub ebx, 11011001b
    add ebx, 6Ch

    call DumpRegs
    exit
main ENDP
END main