;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o 218034121.o 218034121.asm -l 218034121.lst
;link:	   -->> gcc -o 218034121 218034121.o
;run:      -->> 218034121
;debugger: -->> x64dbg 218034121
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 218034121.asm (nombre programa)
;registro: 218034121
;nombres y apellidos: Moises Leonardo Mogiano Gutierrez

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
	a	dd	218034121
	b	dd	-12345
	c	dd	6287908
	d	dd	-67890
	e	dd	0xABCDEF
	
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
	x	resd	1

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

	mov eax,[d]
	sar eax,3	;(d>>3)
	
	mov ebx,[e]
	sal ebx,5	;(e<<5)
	
	sub eax,ebx ;(d>>3)-(e<<5)
	
	mov ecx,[a]
	and ecx,[b] ;(a&b)
	
	mov edx,[c]
	not edx ; ~c
	
	or ecx,edx ;((a&b)|~c)
	
	xor eax,ecx ;(d>>3)-(e<<5)^((a&b)|~c)
	
	mov [x],eax ; x = (d>>3)-(e<<5)^((a&b)|~c)
	
	
	
	
ret
;----------------------------------------
;..........subrutinas....................