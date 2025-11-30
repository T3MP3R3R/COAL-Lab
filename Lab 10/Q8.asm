; Write a program which contains a procedure named TakeInput which takes input numbers from user
; And call a procedure named Armstrong which checks either a number is an Armstrong number or not
; And display the answer on console by calling anotherfunction Display
; Also show ESP values during nested function calls
TITLE Q8 (Q8.asm)
INCLUDE Irvine32.inc
.DATA
    prompt BYTE "Enter a number: ",0
    yesmsg BYTE " is an Armstrong number",0
    nomsg BYTE " is NOT an Armstrong number",0
    espmsg BYTE "ESP: ",0
.CODE
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    push eax
    call TakeInput
    add esp,4
    exit
main ENDP

TakeInput PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov edx, OFFSET espmsg
    call WriteString
    mov eax, esp
    call WriteHex
    call CrLf
    push eax
    call Armstrong
    add esp,4
    pop ebp
    ret
TakeInput ENDP

Armstrong PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov ecx, eax
    mov ebx, 0
    mov esi, ecx
    test esi, esi
    jz .zero
    mov ebx, 0
.count:
    inc ebx
    mov edx, 0
    mov eax, esi
    mov edi, 10
    div edi
    mov esi, eax
    cmp esi, 0
    jne .count
    mov eax, [ebp+8]
    mov esi, eax
    mov edi, 0
.sumloop:
    xor edx, edx
    mov ebx, 10
    div ebx
    mov eax, 1
    pop ebp
    ret
Armstrong ENDP


END main
