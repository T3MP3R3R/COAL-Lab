TITLE Task 4 (Q4.asm)
INCLUDE Irvine32.inc

.data
arrayB BYTE 11h, 22h, 33h
arrayW WORD 4444h, 5555h, 6666h

.code
main PROC
    lea esi, arrayB
    mov al, [esi]
    inc esi
    mov al, [esi]
    inc esi
    mov al, [esi]

    lea esi, arrayW
    mov ax, [esi]
    add esi, 2
    mov ax, [esi]
    add esi, 2
    mov ax, [esi]

    exit
main ENDP
END main