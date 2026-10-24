; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 15: Crear y guardar Archivos
; -----------------------------------------------------
INCLUDE Irvine32.inc

.data
	nombreArchivo BYTE "Inventario.txt", 0
	texto BYTE "125", 0
	archivoHandle DWORD?
	mensajeExito BYTE "Archivo guardado", 0
	mensajeError BYTE "No se pudo guardar el archivo", 0

.code
main PROC
; 1. Crear el archivo.txt
	mov edx, OFFSET nombreArchivo
	call createOutputFile

	cmp eax, INVALID_HANDLE_VALUE ; hacemos una comparacion
	je error
	
	mov archivoHandle, eax

; 2. Escribir los caracteres ("125")
	mov eax, archivoHandle ; en donde
	mov edx, OFFSET texto  ; que tiene que escribir
	mov ecx, SIZEOF texto -1

	call WriteToFile
	je errorEscritura ; brinca un error
	cmp eax, SIZEOF texto -1 ; comparamos con la cadena que escribimos
	jne error

; 3. Guardar el archivo/ Cerrar archivo
	mov eax, archivoHandle
	call CloseFile

	test eax, eax ; comparamos si es un valor distinto de cero
	jz error ; si es cero brinca a error
	
	mov edx, OFFSET mensajeExito
	call WriteString
	jmp fin

errorEscritura:
	mov eax, archivoHandle
	call closeFile
error:
	mov edx, OFFSET mensajeError
	call WriteString
fin:
	exit


main ENDP
END main
