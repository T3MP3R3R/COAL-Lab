INCLUDE Irvine32.inc

.data
msg1 BYTE "Welcome to COAL Lab 06", 0
msg2 BYTE "Program Ended", 0

.code
main PROC
    call Clrscr
    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    ; 2 second delay, so 2000 ms
    mov eax, 2000
    call Delay

    mov edx, OFFSET msg2
    call WriteString
    call Crlf

    exit
main ENDP
END main