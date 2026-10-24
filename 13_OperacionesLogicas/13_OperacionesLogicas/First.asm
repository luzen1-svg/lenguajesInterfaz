; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 11: Operaciones Logicas
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
   ;ESTADOS DE COMPUTADORA
   ;0 - COMPUTADORA ENCENDIDA  0:NO  1:SI
   ;1 - ALARMA                 0:NO  1:SI
   ;COMPUTADORA CONECTADA
   ;CONDICIONES INICIALES: 0000 0101

   Encendida BYTE "ALARMA ESTA ENCENDIDA", 0
   Apagada BYTE "ALARMA APAGADA", 0

.code
main PROC  

    ; 1-AND: EVALUACION DE ALARMA
    mov eax, 0         ; limpia el registro eax
    mov al, 00000111b  ; cargamos un valor inicialmente        
    and al, 00000111b  ; apaga los bits

    call WriteBin      ; imprime en binario
    call Crlf

    ; 2-OR: ENCENDER LA ALARMA
    mov eax, 0         ; limpia el registro eax
    mov al, 00000101b  ; cargamos un valor inicialmente  
    or al, 00000010b   ; enciende los bits

    call WriteBin
    call Crlf

    ; 3-XOR: APAGAR COMPUTADORA Y ENCENDERLA
    ; ESTADO INICIAL = 0000 0101

    mov eax, 0         
    mov al, 00000101b  ; cargamos un valor inicialmente  
    xor al, 00000001b  ; cambia el estado del bit  

    call WriteBin
    call Crlf

    ; 4-NOT:
    mov eax, 0
    mov al, 00000101b  ; cargamos un valor inicialmente  
    not al             ; Invierte todos los bits del registro

    call WriteBin
    call Crlf
  
    ; 5-TEST: EVALUAR ALARMA ENCENDIDA Y APAGADA
    ; REALIZAR SALTO Y MOSTRAR MENSAJE DE "ALARMA ESTA ENCENDIDA" O "ALARMA APAGADA"

    mov eax, 0
    mov al, 00000101b    ; cargamos un valor inicialmente  
    test al, 00000010b   ; mediante el and comprobamos si el bit esta encendido
    jnz alarma_encendida ; Si el resultado no es cero, la alarma está encendida

    ; Si el resultado es cero, la alarma está apagada
    mov edx, OFFSET Apagada

    call WriteString
    call Crlf
    jmp fin            ; saltamos al final 

    alarma_encendida:
    mov edx, OFFSET Encendida    ; mostramos el mensaje
    call WriteString
    call Crlf

  fin:
    exit

main ENDP
END main
