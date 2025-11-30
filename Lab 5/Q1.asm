TITLE Task 1 (Q1.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov al, 7Fh
	add al, 1

	exit
main ENDP
END main