TITLE Q6 (Q6.asm)
INCLUDE Irvine32.inc

.data
num1Low  DWORD 0FFFFFFFFh
num1High DWORD 00000001h
num2Low  DWORD 00000002h
num2High DWORD 00000003h
sumLow   DWORD ?
sumHigh  DWORD ?

.code
Extended_Add PROC
    mov eax, num1Low
    add eax, num2Low
    mov sumLow, eax
    mov eax, num1High
    adc eax, num2High
    mov sumHigh, eax
    ret
Extended_Add ENDP

main PROC
    call Extended_Add
    mov eax, sumHigh
    call WriteHex
    mov eax, sumLow
    call WriteHex
    call Crlf
    exit
main ENDP
END main