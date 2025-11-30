TITLE Task 3 (Q1.asm)
INCLUDE Irvine32.inc

COUNT = 5
LIMIT EQU 10

.data 
	Result WORD ?

.code
main PROC
	mov ax, COUNT
	add ax, LIMIT
	inc ax
	mov Result, ax

	exit
main ENDP
END main