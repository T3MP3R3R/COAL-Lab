; Write an assembly program that displays three messages
; But use an unconditional jump (JMP) so that Message 2 is skipped, and only "Message 1" and "Message 3" appear.
TITLE Q1 (Q1.asm)
INCLUDE Irvine32.inc

.data
    msg1 BYTE "Message 1",0
    msg2 BYTE "Message 2",0
    msg3 BYTE "Message 3",0

.code
main PROC

    ; Display Message 1
    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    ; Jump over Message 2
    jmp SkipMsg2

ShowMsg2:
    mov edx, OFFSET msg2
    call WriteString
    call Crlf

SkipMsg2:
    ; Display Message 3
    mov edx, OFFSET msg3
    call WriteString
    call Crlf

    exit
main ENDP
END main
