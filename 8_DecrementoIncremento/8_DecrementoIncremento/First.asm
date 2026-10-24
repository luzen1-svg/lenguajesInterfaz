; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 6: Decremento e Incremento
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
 ; defino los mensajes
    NInicio BYTE "Valor inicial: ", 0
    NInc BYTE "Despues de incrementar: ", 0
    NDec BYTE "Despues de decrementar: ", 0

.code
main PROC
    mov eax, 5   ; valor inicial en eax
    
    ; Mostrar valor inicial
    mov edx, OFFSET NInicio  ; despliega el mensaje NInicio
    call WriteString
    call WriteInt
    call Crlf

    ; Incrementar el valor en 1
    inc eax                 ; incrementamos el valor de eax y por automatico se incrementa de 1 en 1
    mov edx, OFFSET NInc    ; despliega el mensaje NInc
    call WriteString
    call WriteInt
    call Crlf

    ; Decrementar el valor en 1
    dec eax              
    mov edx, OFFSET NDec    ; despliega el mensaje NDec
    call WriteString
    call WriteInt
    call Crlf

    exit

main ENDP
END main