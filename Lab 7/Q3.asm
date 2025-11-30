; Write an Assembly program that reads up to 5 numbers from the user. If the
; user enters 0, the program should stop taking input immediately. Use ECX as a
; counter and control the loop using LOOPNZ or LOOPNE. After the loop ends, 
; display how many valid (non-zero) numbers were entered.
INCLUDE Irvine32.inc

.data
prompt BYTE "Enter number (0 to stop): ",0
countMsg BYTE "Valid numbers entered: ",0

.code
main PROC
    mov ecx, 5
    mov ebx, 0  ; count

InputLoop:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    cmp eax, 0
    je StopInput
    inc ebx
    loopnz InputLoop   ; loop until ECX=0 or ZF=1 (0 entered)
    
StopInput:
    mov edx, OFFSET countMsg
    call WriteString
    mov eax, ebx
    call WriteInt
    call Crlf
    exit
main ENDP

END main
