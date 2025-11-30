; Write a program to take 4 input numbers from the users
; Then make two procedures CheckPrime and LargestPrime
; The program should first check if a given number is a prime number or not
; If all of the input numbers are prime numbers then the program should call the procedure LargestPrime
TITLE Q6 (Q6.asm)
INCLUDE Irvine32.inc
.data
    prompt BYTE "Enter 4 numbers:",0
    msgPrime BYTE "Number is prime",0
    msgNot BYTE "Number is NOT prime",0
    outLargest BYTE "Largest prime is: ",0
    nums DWORD 4 DUP(?)

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    ; read 4 numbers
    mov ecx, 4
    lea edi, nums
.readloop:
    call ReadInt
    mov [edi], eax
    add edi, 4
    loop .readloop

    mov esi, OFFSET nums
    mov ecx, 4
    mov ebx, 1
    xor edx, edx
    mov edi, 0

    mov edx, esi
    mov esi, OFFSET nums
    mov edi, 0
    mov ecx,4
    mov ebx,1
.checkloop:
    mov eax, [esi + edi*4]
    push eax
    call CheckPrime
    add esp,4
    cmp eax, 1
    jne .notallprime
    inc edi
    loop .checkloop
    call LargestPrime
    jmp .done

.notallprime:
    mov edx, OFFSET msgNot
    call WriteString
    call CrLf
    jmp .done

.done:
    exit
main ENDP

CheckPrime PROC
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    cmp eax, 2
    jl .notprime
    cmp eax, 2
    je .prime
    mov ebx, 2
.loop:
    mov edx, 0
    mov ecx, eax
    cdq
    div ebx
    cmp edx, 0
    je .notprime
    inc ebx
    mov ecx, ebx
    imul ecx, ecx
    cmp ecx, [ebp+8]
    jle .loop
    jmp .prime
.notprime:
    mov eax, 0
    pop ebp
    ret
.prime:
    mov eax, 1
    pop ebp
    ret
CheckPrime ENDP

LargestPrime PROC
    push ebp
    mov ebp, esp
    lea esi, nums
    mov ecx, 4
    mov eax, 0
    mov ebx, 0
.lp:
    mov edx, [esi + ebx*4]
    cmp edx, eax
    jle .cont
    mov eax, edx
.cont:
    inc ebx
    loop .lp
    mov edx, OFFSET outLargest
    call WriteString
    call WriteInt
    call CrLf
    pop ebp
    ret
LargestPrime ENDP


END main
