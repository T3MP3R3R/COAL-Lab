TITLE Register-Based Expressions (Q9.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

    mov ecx, 101011010110b
    add ecx, 3Ah
    sub ecx, 64o
    add ecx, ebx
    sub ecx, ecx
    add ecx, 5

    call DumpRegs
    exit
main ENDP
END main