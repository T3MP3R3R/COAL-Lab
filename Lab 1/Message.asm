TITLE MyMessage (Message.asm)
INCLUDE Irvine32.inc

.data                                  ; Start of data segment
message BYTE "Salman Ahmed", 0         ; Define a null-terminated string

.code                                  ; Start of code segment
main PROC
    mov edx, OFFSET message            ; Load the memory address of 'message' into EDX
    call WriteString                   ; Display the string at EDX on the console
    call Crlf                          ; Print a newline (carriage return + line feed)
    exit
main ENDP

END main