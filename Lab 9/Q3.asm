; The time stamp field of a file directory entry uses bits 0 through 4 for the seconds, bits 5 through 10
; for the minutes, and bits 11 through 15 for the hours. Write instructions that extract the minutes 
; And copy the value to a byte variable named bMinutes
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
