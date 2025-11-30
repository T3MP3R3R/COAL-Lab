TITLE My First Program (Q3.asm)
INCLUDE Irvine32.inc

.code
main PROC
    mov eax, 10h
    mov ebx, 25h
    mov ecx, 30h
    call DumpRegs
    exit
main ENDP


END main                               ; Marks the program entry point
