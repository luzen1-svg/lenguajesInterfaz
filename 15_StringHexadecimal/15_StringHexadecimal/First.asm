; ---------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrera Enriquez Luz Zuszeth 
; Horario: 10:00 - 11:00 hrs
; Docente: Jose Luis Medina
; Práctica 13: String Hexadecimal
; ---------------------------------------------
INCLUDE Irvine32.inc

.data
    mensaje BYTE "Ingresa un número hexadecimal (ej. 1A4F): ", 0
    Result BYTE "El número hexadecimal ingresado es: ", 0

.code
main PROC
    ; Mostrar mensaje para solicitar el valor hexadecimal
    mov edx, OFFSET mensaje
    call WriteString

    ; Leer un número hexadecimal desde el teclado 
    ; (La función ReadHex almacena el valor numérico resultante directamente en el registro EAX)
    call ReadHex

    ; Mostrar el mensaje de resultado
    mov edx, OFFSET Result
    call WriteString

    ; Escribir el valor actual de EAX en la consola en formato hexadecimal
    call WriteHex
    call Crlf

    exit
main ENDP
END main
