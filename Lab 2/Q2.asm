TITLE Arithmetic Operations in Assembly (Q2.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mov eax, 95
	sub eax, 31
	add eax, 240
	sub eax, 125

call DumpRegs
exit
main ENDP
END main