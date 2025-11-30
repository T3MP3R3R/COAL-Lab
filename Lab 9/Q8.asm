; Write a program that performs simple encryption by rotating each plaintext byte a varying
; number of positions in different directions. For example, in the following array that represents the
; encryption key, a negative value indicates a rotation to the left and a positive value indicates a
; rotation to the right. The integer in each position indicates the magnitude of the rotation:
; key BYTE 2, 4, 1, 0, 3, 5, 2, 4, 4, 6 program to write.
; One possible approach is to use a loop to shift the multiplier to the right, keeping
; track of the number of shifts that occur before the Carry flag is set. The resulting shift count can
; then be applied to the SHR instruction, using the multiplicand as the destination operand. Then,
; the same process must be repeated until you find the next highest bit in the multiplier.
TITLE Q8 (Q8.asm)
INCLUDE Irvine32.inc

.data
plainText BYTE "HELLOWORLD",0
key BYTE 2,4,1,0,3,5,2,4,4,6
cipherText BYTE LENGTHOF plainText DUP(?)

.code
main PROC
    mov esi, OFFSET plainText
    mov edi, OFFSET cipherText
    mov ecx, LENGTHOF key
    mov ebx, OFFSET key
L1:
    mov al, [esi]
    mov dl, [ebx]
    cmp al, 0
    je done
    cmp dl, 0
    je skip
    js left
    mov cl, dl
    rol al, cl
    jmp store
left:
    neg dl
    mov cl, dl
    ror al, cl
store:
    mov [edi], al
skip:
    inc esi
    inc edi
    inc ebx
    loop L1

done:
    mov edx, OFFSET cipherText
    call WriteString
    exit
main ENDP

END main
