TITLE Register-Based Expressions (Q6.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

    mov edx, eax
    add edx, ebx
    sub edx, ecx
    add edx, 3
    add edx, 12h
    sub edx, 45o
    add edx, 89

    call DumpRegs
    exit
main ENDP
END main