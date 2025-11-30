; Requirements:
; Ask user to enter sentence
; Split into words and PUSH each word onto stack (programming LAST)
; POP into new array (I FIRST)
; Display reversed sentence
TITLE Q4 (Q4.asm)
INCLUDE Irvine32.inc

.data
prompt BYTE "Enter a sentence: ", 0
output BYTE "Reversed: ", 0
sentence BYTE 100 DUP(0)
space BYTE " ", 0
words DWORD 20 DUP(?)
wordCount DWORD 0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString

    mov edx, OFFSET sentence
    mov ecx, 100
    call ReadString

    mov esi, OFFSET sentence
    mov edi, OFFSET sentence
    mov ebx, 0
nextChar:
    mov al, [esi]
    cmp al, 0
    je endOfInput
    cmp al, ' '
    je storeWord
    inc esi
    jmp nextChar

storeWord:
    mov BYTE PTR [esi], 0
    push edi
    inc ebx
    mov edi, esi
    inc edi
    inc esi
    jmp nextChar

endOfInput:
    push edi
    inc ebx
    mov wordCount, ebx

    call Crlf
    mov edx, OFFSET output
    call WriteString
    mov ecx, wordCount
printWords:
    cmp ecx, 0
    je exitProc
    pop edx
    call WriteString
    mov al, ' '
    call WriteChar
    loop printWords

exitProc:
    call Crlf
    exit
main ENDP

END main
