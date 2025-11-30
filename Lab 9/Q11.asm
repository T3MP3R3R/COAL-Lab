; Write a procedure named WriteScaled that outputs a decimal ASCII number with an implied decimal point
; Suppose the following number were defined as follows, where DECIMAL_OFFSET
; indicates that the decimal point must be inserted five positions from the right side of the number
; WriteScaled would display the number like this: 1001234567.89765
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
