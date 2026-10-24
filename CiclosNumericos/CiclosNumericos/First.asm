; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 1: Ciclos Numericos
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data     ; se inicializan las variables, aquellas que ya tienen un valor definido
    mensaje BYTE "Contador: ", 0 ; escribimos el mensaje a desplegar

.code
main PROC
    mov ecx, 10      ; establece el ciclo para que repita 10 veces

ciclo:
    mov edx, OFFSET mensaje    ; apunta al inicio de la cadena
    call WriteString ; Imprime contador
    
    mov eax, 11      ; valor máximo menos el contador actual para ir de 1 a 10
    sub eax, ecx     ; es una resta, toma el valor de eax - ecx, automatico se guarda en eax
    call WriteInt    ; Imprime el número del ciclo
    call Crlf        ; salto de linea

    loop ciclo        ; termina el ciclo

    exit
main ENDP
END main
