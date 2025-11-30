INCLUDE Irvine32.inc

.data
    num DWORD 5

.code
main PROC
    mov ecx, 11

L1:
    mov eax, num
    call WriteInt
    call Crlf

    inc num
    loop L1

    exit
main ENDP
END main