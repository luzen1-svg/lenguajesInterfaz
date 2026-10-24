; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 7: Validacion de Formato
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
    cadena BYTE "tec-123", 0             ; definimos el texto a validar
    Valido BYTE "Formato valido", 0      ; mostrar este mensaje si es valido
    Invalido BYTE "Formato invalido", 0  ; mostrar este mensaje si es invalido
    
    patron BYTE "tec-123", 0

.code
main PROC
    mov esi, OFFSET cadena    ; guardamos en esi el inicio de la cadena
    mov edi, OFFSET patron    ; guardamos en edi el inicio de el texto patron
    mov ecx, 7                ; en ecx guardamos 7 que representa la longitud del texto
     
ciclo:
    mov al, [esi]       ; copiamos el byte que apunta esi en el registro al
    mov bl, [edi]       ; copiamos el byte que apunta edi en el registro bl
    cmp al, bl          ; compara ambos caracteres
    jne etiqueta_invalido ; si no son iguales salta al sig bloque etiqueta_invalido:
    
    inc esi            ; incrementamos esi para apuntar al sig byte de la cadena
    inc edi            ; incrementamos edi para apuntar al sig byte
    loop ciclo         ; si ecx no es cero repite el ciclo para el sig caracter

    mov edx, OFFSET Valido    ; desplegamos el mensaje en valido
    call WriteString
    jmp fin                   ; saltamos a final para no continuar si se cumplio todo

etiqueta_invalido:
    mov edx, OFFSET Invalido    ; desplegamos el mensaje en invalido
    call WriteString

fin:
    call Crlf
    exit
main ENDP
END main
