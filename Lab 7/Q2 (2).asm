TITLE Q2 Signed Comparison (Q2.asm)
INCLUDE Irvine32.inc

.data
prompt BYTE "Enter three signed numbers: ",0
msg    BYTE "Largest (Signed) = ",0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString

    call ReadInt
    mov ebx, eax
    call ReadInt
    mov ecx, eax
    call ReadInt
    mov edx, eax

    mov eax, ebx
    cmp eax, ecx
    jl  L1
    jmp L2
L1:
    mov eax, ecx
L2:
    cmp eax, edx
    jl  L3
    jmp Display
L3:
    mov eax, edx
Display:
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call Crlf
    exit
main ENDP
END main