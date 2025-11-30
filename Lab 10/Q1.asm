TITLE Q1 (Q1.asm)
INCLUDE Irvine32.inc

.data
    prompt1 BYTE "Enter three numbers: ",0
    msg BYTE "Product = ",0

.code
ThreeProd PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    imul dword ptr [ebp+12]
    imul dword ptr [ebp+16]
    mov edx, OFFSET msg
    call WriteString
    call WriteInt
    call CrLf
    pop ebp
    ret
ThreeProd ENDP

main PROC
    call ReadInt
    push eax
    call ReadInt
    push eax
    call ReadInt
    push eax
    call ThreeProd
    add esp, 12
    exit
main ENDP
END main