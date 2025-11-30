; Create a procedure that Loads an array of integer by multiplying it with Load(offset array, byte no)
TITLE Q5 (Q5.asm)
INCLUDE Irvine32.inc

.data
array DWORD 10, 20, 30, 40, 50

msg BYTE "Loaded value: ",0

.code

Load PROC
    push ebx

    mov ebx, [esp+8]
    mov ecx, [esp+12]
    mov eax, ecx
    shl eax, 2
    add ebx, eax
    mov eax, [ebx]

    pop ebx
    ret 8
Load ENDP

main PROC
    mov edx, OFFSET msg
    call WriteString
    push 2
    push OFFSET array
    call Load
    call WriteDec
    call Crlf
    exit
main ENDP

END main
