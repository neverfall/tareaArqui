

;~#######################################MACROS############################################################
%macro Escribir 2 
                        ;este macro es el encargado de imprimir en pantalla toma dos argumentos el contenido y el largo
      push  ecx
      push  edx
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      pop   edx
      pop   ecx
  
      int   80h
      
   %endmacro
   
  
%macro Ciclo 2
                          ;este macro se encarga de imprimir la fecha separadamente (dia, mes, año) por el momento es solo de prueba
       push ecx 
       push edx
       mov ecx, %1
       mov edx, %2
       Escribir ecx, edx
       xor edi, edi
       
       pop edx
       pop ecx
       xor ah, ah
       inc ecx 
   %endmacro
	
;#################################DATA##########################################
SECTION     .data
Texto1          db      "Ingrese la fecha a consultar: "
TextoLen        equ     $-Texto1
respuesta_V db "¡El año es bisiesto!",0
TextoV       equ     $-respuesta_V
respuesta_F db "¡El año no bisiesto!",0
TextoF       equ     $-respuesta_F

;#################################BUFFER##########################################
SECTION     .bss
Buffer        resb    25     ;guarda la fecha leida
BuffLen         equ     $-Buffer
dia             resb    3 
diaLen          equ     $-dia
mes             resb    12
mesLen          equ     $-mes
year             resb    6
yearLen          equ     $-year


;#################################TEXT##########################################
SECTION     .text
global      _start
     
_start:
    mov     ecx, Texto1      ;imprime el texto de inicio
    mov     edx, TextoLen
    Escribir ecx, edx         
    call ReadText            ;lee la fecha
 
cicloDia:
	mov ah,byte [ecx]    ;copia el caracter al ah
	mov [dia+edi], ah    ;mueve el contenido del ah a el buffer "dia"
	cmp byte [ecx],0x20  ;compara el byte leido con el espacio 
	je dia1              ;si hay un espacio entonces salta a dia1 
	inc edi              ;si no incrementa los contadores
	inc ecx              ;nos movemos al siguiente caracter de ecx
	jmp cicloDia         ;loop

dia1: 
        Ciclo dia, diaLen    ;imprime el dia
cicloMes:
       mov ah, byte [ecx]    ;copia el caracter al ah
       mov [mes+edi], ah     ;mueve el contenido del ah a el buffer "mes"
       cmp byte [ecx], 0x20  ;compara el byte leido con el espacio 
       je mes1               ;si hay un espacio entonces salta a mes1 
       inc edi               ;si no incrementa los contadores
       inc ecx               ;nos movemos al siguiente caracter de ecx
       jmp cicloMes          ;loop
       
mes1:
       Ciclo mes, mesLen    ;imprime el mes
       
cicloYear:
       mov ah, byte [ecx]   ;copia el caracter al ah
       mov [year+edi], ah   ;mueve el contenido del ah a el buffer "year"
       cmp byte [ecx], 0Ah  ;compara el byte leido con el enter 
       je year1             ;si hay un espacio entonces salta a mes1 
       inc edi              ;si no incrementa los contadores
       inc ecx              ;nos movemos al siguiente caracter de ecx
       jmp cicloYear        ;loop
       
year1:
       mov eax, year        
       Ciclo eax, yearLen   ;prueba imprime año
       xor eax, eax         ;limpia los registros
       xor ebx, ebx
       xor ecx, ecx
       xor edx, edx
       
     
        
       
bisiesto:
	mov ebx, year      ;mueve el año al ebx
	
        xor EDX, EDX ; limpia el DX
	mov EAX, EBX ; mueve a AX el año
	mov ECX, 4 ; mueve a CX el 4

	div ECX ; divide el contenido de AX entre CX

	cmp EDX,0 ; compara DX (residuo) con cero
	jne responder ; si no son iguales responde
	
pr_validacion:
	xor EDX, EDX ; limpia DX
	mov EAX, EBX ; mueve a AX el año
	mov ECX, 100 ; mueve a CX el 100

	div ECX ; divide el contenido de AX entre CX

	cmp EDX, 0 ; compara DX (residuo) con cero
	je sg_validacion ; si son iguales hace la segunda validación
	 push ecx
	 push edx
	 mov     ecx, respuesta_V
         mov     edx, TextoV
         Escribir ecx, edx
         pop edx
         pop edx
         
    	
    	
    	jmp Exit
    


sg_validacion:
	xor EDX, EDX ; limpia DX
	mov EAX, EBX ; mueve a AX el año
	mov ECX, 400 ; mueve a CX el 400

	div ECX ; divide el contenido de AX entre CX

	cmp EDX, 0 ; compara DX (residuo) con cero
	jne responder ; si no son iguales responde
	 
	 push ecx
	 push edx
	 mov     ecx, respuesta_V
         mov     edx, TextoV
         Escribir ecx, edx
         pop edx
         pop edx
	jmp Exit ; sale del programa

responder:
	 push ecx
	 push edx
	 mov     ecx, respuesta_F
         mov     edx, TextoF
         Escribir ecx, edx
         pop edx
         pop edx
	jmp Exit ; sale del programa
	
ReadText:
        mov eax, 3
	mov ebx, 0
	mov ecx, Buffer
	mov edx, BuffLen
	int 80h
        ret 

Exit: 
    mov     eax, 1
    xor     ebx, ebx
    int     80H
