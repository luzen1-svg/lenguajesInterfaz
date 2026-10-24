; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 8: Operaciones Aritmeticas
; -----------------------------------------------------
INCLUDE Irvine32.inc
.code

main PROC
	;1 -ADD Y SUB: OPERACION DE SUMA Y RESTA
	mov eax, 50    ; muevo el valor 50 a eax
	mov ebx, 20    ; muevo el valor 20 a ebx

	add eax, ebx    ; suma el valor de ebx a eax 
    sub eax, 15     ; resta 15 al valor actual de eax 

	nop

	;2. -CF: ACARREO EN UNA SUMA SIN SIGNO
	mov eax, 0      ; limpia el registro eax
	mov al, 225     ; muevo el valor 225 al registro al

	add al, 1       ; suma 1 al valor actual de al
	nop

	;3. OF: DESBORDAMIENTO EN UNA SUMA CON SIGNO
	mov eax, 0      ; limpia el registro eax
	mov al, 127     ; muevo el valor 127 al registro al

	add al, 1       ; suma 1 al valor actual de al
	nop 

	;4. MUL: PRODUCTO DENTRO DE 32 BITS
	mov eax, 25    ; muevo el valor 25 a eax
	mov ebx, 3     ; muevo el valor 3 a ebx
	mul ebx        ; multiplico eax por ebx
	nop

	;5. MUL: PRODUCTO FUERA DE 32 BITS
	mov eax, 65537    ; muevo el valor 65537 a eax
	mov eax, 65537    ; muevo el valor 65537 a ebx
	mul ebx           ; multiplico eax por ebx
	nop

	;6. IMUL:PRODUCTO CON SIGNO
	mov eax, -5    ; muevo el valor -5 a eax
	mov ebx, 3     ; muevo el valor 3 a ebx
	imul ebx       ; multiplico eax por ebx
	nop

	;7. DIV: DIVIDIENDO VALORES PEQUEÑOS SIN SIGNO
	mov eax, 125     ; muevo el valor 125 a eax
	mov ebx, 0        
	mov ebx, 12      ; muevo el valor 12 a ebx

	div ebx          ; divido eax entre ebx
	nop

	;8. IDIV Y CDQ: DIVISION CON SIGNO
	mov eax, -125     ; mueve el valor -125 al registro eax
	cdq
	mov ebx, 12       ; muevo el valor 12 a ebx
	idiv ebx          ; divido eax entre ebx

	nop
	exit
	
	main ENDP
	END main
