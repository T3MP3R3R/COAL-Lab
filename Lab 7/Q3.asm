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