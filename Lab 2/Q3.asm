TITLE Arithmetic Operations in Assembly (Q3.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

    mov eax, 101110b
    add eax, 50Ah
    add eax, 67
    add eax, 1010001b
    add eax, 0Fh

    call DumpRegs
    exit
main ENDP
END main