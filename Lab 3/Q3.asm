TITLE Task 3 (Q3.asm)
INCLUDE Irvine32.inc

.data
    greeting BYTE "Good Night", 0

.code
main PROC
    mov edx, OFFSET greeting
    call WriteString
    call Crlf

    exit
main ENDP
END main