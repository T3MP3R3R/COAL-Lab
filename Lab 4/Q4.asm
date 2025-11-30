TITLE Task 4 (Q4.asm)
INCLUDE Irvine32.inc

.data 
	x BYTE 12h
	y BYTE 14h
	z BYTE 5h
	w BYTE 10h
	FinalResult WORD ?

.code
main PROC
	movzx eax, x
	movzx ebx, y
	add eax, ebx

	movzx ecx, z
	movzx edx, w
	add ecx, edx

	sub eax, ecx
	mov FinalResult, ax

	exit
main ENDP
END main