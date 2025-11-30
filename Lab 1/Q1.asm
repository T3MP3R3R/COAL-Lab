TITLE DebugTest (Debug.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 10
	add eax, 20							; Add 10 and 20, result in EAX
	exit
main ENDP


END main
