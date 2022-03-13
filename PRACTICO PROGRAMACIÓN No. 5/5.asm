;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;Microsoft x64 ABI (Application Binary Interface):
;rcx, rdx, r8, r9 	->   for integers 		   (left to right)-->> primeros 4 parametros enteros
;Remaining arguments are passed via the stack  (right to left)-->> [rsp+0x20],[rsp+0x28]......
;The only registers that the called function is required to preserve (the calle-save registers) are: 
;NON VOLATILE:		-> 	 rbx, ,rsi, rdi, rbp, rsp, r12, r13, r14, r15. All others are free to be changed by the called function.					   	 
;VOLATILE(scratch): ->   rax, rcx, rdx, r8, r9, r10, r11
;Integers are returned in rax or rdx:rax.

;//file: Practico5.asm

;void calcula(int a, int b, int* cuadrado, int* cociente); prototipo funcion
;* cociente -> indica al compilador de asignar un valor a la direccion cociente. (* se llama -> “dereference operator”) 

;calcula (a^2), (a/b)

extern printf

	segment .data
a DQ 217041779
b DQ 7714818
msj		DB	"cuadrado = %lld    cociente = %lld", 10, 0
			
	segment .bss
cuadrado	resq 1
cociente	resq 1

segment .text
global main
main:
;------ paso parametros --------
	mov rcx, [a]	 ;valor
	mov rdx, [b]	 ;valor
	mov r8, cuadrado ;referencia
	mov r9, cociente ;referencia	
	call calcula

;-----mostrar resultados -------
add rsp, 0x20
	mov rcx, msj
	mov rdx, [cuadrado]
	mov r8, [cociente]
	call printf
sub rsp, 0x20		;1 parametro	
	ret


;==================================
;----------funcion-----------------
;;calcula(a, b, &cuadrado, &cociente);
calcula:
;calcula (a^2), (a/b)
;..............................
		mov rax, rdx
		imul rax, rdx
		mov [r8], rax	;salva cuadrado en memoria -> C/C++ *cuadrado=rax
		;-------------
		mov rax, rcx	;rax = a
		mov rbx, rdx
		cqo				;rdx:rax contiene el dividendo
		idiv rbx	 	;rax = cociente, rdx = residuo
		mov [r9], rax	;salva cociente en memoria -> C/C++ *cociente=rax
		ret
