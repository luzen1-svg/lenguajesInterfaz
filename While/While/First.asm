INCLUDE Irvine32.inc

.code
main PROC
	;CASO 1: ZERO FLAG

	mov eax, 5
	mov ebx, 5

	cmp eax, ebx
	call DumpRegs

	mov eax, 10h
	cmp eax, 10h

	;CASO 2: SIGN FLAG
	mov eax, 0
	mov ebx, 0

	mov al, -5
	mov bl, 1
	
	call DumpRegs
	exit
main ENDP
END main
