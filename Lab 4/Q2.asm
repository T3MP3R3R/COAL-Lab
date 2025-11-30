TITLE Task 2 (Q2.asm)
INCLUDE Irvine32.inc

.data 
	num1 BYTE 25
	num2 WORD 1200h
	num3 DWORD ?

.code
main PROC
	mov al, num1
	mov ax, num2

	movzx eax, al
	mov num3, eax
	movzx eax, ax
	mov num3, eax

	exit
main ENDP
END main