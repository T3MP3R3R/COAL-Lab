TITLE Q4 (Q4.asm)
INCLUDE Irvine32.inc

.data
msgTrue  BYTE "Condition True",0
msgFalse BYTE "Condition False",0
prompt   BYTE "Enter two numbers: ",0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString

    call ReadInt
    mov eax, eax
    mov ebx, eax
    call ReadInt
    mov eax, eax
    mov ecx, eax

    mov eax, ebx
    cmp eax, ecx
    jle ElsePart
    cmp eax, 100
    jge ElsePart

    mov edx, OFFSET msgTrue
    call WriteString
    jmp EndIfPart

ElsePart:
    mov edx, OFFSET msgFalse
    call WriteString

EndIfPart:
    call Crlf
    exit
main ENDP
END main