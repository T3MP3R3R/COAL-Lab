TITLE Q3 (Q3.asm)
INCLUDE Irvine32.inc
.data
    arr DWORD 20, 5, 99, 12, 0, 33, 74, 21, 66, 18, 7, 88, 90, 1, 2, 57, 42, 60, 11, 3
    minmsg BYTE "Min = ",0
    maxmsg BYTE "Max = ",0

.code

MinMaxArray PROC
    push ebp
    mov ebp, esp
    mov esi, [ebp+8]
    mov ecx, [ebp+12]

    mov eax, [esi]
    mov ebx, eax
    mov edx, eax
    add esi, 4
    dec ecx

.loop:
    cmp ecx, 0
    je .done
    mov eax, [esi]
    cmp eax, ebx
    jge .chkmax
    mov ebx, eax
.chkmax:
    cmp eax, edx
    jle .next
    mov edx, eax
.next:
    add esi, 4
    dec ecx
    jmp .loop

.done:
    mov edx, OFFSET minmsg
    call WriteString
    mov eax, ebx
    call WriteInt
    call CrLf

    mov edx, OFFSET maxmsg
    call WriteString
    mov eax, edx
    mov eax, edx
    call WriteInt
    call Crlf

    pop ebp
    ret
MinMaxArray ENDP

main PROC
    lea eax, arr
    push eax
    push 20
    call MinMaxArray
    add esp, 8
    exit
main ENDP
END main