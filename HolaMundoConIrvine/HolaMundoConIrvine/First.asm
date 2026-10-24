; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Hola mundo con Irvine
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
    mensaje BYTE "¡Hola Mundo!", 0  ; defino el mensaje a mostrar

.code
main PROC
    mov edx, OFFSET mensaje  ; apunto al inicio del mensaje

    call WriteString    ; imprimo el mensaje
    call Crlf
    exit

main ENDP
END main
