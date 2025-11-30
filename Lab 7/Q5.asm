; Write an Assembly program that sets EAX = 10 and repeatedly subtracts 3
; while the value in EAX remains greater than or equal to zero. Use CMP and JGE
; to simulate the while loop. After the loop ends, display the final value of EAX.
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
