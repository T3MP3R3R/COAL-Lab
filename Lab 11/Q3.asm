; Create IsCompare procedure to compare two strings
TITLE Q3 (Q3.asm)
INCLUDE Irvine32.inc

.data
str1 BYTE "Hello", 0
str2 BYTE "Hello", 0
str3 BYTE "World", 0

msgEqual BYTE "Equal", 0
msgNotEq BYTE "Not equal", 0

.code
IsCompare PROC
    push esi
    push edi
    mov esi, [esp + 12]
    mov edi, [esp + 16]
L1:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne N
    cmp al, 0
    je E
    inc esi
    inc edi
    jmp L1
E:
    mov eax,1
    jmp D
N:
    mov eax,0
D:
    pop edi
    pop esi
    ret 8
IsCompare ENDP

main PROC
    push OFFSET str1
    push OFFSET str2
    call IsCompare
    cmp eax,1
    jne L2
    mov edx, OFFSET msgEqual
    call WriteString
    jmp L3
L2:
    mov edx, OFFSET msgNotEq
    call WriteString
L3:
    exit
main ENDP

END main
