; The greatest common divisor (GCD) of two integers is the largest integer that will evenly divide both integers. 
; The GCD algorithm involves integer division in a loop, described by the following C++ code: 
; int GCD(int x, int y){
; x = abs(x); // absolute value
; y = abs(y);
; do {
; int n = x % y;
; x = y;
; y = n;
; } while (y > 0);
; return x;
; }
; Implement this function in assembly language and write a test program that calls the function
; several times, passing it different values. Display all results on the screen
TITLE Q10 (Q10.asm)
INCLUDE Irvine32.inc

.data
x DWORD 84
y DWORD 36
result DWORD ?

.code
GCD PROC
    mov eax, x
    mov ebx, y
    cmp eax, 0
    jge skip1
    neg eax
skip1:
    cmp ebx, 0
    jge skip2
    neg ebx
skip2:

L1:
    mov edx, 0
    div ebx
    mov eax, ebx
    mov ebx, edx
    cmp ebx, 0
    jne L1
    mov result, eax
    ret
GCD ENDP

main PROC
    call GCD
    mov eax, result
    call WriteDec
    call Crlf
    exit
main ENDP

END main
