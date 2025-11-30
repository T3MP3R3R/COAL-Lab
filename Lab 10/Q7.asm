TITLE Q7 (Q7.asm)
INCLUDE Irvine32.inc
.data
    arr DWORD 6, 4, 9, 1, 7, 2
    n DWORD 6
    msg BYTE "Sorted array: ",0

.code
main PROC
    lea eax, arr
    push dword ptr n
    push eax
    call BubbleSort
    add esp, 8
    ; print sorted
    mov edx, OFFSET msg
    call WriteString
    mov ecx, [arr]
    ; print elements
    mov esi, OFFSET arr
    mov ecx, 6
    mov ebx, 0
.printloop:
    mov eax, [esi + ebx*4]
    call WriteInt
    call WriteString
    mov edx, OFFSET msg
    add ebx,1
    loop .printloop
    call CrLf
    exit
main ENDP

BubbleSort PROC
    push ebp
    mov ebp, esp
    mov esi, [ebp+8]
    mov ecx, [ebp+12]
    dec ecx
.outer:
    cmp ecx, 0
    jle .done
    mov ebx, 0
.inner:
    mov eax, [esi + ebx*4]
    mov edx, [esi + (ebx+1)*4]
    cmp eax, edx
    jle .next
    ; swap
    mov [esi + ebx*4], edx
    mov [esi + (ebx+1)*4], eax
.next:
    inc ebx
    cmp ebx, ecx
    jl .inner
    dec ecx
    jmp .outer
.done:
    pop ebp
    ret
BubbleSort ENDP

END main