; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 12: Desplazamiento y rotacion
; -----------------------------------------------------
INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

;1-SHL: desplazar un bit hacia la izq
	mov al, 00000110b
	shl al, 1     ; no desplazamos un bit a la izq
	call DumpRegs
	call WriteBin ; permite ver los movimientos

;2-SHR: desplazar un bit hacia la derecha
	mov al, 00001100b
	shr al, 1     ; nos desplazamos un bit a la derecha
	call DumpRegs
	call WriteBin 

;3-SAR: desplazamiento con signo
	mov eax, 0    ; limpiamos eax
	mov al, -8    ; movemos -8 a al
	sar al, 1     ; nos desplazamos a la derecha 1
	call DumpRegs
	call WriteBin ; permite ver los movimientos

;4-SAR: desplazamiento con valor 1 impar
	mov eax, 0
	mov al, -9    ; movemos -9 a al
	sal al, 1     ; nos desplazamos a la izq 1
	call DumpRegs  ; muestra el estado actual de los registros
	call WriteBin ; permite ver los movimientos

;5-CONTEO CONSTANTE: desplazar 2 posiciones
	mov al, 00001100b
	shl al, 2     ; nos desplazamos 2 a la izq
	call DumpRegs
	call WriteBin ; permite ver los movimientos

;6-CONTEO CON CL: desplazar utilizando un registro
	mov al, 00001100b
	mov cl, 2     ; movemos el 2 a cl
	shr al, cl    ; nos desplazamos a la derecha
	call DumpRegs
	call WriteBin ; permite ver los movimientos

;6-ROR: rotacion a la derecha
	mov al, 00000001b
	ror al, 1      ; rotamos 1 a la derecha
	call DumpRegs
	call WriteBin 

	exit

main ENDP
END main
