TITLE Task 6 (Q6.asm)
INCLUDE Irvine32.inc

.code
main PROC
    mov ax, 10
    add ax, 20
    mov bx, 5
    add bx, 2
    sub ax, bx
    movsx eax, ax                                           ; had to sign-extend AX into EAX to display :p
    call WriteInt
    call Crlf

    exit
main ENDP
END main