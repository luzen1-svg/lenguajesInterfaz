; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 4.1: Mayor, Menor o Igual con entrada del usuario
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
 ; defino los mensajes que mostrare en el codigo
    Ingresar BYTE "Ingresa un numero: ", 0
    NMayor BYTE "Es mayor que 5", 0
    NMenor BYTE "Es menor que 5", 0
    NIgual BYTE "Es igual a 5", 0

.code
main PROC
    mov edx, OFFSET Ingresar
    call WriteString
    call ReadInt         ; lee el número ingresado por el usuario y lo guarda en eax
    
    cmp eax, 5           ; compara el número ingresado eax con 5
    jg mayor       ; doy un salto al bloque mayor
    jl menor       ; doy un salto al bloque menor

igual:
    mov edx, OFFSET NIgual    ; si es igual mostrara el mensaje NIgual
    call WriteString
    jmp fin

mayor:
    mov edx, OFFSET NMayor    ; si es igual mostrara el mensaje NMayor  
    call WriteString
    jmp fin

menor:
    mov edx, OFFSET NMenor    ; si es igual mostrara el mensaje NMenor
    call WriteString

fin:
    call Crlf    ; para dar un salto de linea
    exit

main ENDP
END main
