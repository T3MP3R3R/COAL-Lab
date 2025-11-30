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