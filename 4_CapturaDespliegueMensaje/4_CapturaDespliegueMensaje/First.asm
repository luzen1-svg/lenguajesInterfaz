; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 2: Captura y desplegado de mensaje
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data

    Pedir BYTE "Ingresa tu mensaje: ", 0
    Mostrar BYTE "El mensaje que ingresaste es: ", 0
    buffer BYTE 50 DUP(0)      ; almacena caracteres

.code
main PROC

    ; 1. Mostrar el mensaje solicitando la entrada
    mov  edx, OFFSET Pedir
    call WriteString

    ; 2. Capturar el texto ingresado por el usuario desde el teclado
    mov  edx, OFFSET buffer       ; edx debe apuntar al buffer de destino
    mov  ecx, SIZEOF buffer       ; ecx especifica la cantidad máxima de caracteres a leer
    call ReadString               ; lee la cadena escrita por el usuario

    call Crlf                    

    ; 3. Desplegar el mensaje de respuesta
    mov  edx, OFFSET Mostrar ; despliega el mensaje mostrar
    call WriteString

    ; 4. Mostrar el texto capturado en el buffer
    mov  edx, OFFSET buffer
    call WriteString
    call Crlf

    exit  
main ENDP
END main