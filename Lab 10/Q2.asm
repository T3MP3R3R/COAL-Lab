TITLE Q2 (Q2.asm)
INCLUDE Irvine32.inc
.data
    prompt BYTE "Enter two numbers: ",0
    outmsg BYTE "GCD = ",0
    espmsg BYTE "ESP in GCD: ",0

.code
ShowESP PROC
    push ebp
    mov ebp, esp
    mov eax, esp
    mov edx, OFFSET espmsg
    call WriteString
    call WriteHex
    call Crlf
    pop ebp
    ret
ShowESP ENDP

GCD PROC
    push ebp
    mov ebp, esp
    mov eax, esp
    mov edx, OFFSET espmsg
    call WriteString
    call WriteHex
    call Crlf

    mov eax, [ebp+8]   ; a
    mov ebx, [ebp+12]  ; b

gcd_loop:
    cmp ebx, 0
    je gcd_done
    xor edx, edx
    mov ecx, eax
    cdq
    div ebx
    mov eax, ebx
    mov ebx, edx
    jmp gcd_loop

gcd_done:
    mov edx, OFFSET outmsg
    call WriteString
    call WriteInt
    call Crlf

    pop ebp
    ret
GCD ENDP

main PROC
    mov edx, OFFSET prompt
    call WriteString

    call ReadInt
    push eax
    call ReadInt
    push eax

    call ShowESP
    call GCD
    add esp, 8
    exit
main ENDP
END main