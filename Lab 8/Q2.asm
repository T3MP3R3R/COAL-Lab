; Requirements:
; Push coefficients: [3, 2, -5, 7] onto stack
; Compute powers: x=4, x2=16, x3=64 using ≥3 nested PUSH/POP per multiplication
; Multiply & ADD using stack operations ONLY (NO direct registers)
TITLE Aneurysm of The Century (Q2.asm)
INCLUDE Irvine32.inc

.data
msg1 BYTE "Enter x: ",0
msg2 BYTE "Polynomial: 3x^3 + 2x^2 - 5x + 7",0
msg3 BYTE "Result: ",0
x DWORD ?
result DWORD ?

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    mov x, eax

    mov eax, x
    imul eax, x
    imul eax, x
    mov ebx, 3
    imul eax, ebx
    push eax

    mov eax, x
    imul eax, x
    mov ebx, 2
    imul eax, ebx
    push eax

    mov eax, x
    mov ebx, -5
    imul eax, ebx
    push eax

    mov eax, 7
    push eax

    xor eax, eax
    pop ebx
    add eax, ebx
    pop ebx
    add eax, ebx
    pop ebx
    add eax, ebx
    pop ebx
    add eax, ebx

    mov result, eax

    mov edx, OFFSET msg2
    call WriteString
    call Crlf
    mov edx, OFFSET msg3
    call WriteString
    mov eax, result
    call WriteInt
    call Crlf

    exit
main ENDP

END main
