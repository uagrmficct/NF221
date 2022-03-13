;file: Practico6-SC.asm

extern printf, scanf		

segment .data
arreglo	DQ	 -10, 2, 6, 4, 5, 1, 8, 9, 5, -5, 20, -30
n		DD	 12
msj		DB	 "El numero menor es = %lld", 10,0
		
segment .bss
menor resq 1

segment .text 
global main 					
main:
;------paso parametros-------------
	   mov ecx, [n]		;valor
	   mov rdx, arreglo	;referencia
	   call subrutina
	   mov [menor], rax
;-------mostrar resultado----------
sub rsp, 0x20
		mov rdx, [menor];valor
		mov rcx, msj
		call printf
add rsp, 0x20
ret

;==================================
subrutina:
		mov rax, [rdx] 	; asumimos 1er. elemento es el menor		
loop1:	cmp [rdx], rax 	; Comparamos 1er. elemento con el memor en RAX		
		jg cont
		mov rax, [rdx]		
cont:	
		add rdx, 8		; incrementamos puntero
		dec ecx			; Decrementamos contador
		jnz loop1		; Loop si hay mas elementos
fin:
		ret





