TITLE Arithmetic Operations in Assembly (Q4.asm)
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

    mov eax, 11010110b
    sub eax, 9C4h
    add eax, 220
    add eax, 18
    add eax, 1011110b
    sub eax, 0Dh
    add eax, 12 

    call DumpRegs
    exit
main ENDP
END main