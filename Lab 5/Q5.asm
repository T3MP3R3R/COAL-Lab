TITLE Task 5 (Q5.asm)
INCLUDE Irvine32.inc

.data
arrayD DWORD 1000h,2000h,3000h,4000h

.code
main PROC
	mov esi, 1
	mov eax, arrayD[esi*TYPE arrayD]

	mov esi, 3
	mov ebx, arrayD[esi*TYPE arrayD]

	; Explanation: TYPE arrayD = 4 because each element is a DWORD so 4 bytes
	; Therefore, multiplying the index (esi) by TYPE arrayD gives the correct byte offset

	exit
main ENDP
END main