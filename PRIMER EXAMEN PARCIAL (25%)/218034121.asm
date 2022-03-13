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
	a dd 	-35501
	b dd 	218034121
	c dd 	-70503
	d dd 	6287908
segment .bss
	x resd 1
	
segment .text 
global main 					
main:	

	mov eax,[b]
	neg eax 	; (-b)
	
	mov ebx,85
	imul ebx	; ((-b)* 85)
	
	mov r9d,eax ; ((-b) * 85)
	
	mov eax,[a]
	sar eax,5
	sub eax,19	;((a >> 5) - 19)
	
	mov ecx,[c]
	sub ecx,[d]	;(c - d)
	
	mov ebx,0xF3A5BE2F
	and ebx,[d]	;(0xF3A5BE2F & d)

	xor ecx,ebx	;((c - d) ^ (0xF3A5BE2F & d))
	
	cmp ecx,0
	je FinPrograma
	cdq
	idiv ecx  ;((a >> 5) - 19) / ((c - d) ^ (0xF3A5BE2F & d))
	
	or r9d,eax    ;((-b) * 85) | ((a >> 5) - 19) / ((c - d) ^ (0xF3A5BE2F & d))
	mov [x],r9d   ;x =((-b) * 85) | ((a >> 5) - 19) / ((c - d) ^ (0xF3A5BE2F & d))


FinPrograma:
ret
