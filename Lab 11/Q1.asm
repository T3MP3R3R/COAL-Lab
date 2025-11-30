; Create a procedure named Scan_String to find the index of the first occurrence of the character '#' in the given string
TITLE Q1 (Q1.asm)
INCLUDE Irvine32.inc

.data
    Str1 BYTE "127&j~3#^&*#*#45^", 0
    Index DWORD 0

.code
Scan_String PROC
    lea esi, Str1
    xor ecx, ecx
    
ScanLoop:
    mov al, byte ptr [esi]
    cmp al, '#'
    je FoundHash
    inc esi
    inc ecx
    cmp al, 0
    je NotFound
    jmp ScanLoop

FoundHash:
    mov Index, ecx
    ret

NotFound:
    mov Index, -1
    ret
Scan_String ENDP

main PROC
    lea eax, Str1
    call Scan_String
    mov eax, Index
    call WriteDec
    call Crlf
    exit
main ENDP

END main
