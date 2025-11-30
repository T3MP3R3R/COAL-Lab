TITLE Arithmetic Operations in Assembly (Q5.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

    mov eax, 111b
    sub eax, 12
    add eax, 1F3h
    sub eax, 745o

    call DumpRegs
    exit
main ENDP
END main