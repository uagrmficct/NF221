;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;debugger  -->> x64dg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;PRÁCTICO PROGRAMACIÓN No. 4 - SC
;Escribir un programa en ensamblador de  64-bits (x86-64), el cuál realizará el siguiente cálculo con los dígitos de su Número de Registro. 
;Cada estudiante a partir de su correspondiente Número de Registro de 9 dígitos, definirá un arreglo de 9 elementos llamado “registro”, donde cada elemento del arreglo (a nivel de word) es un dígito de su Número de Registro.
;Por ejemplo:	
;Número de Registro: 213134956
;Arreglo.              2,  1,  3,  1,  3,  4,  9,  5,  6
;El programa sumará primero a cada elemento que se encuentre en la posición de los siguientes índices del arreglo: 2, 5, 7, 8 ; la constante 10d (10 decimal) y luego sumará dichos elementos, almacenando el resultado de dicha suma en memoria en una variable llamada “resultado”. (No olvidar que el primer elemento del arreglo tiene índice 0)
;En el programa se deberá usar obligatoriamente el “modo de direccionamiento”  -> “Indirecto por Registro + Desplazamiento.”  =  BaseReg + Displacement 	ejemplo:  mov rax, [rbx+16]

;file: practico4-SC.asm

segment .data
registro 	DW		2, 1, 3, 1, 1, 4, 9, 5, 6
					
segment .bss
resultado	RESW	1

segment .text 
global main 					
main:
;índices  -> 2, 5, 7, 8
	 xor rdx, rdx
	 mov rbx, registro
	 
	 mov ax, [rbx+4]	;(indice*tamaño elemento) desplazamiento 2*2=4
	 add ax, 10
	 add dx, ax
	 
	 mov ax, [rbx+10]	;(indice*tamaño elemento) desplazamiento 5*2=10
	 add ax, 10
	 add dx, ax
	 
	 mov ax, [rbx+14]	;(indice*tamaño elemento) desplazamiento 7*2=14
	 add ax, 10
	 add dx, ax
	 
	 mov ax, [rbx+16]	;(indice*tamaño elemento) desplazamiento 8*2=16
	 add ax, 10
	 add dx, ax			;suma total elementos índices  -> 2, 5, 7. 8 
	 
	 mov [resultado], dx
	 
	 ret