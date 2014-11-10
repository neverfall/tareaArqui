

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


;#################################DATA##########################################
SECTION     .data
Texto1:          db      "Ingrese la fecha a consultar: "
TextoLen:        equ     $-Texto1
respuesta_V: db "¡El año es bisiesto!",0
TextoV:       equ     $-respuesta_V
respuesta_F: db "¡El año no bisiesto!",0
TextoF:       equ     $-respuesta_F
Error:      db      "Ingrese una fecha valida "
ErrorLen:   equ   $-Error
Domingo:    db    "Domingo"

Lunes:    db    "Lunes"

Martes:    db    "Martes"

Miercoles:    db    "Miercoles"

Jueves:    db    "Jueves"

Viernes:    db    "Viernes"

Sabado:    db    "Sabado"

;#################################BUFFER##########################################
SECTION     .bss
Buffer        resb    25     ;guarda la fecha leida
BuffLen         equ     $-Buffer
dia             resb    3
diaLen          equ     $-dia
mes             resb    12
mesLen          equ     $-mes
year             resb   4
yearLen          equ    $-year
yearaux          resb 2
k                resb 5
j                resb 5
k1               resb 5
bufferAtoi resb 4
bufAux  resb 4
;#################################TEXT##########################################
SECTION     .text
global      _start
     
_start:
    mov     ecx, Texto1      ;imprime el texto de inicio
    mov     edx, TextoLen
    Escribir ecx, edx         
    call ReadText            ;lee la fecha
    xor ecx, ecx
    mov ecx, Buffer
    xor edi,edi
    xor ah,ah
    xor edi,edi
    xor esi,esi
 

cicloDia:
	mov ah,byte [ecx+edi]    ;copia el caracter al ah
	mov [dia+esi], ah    ;mueve el contenido del ah a el buffer "dia"
	cmp byte [ecx+edi],20H  ;compara el byte leido con el espacio 
	je dia1              ;si hay un espacio entonces salta a dia1 
	inc edi              ;si no incrementa los contadores
	inc esi             ;nos movemos al siguiente caracter de ecx
	jmp cicloDia         ;loop

dia1: 
        xor esi,esi  ;imprime el dia
        xor ah, ah
        inc edi
        
cicloMes:
       mov ah,byte [ecx+edi]    ;copia el caracter al ah
       mov [mes+esi], ah     ;mueve el contenido del ah a el buffer "mes"
       cmp byte [ecx+edi], 20H  ;compara el byte leido con el espacio 
       je mes1               ;si hay un espacio entonces salta a mes1 
       inc edi               ;si no incrementa los contadores
       inc esi               ;nos movemos al siguiente caracter de ecx
       jmp cicloMes          ;loop
          
mes1:
        xor esi,esi  ;imprime el dia
        xor ah, ah
        inc edi
        
cicloYear:
       mov ah,byte [ecx+edi]   ;copia el caracter al ah
       mov [year+esi], ah   ;mueve el contenido del ah a el buffer "year"
       cmp byte [ecx+edi], 0Ah  ;compara el byte leido con el enter 
       je year1             ;si hay un espacio entonces salta a mes1 
       inc edi              ;si no incrementa los contadores
       inc esi              ;nos movemos al siguiente caracter de ecx
       jmp cicloYear        ;loop
       
year1:
            
       xor ebx, ebx
       xor ecx, ecx
       xor edx, edx
       
       xor eax, eax
       mov   eax,[dia]
       call atoi 
       mov [dia],eax
       
       xor eax,eax
       mov eax,[mes]
       call atoi
       mov [mes],eax
       
       xor eax,eax
       mov eax,[year]
       call atoi
       mov [year],eax
       jmp bisiesto
       
        
        
atoi:	;atoi recibe el numero en el eax y el resultado lo devuelve en el eax

      mov [bufferAtoi],eax
      mov esi,bufferAtoi

      mov     eax, 0          
      mov     ecx, 0          
 
.ciclo:
      xor     ebx, ebx        
      mov     bl, byte[esi+ecx]   
      cmp     bl, 48          
      jl      .terminarCiclo       
      cmp     bl, 57          
      jg      .terminarCiclo       
      cmp     bl, 10          
      je      .terminarCiclo       
      cmp     bl, 0           
       jz      .terminarCiclo       
 
       sub     bl, 48          
       add     eax, ebx        
       mov     ebx, 10         
       mul     ebx             
       inc     ecx             
       jmp     .ciclo   
 
.terminarCiclo:
      mov     ebx, 10         
      div     ebx             
      ret
        
        
;#############################BISIESTO##################################         
bisiesto:	
	 mov ecx, 4 ; mueve a CX el 4
	 div ecx ; divide el contenido de AX entre C
	 cmp edx,0 ; compara DX (residuo) con cero
	 jne responder ; si no son iguales responde
	
prValidacion:
	 xor EDX, EDX ; limpia DX
	 mov EAX, year ; mueve a AX el año
	 mov ECX, 100 ; mueve a CX el 100
	 div ECX ; divide el contenido de AX entre CX
	 cmp EDX, 0 ; compara DX (residuo) con cero
	 je sgValidacion ; si son iguales hace la segunda validación
	 push ecx
	 push edx
	 mov     ecx, respuesta_V
         mov     edx, TextoV
         Escribir ecx, edx
         pop edx
         pop ecx
    	jmp preparar
    
sgValidacion:
	xor EDX, EDX ; limpia DX
	mov EAX, year ; mueve a AX el año
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
         pop ecx
         xor eax, eax    ;eax mantiene el mes
          xor ebx, ebx
          mov eax,[bufAux]
          mov ebx, 01
          mov [bufAux],ebx
         
	jmp preparar ; sale del programa

responder:
	 xor eax, eax    ;eax mantiene el mes
          xor ebx, ebx
          mov eax,[bufAux]
          mov ebx,0
          mov [bufAux],ebx
         
	 mov     ecx, respuesta_F
         mov     edx, TextoF
         Escribir ecx, edx
       
	
	


;###############################CALCULAR DIA DE LA SEMANA###############################
preparar: 
    xor eax, eax    ;eax mantiene el mes
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov eax, [mes]
    cmp eax, 02
    jle mesMenor
    jmp K
mesMenor:
   mov ebx, 12
   add eax, ebx
   xor ebx, ebx
   mov ebx, [year]
   dec ebx
   mov [mes],eax
   mov [year], ebx
   jmp K
   ;EBX TIENE EL AÑO EAX TIENE EL MES

K:
  xor eax,eax
  xor ecx,ecx
  xor edx,edx
  mov eax, [year]
  mov ecx, 100
  div ecx
  mov [k],edx
 
  
J:  
  xor eax,eax
  xor ecx,ecx
  xor edx,edx
  mov eax, [year]
  mov ecx, 100
  IDIV ecx
  mov [j] ,eax

  
K1:
       xor eax,eax
       xor ecx,ecx
       xor edx, edx
       mov eax, [k]
       mov ecx, 4
       div ecx
       mov [k1], edx

    
zeller:
       xor eax,eax
       xor ebx,ebx
       xor ecx,ecx
       xor edx,edx
       
   
       mov eax, [mes]
       inc eax
       mov ecx, 26
       mul ecx
       xor ecx, ecx
       mov ecx, 10
       idiv ecx
       mov ebx, eax
       push eax
       add eax, ebx
       
       xor ecx,ecx
       mov ecx,[k]
       add eax, ecx
      
       
      
       
       xor ebx,ebx
       mov ebx,5
       add eax,ebx
       
       xor ebx, ebx
       push eax
       mov eax,[j]
       mov ecx, 6
       mul ecx
       mov ebx ,eax
       pop eax
       add eax,ebx
       xor ebx,ebx
       mov ebx,[dia]
       add eax, ebx
       mov ecx, 7
       div ecx
       mov eax,edx
       xor edx,edx
       mov edx,[bufAux]
       
       cmp edx, 1
       je comparacion
       cmp edx, 0
       je c1omparacionno
       jmp Exit

comparacion:     
jmp Exit
     cmp eax, 0 ; compara DX (residuo) con cero
     je sabado
     cmp eax, 1 ; compara DX (residuo) con cero
     je domingo
     cmp eax, 2 ; compara DX (residuo) con cero
     je lunes
     cmp eax, 3 ; compara DX (residuo) con cero
     je martes
     cmp eax, 4 ; compara DX (residuo) con cero
     je miercoles
     cmp eax, 5 ; compara DX (residuo) con cero
     je jueves
     cmp eax, 6 ; compara DX (residuo) con cero
     je viernes
     
     jmp Exit     
c1omparacionno:
     cmp eax, 0 ; compara DX (residuo) con cero
     je viernes
     cmp eax, 1 ; compara DX (residuo) con cero
     je sabado
     cmp eax, 2 ; compara DX (residuo) con cero
     je domingo
     cmp eax, 3 ; compara DX (residuo) con cero
     je lunes
     cmp eax, 4 ; compara DX (residuo) con cero
     je martes
     cmp eax, 5 ; compara DX (residuo) con cero
     je miercoles
     cmp eax, 6 ; compara DX (residuo) con cero
     je jueves
     
     jmp Exit
     

domingo:
       mov ecx, Domingo
       mov edx, 7
       Escribir ecx, edx
       jmp Exit
lunes:
        mov ecx, Lunes
	mov edx, 5
        Escribir ecx, edx 
        jmp Exit
martes:

        mov ecx, Martes
	mov edx, 6
        Escribir ecx, edx
        jmp Exit
miercoles:
        mov ecx, Miercoles
	mov edx, 9
        Escribir ecx, edx
        jmp Exit
jueves:
        mov ecx, Jueves
	mov edx, 6
        Escribir ecx, edx
        jmp Exit
viernes:
        mov ecx, Viernes
	mov edx, 7
        Escribir ecx, edx
        jmp Exit
sabado:
        mov ecx, Sabado
	mov edx, 6
        Escribir ecx, edx
        jmp Exit

     
ReadText:
	
        mov eax, 3
	mov ebx, 0
	mov ecx, Buffer
	mov edx, BuffLen
	int 80h
        ret  
        
 error:
         
         mov ecx,Error
         mov     edx, ErrorLen
         Escribir ecx, edx
         jmp Exit     

Exit: 
    mov     eax, 1
    xor     ebx, ebx
    int     80H


         
