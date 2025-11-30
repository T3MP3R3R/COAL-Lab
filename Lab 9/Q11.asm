TITLE Q11 (Q11.asm)
INCLUDE Irvine32.inc

.data
DecOne BYTE "100123456789765",0
DecOffset = 5

.code
WriteScaled PROC
    mov esi, OFFSET DecOne
    mov ecx, LENGTHOF DecOne - 1
L1:
    mov al, [esi]
    call WriteChar
    inc esi
    dec ecx
    cmp ecx, DecOffset
    jne skip
    mov al, '.'
    call WriteChar
skip:
    cmp ecx, 0
    jne L1
    ret
WriteScaled ENDP

main PROC
    call WriteScaled
    call Crlf
    exit
main ENDP
END main