; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 13: String Hexadecimal
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data

  ;PRACTICA13: un almacen recibe un lote de tarjetas de desarrollo ESP32. Debo de capturar la cantidad recibida de lotes y 
  ;sumarselos a la existencia actual

	mensaje BYTE "Ingresa la cantidad recibida de lotes: ", 0
	error BYTE "Error, entrada invalida, intente de nuevo", 0
	resultado BYTE "Existencia actual: ", 0

	buffer BYTE 10 DUP(0)
    resStr BYTE 12 DUP(0)
    temporal BYTE 0

    ; son las variables con valores definidos por el problema inicial
	cantidadRecibida DWORD 0
	existenciaInicial DWORD 25
	existenciaActual DWORD 0


.code
main PROC

ciclo: 
	mov edx, OFFSET mensaje   ; ingreso la cantidad recibida 
	call WriteString

    mov edx, OFFSET buffer   ; apunta al inicio del espacio reservado
    mov ecx, SIZEOF buffer   ; define el tamaño total en bytes
    call ReadString

    ; eax contiene el número de caracteres ingresados
    cmp eax, 0          ; comparo el valor de eax con 0
    je errorEntrada    
    cmp eax, 1          ; comparo el valor de eax con 1
    je validar_un_digito
    cmp eax, 2          ; comparo el valor de eax con 2
    je validar_dos_digitos
    jmp errorEntrada  ; Si ingresó 3 o más dígitos, se pasa del rango y salta a mostrar error

validar_un_digito:
    mov esi, OFFSET buffer   ; movemos a esi el buffer
    mov al, [esi]            ; copia el primer byte del buffer en al
    
    cmp al, '1'              ; comparo el caracter con el ascci 1
    jb errorEntrada 
    cmp al, '9'              ; comparo el caracter con el ascii 9
    ja errorEntrada 
    
    sub al, '0'         ; convierto el caracter ascii a su valor numerico
    mov edx, 0          ; limpiamos edx 
    mov dl, al          ; muevo el valor numerivo de al a dl
    mov cantidadRecibida, edx   ; guardamos el valor numerico en la variable cantidadRecibida
    jmp calcular

validar_dos_digitos:
    mov esi, OFFSET buffer
    
    ; Primer dígito (decenas)
    mov al, [esi]       ; leemos el primer carácter directamente en al
    cmp al, '1'
    jb errorEntrada 
    cmp al, '9'
    ja errorEntrada 
    sub al, '0'         ; convertimos a número
    
    mov bl, 10
    mul bl              ; multiplicamos al por 10
    mov temporal, al        ; guardamos temporalmente las decenas en la variable temp

    ; Segundo dígito (unidades)
    inc esi
    mov al, [esi]       ; leemos el segundo carácter en al
    cmp al, '0'
    jb errorEntrada 
    cmp al, '9'
    ja errorEntrada 
    sub al, '0'         ; convertimos a número
    
    add al, temporal        ; sumamos unidades al + decenas guardadas temp
    
    ; Pasamos el resultado total a 32 bits usando edx
    mov edx, 0          
    mov dl, al          
    mov cantidadRecibida, edx 
    jmp calcular

errorEntrada:
    ; Rechazar letras, signos, espacios o cantidades fuera de rango y solicitar nuevamente
    mov edx, OFFSET Error
    call WriteString
    jmp ciclo

calcular:
    ; Sumo la cantidad recibida a la existencia actual
    mov eax, existenciaInicial  ; mueve la existencia inicial a EAX
    add eax, cantidadRecibida   ; suma la cantidad recibida
    mov existenciaActual, eax   ; guarda el resultado en existenciaActual

    ; Muestra el mensaje de texto "Existencia actual: "
    mov edx, OFFSET resultado   
    call WriteString

    ; Muestra el valor numérico almacenado en existenciaActual en la consola
    mov eax, existenciaActual   
    call WriteInt               

    call Crlf
    call WaitMsg               
    exit      
    
main ENDP
END main