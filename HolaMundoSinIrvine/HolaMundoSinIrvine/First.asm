; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Hola Mundo Sin Irvine32
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
mensaje BYTE "Entorno configurado correctamente", 0   ; mensaje a mostrar

.code
main PROC
	mov edx, OFFSET mensaje   ; apunto al inicio del mensaje
	call WriteString
	exit

main ENDP
END main
