TITLE My First Program (Test.asm)      ; Sets the title of the program (ignored)
INCLUDE Irvine32.inc                   ; Includes the Irvine32 library

.code                                  ; Marks the beginning of the code segment
main PROC                              ; Start of the 'main' procedure
    mov eax, 10h                       ; Move hexadecimal value 10h (16 in decimal) into register EAX
    mov ebx, 25h                       ; Move hexadecimal value 25h (37 in decimal) into register EBX
    mov ecx, 30h                       ; Move hexadecimal value 30h (48 in decimal) into register ECX
    call DumpRegs                      ; Call Irvine32 lib routine to display register contents
    exit                               ; Exit the program
main ENDP                              ; End of 'main' procedure

END main                               ; Marks the program entry point