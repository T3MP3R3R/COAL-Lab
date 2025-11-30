TITLE Register-Based Expressions (Q7.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

    mov eax, 4C2h
    sub eax, ebx
    add eax, 72o
    add eax, 55
    sub eax, 11101011b
    add eax, 180

    call DumpRegs
    exit
main ENDP
END main