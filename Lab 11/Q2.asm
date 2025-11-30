TITLE Q2 (Q2.asm)
INCLUDE Irvine32.inc

.data
    Str1 BYTE "127&j~3#^&*#*#45^", 0
    Index DWORD 0

.code
Scan_String PROC
    lea eax, Str1
    xor ecx, ecx
    
ScanLoop:
    mov al, byte ptr [eax]
    cmp al, dl
    je FoundChar
    inc eax
    inc ecx
    cmp al, 0
    je NotFound
    jmp ScanLoop

FoundChar:
    mov Index, ecx
    ret

NotFound:
    mov Index, -1
    ret
Scan_String ENDP

main PROC
    lea eax, Str1
    mov dl, '#'
    call Scan_String
    mov eax, Index
    call WriteDec
    call Crlf
    exit
main ENDP
END main