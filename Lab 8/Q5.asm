; Input: n = 5 (odd number)
; Output:
; *
; ***
; *****
; ***
; *
TITLE Q5 (Q5.asm)
INCLUDE Irvine32.inc

.data
n DWORD 5
star BYTE '*',0

.code
main PROC
    mov ecx, n
    mov ebx, 1

upper:
    mov edx, OFFSET star
    mov eax, ebx
printUpper:
    cmp eax, 0
    jle upperDone
    call WriteString
    dec eax
    jmp printUpper
upperDone:
    call CrLf
    add ebx, 2
    cmp ebx, n
    jle upper
    sub ebx, 4
lower:
    cmp ebx, 0
    jle done
    mov edx, OFFSET star
    mov eax, ebx
printLower:
    cmp eax, 0
    jle lowerDone
    call WriteString
    dec eax
    jmp printLower
lowerDone:
    call CrLf
    sub ebx, 2
    jmp lower
done:
    exit

main ENDP

END main
