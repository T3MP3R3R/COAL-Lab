TITLE Arithmetic Operations in Assembly (Q1.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mov eax, 25
	add eax, 47
	add eax, 88
	add eax, 64
	add eax, 120h
	add eax, 27o
	sub eax, 0Ah

call DumpRegs
exit
main ENDP
END main