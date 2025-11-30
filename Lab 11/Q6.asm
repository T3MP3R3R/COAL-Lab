; Write the procedure to get_frequency Find the frequency of characters
TITLE Q6 (Q6.asm)
INCLUDE Irvine32.inc

.data
target BYTE "AAEBDCFBBC",0
freqTable DWORD 256 DUP(0)
count BYTE " appears ",0
times Byte " time(s)",0

.code
Get_frequencies PROC uses esi edi, strPtr:DWORD, freqTbl:DWORD
    mov esi, strPtr
    mov edi, freqTbl

nextChar:
    mov al, [esi]
    cmp al, 0
    je done
    movzx eax, al
    inc dword ptr [edi + eax*4]
    inc esi
    jmp nextChar

done:
    ret
Get_frequencies ENDP

main PROC
    INVOKE Get_frequencies, ADDR target, ADDR freqTable

    mov ecx, 256
    xor ebx, ebx
displayLoop:
    cmp dword ptr [freqTable + ebx*4], 0
    je skipDisplay
    mov eax, ebx
    call WriteDec
    mov edx, OFFSET count
    call WriteString
    mov eax, [freqTable + ebx*4]
    call WriteDec
    mov edx, OFFSET times
    call WriteString
    call Crlf
skipDisplay:
    inc ebx
    loop displayLoop
    exit
main ENDP

END main
