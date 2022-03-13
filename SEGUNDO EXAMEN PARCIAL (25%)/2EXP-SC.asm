;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;debugger  -->> x64dg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 2exp-sc.asm

extern printf, scanf

segment .data
arreglo		dw	20, 50, 70, 51, 100, 150, 2001, 80, 2000, 90	;........datos prueba
msj1		db	"Ingresar numero de elementos a promediar:  ", 0
msj2		db	"El promedio es: %d", 10, 0
fmt			db  "%d", 0				; 32-bits

segment .bss
num			resd  1
promedio    resw  1

segment .text
global main
main:
    xor     rax, rax
    xor     rbx, rbx							
	xor 	rdi, rdi
    xor     rdx, rdx
;------------------------------------
sub rsp, 0x20
	mov rcx, msj1
	call printf
	
	mov rcx, fmt
	mov rdx, num
	call scanf
	
;-----------paso parametros-----------
		mov rdx, arreglo	;referencia
		mov ecx, [num]		;valor
		call promediar		;llamar subrutina promediar
		mov [promedio], ax  ;almacenar promedio

;-----------mostrar resultado -------
		mov rcx, msj2
		mov rdx, [promedio]	
		call printf
add rsp, 0x20
		ret
			
;====================================		
;---------subrutina promediar--------	
promediar:		
			xor rsi, rsi		;indice
loop1:		mov ax, [rdx+rsi*2]	;modo indice escalado

			cmp ax, 20			;>20  ?
			jbe cont

			cmp ax, 2000		;<= 2000  ?
			ja cont

positivo:	add bx, [rdx+rsi*2]	;suma #positivos(>20,<=2000)
			inc di				;contador #positivos(>50,<=2000)
cont:		inc rsi				;actulizamos indice 
			dec rcx
			jnz loop1
fin:			
;------------------------------------
;   Calculo del Promedio
;------------------------------------
	mov ax, bx			;preparamos dividendo
	cwd					;convertir word a doubleword (dx:ax)
    idiv di				;promedio en ax   
ret
