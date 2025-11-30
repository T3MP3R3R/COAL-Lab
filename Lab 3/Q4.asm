TITLE Task 4 (Q4.asm)
INCLUDE Irvine32.inc

.data
    arr1 BYTE 10 DUP(0)
    arr2 WORD 5 DUP(?)

.code
main PROC

    ; I'll be displaying the first elem of arr1 and arr2 just to verify their initialization
    mov al, arr1
    call WriteInt
    call Crlf
    mov ax, arr2                                                            ; (may be garbage)
    call WriteInt
    call Crlf

    exit
main ENDP
END main