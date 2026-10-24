; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jesus Medina 
; Práctica 5: Condicionales
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
 ; defino los mensajes
    mensaje1 BYTE "Introduce el primer numero: ", 0
    mensaje2 BYTE "Introduce el segundo numero: ", 0
    Mayor BYTE "El primer numero es mayor.", 0
    Menor BYTE "El segundo numero es mayor.", 0
    Igual BYTE "Ambos numeros son iguales.", 0

    num1 DWORD 0
    num2 DWORD 0

.code
main PROC
    ; leer el primer número
    mov edx, OFFSET mensaje1    ; es el mensaje a desplegar en caso de ser necesario
    call WriteString            ; imprime el mensaje
    call ReadInt                ; lee un numero entero ingresado por el usuario y se guarda en eax
    mov num1, eax               ; muevo el valor de eax a num1
    call Crlf                   ; es un salto de linea

    ; leer el segundo número
    mov edx, OFFSET mensaje2    ; es el mensaje a desplegar en caso de ser necesario
    call WriteString
    call ReadInt
    mov num2, eax
    call Crlf

    mov eax, num1
    mov ebx, num2

    cmp eax, ebx        ; Comparamos num1 con num2
    jg es_mayor         ; Si num1 es mayor a num2, salta a es_mayor
    jl es_menor         ; Si num1 es menor a num2, salta a es_menor
    je son_iguales      ; Si num1 es igual a num2, salta a son_iguales

es_mayor:    ; para definir donde empieza un bloque del codigo
    mov edx, OFFSET Mayor
    call WriteString
    call Crlf
    jmp fin

es_menor:    ; para definir donde empieza un bloque del codigo si son diferentes como en este caso
    mov edx, OFFSET Menor
    call WriteString
    call Crlf
    jmp fin

son_iguales:      ; para definir donde empieza un bloque del codigo
    mov edx, OFFSET Igual
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main