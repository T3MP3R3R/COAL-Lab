TITLE Q5 (Q5.asm)
INCLUDE Irvine32.inc

.data
msg BYTE "Final value of EAX = ",0

.code
main PROC
    mov eax, 10
LoopStart:
    cmp eax, 0
    jl Done
    sub eax, 3
    jge LoopStart
Done:
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP
END main