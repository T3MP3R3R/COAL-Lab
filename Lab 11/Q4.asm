TITLE Q4 (Q4.asm)
INCLUDE Irvine32.inc

.data
str1 BYTE "Hello", 0
msgRev BYTE "Reversed: ",0

.code
Str_Reverse PROC
    push esi
    push edi
    mov esi, [esp+12]
    mov edi, esi
L1:
    mov al, [edi]
    cmp al, 0
    je L2
    inc edi
    jmp L1
L2:
    dec edi
L3:
    cmp esi, edi
    jge L4
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    inc esi
    dec edi
    jmp L3
L4:
    pop edi
    pop esi
    ret 4
Str_Reverse ENDP

main PROC
    mov edx, OFFSET msgRev
    call WriteString
    push OFFSET str1
    call Str_Reverse
    mov edx, OFFSET str1
    call WriteString
    call Crlf
    exit
main ENDP
END main