; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 3: Comparacion y Prueba
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
    num1 DWORD 25 ; defino un numero con 32 bits
    num2 DWORD 40
    Mayor BYTE "num1 es mayor", 0             ;mensaje a desplegar si es mayor
    Menor BYTE "num1 es menor", 0     ;mensaje a desplegar si es menor

.code
main PROC
    mov eax, num1  ; muevo el valor de num1 a eax
    cmp eax, num2  ;comparo los dos valores
    jle MenorOIgual   ; si no es mayor salta a la siguiente opcion

    mov edx, OFFSET Mayor  ; apunta al inicio de la cadena
    call WriteString
    call Crlf
    jmp Fin

Menor:
    mov edx, OFFSET Menor  ; apunta al inicio de la cadena (mensaje)
    call WriteString
    call Crlf

Fin:
    exit
main ENDP
END main