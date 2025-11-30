TITLE Q3 (Q3.asm)
INCLUDE Irvine32.inc

.data
timeField WORD 00110011010011010b ; Example time field, dunno
bMinutes  BYTE ?

.code
main PROC
    mov ax, timeField
    shr ax, 5 
    and al, 00111111b
    mov bMinutes, al
    movzx eax, bMinutes
    call WriteDec
    call Crlf

    exit
main ENDP
END main