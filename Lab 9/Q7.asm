; Write a procedure named IsPrime that sets the Zero flag if the 32-bit integer passed in the EAX register is prime
; Optimize the program’s loop to run as efficiently as possible. 
; Write a test program that prompts the user for an integer, calls IsPrime, and displays a message indicating whether or not the value is prime
; Continue prompting the user for integers and calling IsPrime until the user enters 1
; When calling WriteScaled, pass the number’s offset in EDX, the number length in ECX, and the decimal offset in EBX. 
; Write a test program that displays three numbers of different sizes.
TITLE Q7 (Q7.asm)
INCLUDE Irvine32.inc

.data
msgPrompt BYTE "Enter an integer (1 for exit): ",0
msgPrime BYTE "That is prime", 0
msgNot BYTE "That is not prime", 0
numStr BYTE 20 DUP(0)
numVal SDWORD ?

.code
IsPrime PROC
    mov ebx, 2
    mov ecx, eax
    cmp eax, 2
    jl notPrime
checkLoop:
    mov edx, 0
    div ebx
    cmp edx, 0
    je notPrime
    inc ebx
    mov edx, ebx
    imul edx, edx
    cmp edx, eax
    jle checkLoop
    xor eax, eax
    ret
notPrime:
    mov eax, 1
    ret
IsPrime ENDP

main PROC
again:
    mov edx, OFFSET msgPrompt
    call WriteString
    call ReadInt
    cmp eax, 1
    je quit
    push eax
    call IsPrime
    cmp eax, 0
    jne showNot
    mov edx, OFFSET msgPrime
    call WriteString
    call Crlf
    jmp again
showNot:
    mov edx, OFFSET msgNot
    call WriteString
    call Crlf
    jmp again
quit:
    call Crlf
    exit
main ENDP

END main
