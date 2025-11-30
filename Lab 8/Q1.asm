; Requirements:
; 1. Procedure MatrixAdd PROC - Add A+B using PUSH/POP
; 2. Procedure MatrixSub PROC - Subtract A-B using PUSH/POP
; 3. Procedure MatrixSum PROC - Sum ALL elements of result
; 4. Main calls: Add
; Display
; Sum
; Sub
; Display
; Sum
TITLE Q1 (Q1.asm)
INCLUDE Irvine32.inc

.data
A DWORD 12, 15, 7, 9
B DWORD 8, 10, 3, 5
Res DWORD 4 DUP(0)

msgAdd BYTE "=== MATRIX ADDITION ===",0
msgSub BYTE "=== MATRIX SUBTRACTION ===",0
msgSum BYTE "Total Sum: ",0
newline BYTE 0dh,0ah,0

.code

MatrixAdd PROC
    push ebp
    mov ebp, esp

    mov ecx, 4          ; 4 elements
    xor esi, esi        ; index

AddLoop:
    mov eax, A[esi*4]
    add eax, B[esi*4]
    push eax
    inc esi
    loop AddLoop

    mov ecx, 4
    xor esi, esi
PopLoopAdd:
    pop eax
    mov Res[esi*4], eax
    inc esi
    loop PopLoopAdd

    pop ebp
    ret
MatrixAdd ENDP

;----------------------------------------
MatrixSub PROC
    push ebp
    mov ebp, esp

    mov ecx, 4
    xor esi, esi

SubLoop:
    mov eax, A[esi*4]
    sub eax, B[esi*4]
    push eax
    inc esi
    loop SubLoop

    mov ecx, 4
    xor esi, esi
PopLoopSub:
    pop eax
    mov Res[esi*4], eax
    inc esi
    loop PopLoopSub

    pop ebp
    ret
MatrixSub ENDP

;----------------------------------------
MatrixSum PROC
    push ebp
    mov ebp, esp

    xor eax, eax       ; sum
    xor esi, esi
    mov ecx, 4

SumLoop:
    add eax, Res[esi*4]
    inc esi
    loop SumLoop

    pop ebp
    ret
MatrixSum ENDP

;----------------------------------------
DisplayMatrix PROC
    push ebp
    mov ebp, esp

    mov esi, 0
    mov ecx, 4

DispLoop:
    mov eax, Res[esi*4]
    call WriteInt
    cmp esi, 1
    je NewLine1
    cmp esi, 3
    je NewLine2
    mov edx, OFFSET msgAdd  ; just for spacing
    inc esi
    loop DispLoop
    jmp Done

NewLine1:
    call Crlf
    inc esi
    loop DispLoop
    jmp Done

NewLine2:
    call Crlf
    inc esi
    loop DispLoop

Done:
    pop ebp
    ret
DisplayMatrix ENDP

;----------------------------------------
main PROC
    ; MATRIX ADDITION
    mov edx, OFFSET msgAdd
    call WriteString
    call Crlf

    call MatrixAdd
    call DisplayMatrix
    call MatrixSum
    mov edx, OFFSET msgSum
    call WriteString
    call WriteInt
    call Crlf

    ; MATRIX SUBTRACTION
    mov edx, OFFSET msgSub
    call WriteString
    call Crlf

    call MatrixSub
    call DisplayMatrix
    call MatrixSum
    mov edx, OFFSET msgSum
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP

END main
