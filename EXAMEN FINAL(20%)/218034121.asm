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

extern printf, scanf, gets, strlen		

segment .data
;aqui se declaran variables inicializadas

	m1 db "Ingresar la cadena de caracteres (max. 100 caracteres): ",0
	m2 db "La cadena tiene un total de : %d (digitos + letras mayusculas + minusculas)",10,0
	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

	cad resb 100
	
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
	
	xor rax,rax
	xor rbx,rbx
	xor rcx,rcx
	xor rdx,rdx

sub rsp,0x20
	
	mov rcx,m1
	call printf
	
	mov rcx,cad
	call gets
	
	mov rcx,cad
	call strlen
	
	mov rcx,cad
	mov rdx,rax
	
	call contar

	mov rcx,m2
	mov rdx,rax
	call printf

add rsp,0x20
	
	
ret
;----------------------------------------
;..........subrutinas....................
	
contar:
		
		mov r12,rcx ; direccion cad
		xor rcx,rcx
		xor rax,rax
		xor rbx,rbx
		mov rcx,rdx ;contador loop strlen
		mov r13,0 ; contador dig,may,min
	
			ciclo:
				
				mov bl,[r12]
				cmp bl,48
				jb noContar
				cmp bl,57
				jbe siContar
				cmp bl,65
				jb noContar
				cmp bl,90
				jbe siContar
				cmp bl,97
				jb noContar
				cmp bl,122
				jbe siContar
				jmp noContar
				
					siContar:
						inc r13
					noContar:
						inc r12
							
			loop ciclo
	
		mov rax,r13
ret	

