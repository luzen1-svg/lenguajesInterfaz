; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 9: Push y Pop
; -----------------------------------------------------
INCLUDE Irvine32.inc

.code
main PROC

	mov eax,40  : movemos el 40 a eax
	push eax    ; copiamos el valor de eax a la pila
	nop

	mov eax, 0       ; Limpiamos eax
    pop eax          ; Sacamos el valor de la pila y lo regresamos a eax
	nop

	exit
main ENDP
END main

