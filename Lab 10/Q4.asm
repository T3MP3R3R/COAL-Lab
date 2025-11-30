TITLE Q4 (Q4.asm)
INCLUDE Irvine32.inc
.data
    prompt BYTE "Enter a number: ",0
    outmsg BYTE "Square = ",0

.code
LocalSquare PROC
    push ebp
    enter 4,0
    mov [ebp-4], eax
    mov eax, [ebp-4]
    imul eax, [ebp-4]
    mov ebx, eax

    mov edx, OFFSET outmsg
    call WriteString
    mov eax, ebx
    call WriteInt
    call Crlf
    leave
    pop ebp
    ret
LocalSquare ENDP

main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    push eax
    call LocalSquare
    add esp,4
    exit
main ENDP
END main