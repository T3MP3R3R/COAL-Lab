TITLE Task 5 (Q5.asm)
INCLUDE Irvine32.inc

.code
main PROC
    
    ; Debugged this using breakpoints to see output, which is why there's 4 calls to DumpRegs
    mov bx, 65
    call DumpRegs
    mov bx, 41h
    call DumpRegs
    mov bx, 01000001b
    call DumpRegs
    mov bx, 'A'
    call DumpRegs

    exit
main ENDP
END main