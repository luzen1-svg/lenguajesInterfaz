; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 5.1: Repetir hasta que el usuario ingrese cero
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
    mensaje BYTE "Ingresa un cero para salir): ", 0

.code
main PROC

ciclo:
    mov edx, OFFSET mensaje
    call WriteString 
    call ReadInt     ; lee el número ingresado por el usuario y lo guarda en EAX
    
    cmp eax, 0       ; compara si el número es igual a 0
    je fin           ; Si es igual a cero salta a fin
    
    call Crlf       
    jmp ciclo        ; regresa al inicio del ciclo para pedir otro número

fin:

    exit
main ENDP
END main
