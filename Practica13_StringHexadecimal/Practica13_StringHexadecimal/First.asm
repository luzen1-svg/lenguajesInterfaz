; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 13: String Hexadecimal
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
	cadena BYTE "12AB34CDh", 0

.code
main PROC
	mov edx, OFFSET cadena

	mov edx, 0
	and dl, 0fh 

	mov edx, 0
	shr dl, 1  ;desplazo a la derecha la cadena

	call WriteChar
	call crlf

	exit

main ENDP
END main
