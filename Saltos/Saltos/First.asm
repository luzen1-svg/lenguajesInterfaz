; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 4: Saltos
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
    Mayor BYTE "Es mayor que 5", 0         ; defino los mensajes para ambos casos
    Menor BYTE "Es menor o igual a 5", 0

.code
main PROC
    mov eax, 7           ; muevo el numero a eax
    cmp eax, 5           ; comparo eax con 5
    jg es_mayor          ; Salta si es mayor

    ; si es menor o igual
    mov edx, OFFSET Menor  ; apunto a el mensaje para desplegarlo
    call WriteString
    jmp fin              ; si cumple salta al final para evitar ejecutar el otro bloque

es_mayor:              ;es una referencia que hago dentro del codigo
    ; si es mayor
    mov edx, OFFSET Mayor  ; si es mayor se imprime el mensaje
    call WriteString

fin:
    call Crlf
    exit

main ENDP
END main
