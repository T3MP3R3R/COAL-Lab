TITLE Task 8 (Q8.asm)
INCLUDE Irvine32.inc

.data
    srcStr  BYTE "Computer", 0
    destStr BYTE "Science", 0

.code
main PROC
    mov esi, OFFSET srcStr
    mov edi, OFFSET destStr

    mov ecx, LENGTHOF srcStr
    cld                           ; not sure if we're supposed to copy forward, but I did anyway so we repeat this ECX times
    rep movsb                     ; so we go from "Science" to "Computer"

    mov edx, OFFSET destStr
    call WriteString
    call Crlf

    exit
main ENDP
END main