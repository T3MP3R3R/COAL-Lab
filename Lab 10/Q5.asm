; Write a program that calculates factorial of a given number n
; Make a recursive procedure named Fact that takes n as an input parameter
; Write a non-recursive version of the procedure Fact that uses a loop to calculate factorial of given number n
; Compare efficiency of both versions of the Fact procedure using GetMSeconds
TITLE Q5 (Q5.asm)
INCLUDE Irvine32.inc
.data
    prompt BYTE "Enter n: ",0
    outrec BYTE "Recursive Fact = ",0
    outloop BYTE "Loop Fact = ",0
    timeMsg BYTE "Time: ",0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov ebx, eax

    invoke GetMSeconds
    mov esi, eax
    push ebx
    call FactRec
    add esp,4
    mov ebx, eax
    invoke GetMSeconds
    sub eax, esi
    mov ecx, eax

    mov edx, OFFSET outrec
    call WriteString
    mov eax, ebx
    call WriteInt
    call CrLf
    mov edx, OFFSET timeMsg
    call WriteString
    mov eax, ecx
    call WriteInt
    call CrLf

    invoke GetMSeconds
    mov esi, eax
    push ebx
    call FactLoop
    add esp,4
    mov ebx, eax
    invoke GetMSeconds
    sub eax, esi
    mov ecx, eax

    mov edx, OFFSET outloop
    call WriteString
    mov eax, ebx
    call WriteInt
    call CrLf
    mov edx, OFFSET timeMsg
    call WriteString
    mov eax, ecx
    call WriteInt
    call CrLf
    exit
main ENDP

FactRec PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    cmp eax, 1
    jle .base
    push eax

    mov ecx, [ebp+8]
    dec ecx
    push ecx
    call FactRec
    add esp,4
    mov ecx, [ebp+8]
    imul eax, ecx
    jmp .done
.base:
    mov eax, 1
.done:
    pop ebp
    ret
FactRec ENDP

FactLoop PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov ecx, eax
    mov ebx, 1
    cmp ecx, 1
    jle .ret
.loop:
    imul ebx, ecx
    dec ecx
    cmp ecx, 1
    jg .loop
    mov eax, ebx
    jmp .done
.ret:
    mov eax, 1
.done:
    pop ebp
    ret
FactLoop ENDP

END main
