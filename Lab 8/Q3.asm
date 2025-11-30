TITLE Q3 (Q3.asm)
INCLUDE Irvine32.inc

.data
vals BYTE "A=5, B=3, C=4, D=2",0
s1 BYTE "Step1 (A+B): ",0
s2 BYTE "Step2 ((A+B)*C): ",0
s3 BYTE "Final ((A+B)*C)-D: ",0
A DWORD 5
B DWORD 3
Cc DWORD 4 ; using that cause C gives sytax error 
D DWORD 2
R1 DWORD ?
R2 DWORD ?
R3 DWORD ?

.code
Proc1 PROC
    mov eax, A
    add eax, B
    mov R1, eax
    mov edx, OFFSET s1
    call WriteString
    call WriteInt
    call CrLf
    ret
Proc1 ENDP

Proc2 PROC
    mov eax, R1
    imul eax, Cc
    mov R2, eax
    mov edx, OFFSET s2
    call WriteString
    call WriteInt
    call CrLf
    ret
Proc2 ENDP

Proc3 PROC
    mov eax, R2
    sub eax, D
    mov R3, eax
    mov edx, OFFSET s3
    call WriteString
    call WriteInt
    call CrLf
    ret
Proc3 ENDP

main PROC
    mov edx, OFFSET vals
    call WriteString
    call Crlf
    call Proc1
    call Proc2
    call Proc3
    call CrLf

    exit
main ENDP
END main