; Write a procedure named BitwiseMultiply that multiplies any unsigned 32-bit integer by EAX,
; using only shifting and addition. Pass the integer to the procedure in the EBX register, and return
; the product in the EAX register. Write a short test program that calls the procedure and displays
; the product. (We will assume that the product is never larger than 32 bits.) 
; One possible approach is to use a loop to shift the multiplier to the
; right, keeping track of the number of shifts that occur before the Carry flag is set. The resulting
; shift count can then be applied to the SHR instruction, using the multiplicand as the destination
; operand. Then, the same process must be repeated until you find the next highest bit in the multiplier.
TITLE Q9 (Q9.asm)
INCLUDE Irvine32.inc

.data
num1 DWORD 9
num2 DWORD 7
result DWORD ?

.code
BitwiseMultiply PROC
    mov ecx, 32
    xor edx, edx
repeatLoop:
    test ebx, 1
    jz skipAdd
    add edx, eax
skipAdd:
    shl eax, 1
    shr ebx, 1
    loop repeatLoop
    mov eax, edx
    ret
BitwiseMultiply ENDP

main PROC
    mov eax, num1
    mov ebx, num2
    call BitwiseMultiply
    mov result, eax
    call WriteDec
    call Crlf
    exit
main ENDP

END main
