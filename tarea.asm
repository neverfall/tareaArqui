;Lucy Chavez
;Carlos Chacón
;Instituto Tecnológico de Costa Rica, San José
;Escuela de Ingeniería en Computación
;IC-3101: Arquitectura de Computadores

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
respuesta_V: db "¡El año es bisiesto! y el dia cae:",10
TextoV:       equ     $-respuesta_V
respuesta_F: db "¡El año no es bisiesto! y el dia cae:",10
TextoF:       equ     $-respuesta_F
Error:      db      "Ingrese una fecha valida "
ErrorLen:   equ   $-Error
enero1 db "enero"
febrero1 db "febrero"
marzo1 db "marzo"
abril1 db "abril"
mayo1 db "mayo"
junio1 db "junio"
julio1 db "julio"
agosto1 db "agosto"
septiembre1 db "septiembre"
octubre1 db "octubre"
noviembre1 db "noviembre"
diciembre1 db "diciembre"

Lunes:     db   "LLL          UUU     UUU  NNNN     NN  EEEEEEEEEEE   SSSSSSSSSS ",10
           db   "LLL          UUU     UUU  NNNNN    NN  EEE          SS          ",10
           db   "LLL          UUU     UUU  NNN NN   NN  EEE          SS          ",10
           db   "LLL          UUU     UUU  NNN  NN  NN  EEEEEEE       SSSSSSSSSS ",10
           db   "LLL          UUU     UUU  NNN   NN NN  EEE                    SS",10
           db   "LLLLLLLLLLL  UUUUUUUUUUU  NNN    NNNN  EEE                    SS",10
           db   "LLLLLLLLLLL  UUUUUUUUUUU  NNN     NNN  EEEEEEEEEEE  SSSSSSSSSSS ",10
           
Luneslen:       equ $-Lunes
                
Martes:    db  "MMM	 MMM      AAA      RRRRRRRRRR   TTTTTTTTTTT  EEEEEEEEEEE   SSSSSSSSSS ",10
           db  "MM M    M MM     AA AA     RR       RR  TTTTTTTTTTT  EEE          SS          ",10
           db  "MM  M  M  MM    AA   AA    RR       RR      TTT      EEE          SS          ",10
           db  "MM   MM   MM   AA     AA   RRRRRRRRRR       TTT      EEEEEEE       SSSSSSSSSS ",10
           db  "MM        MM  AAAAAAAAAAA  RR   RR          TTT      EEE                    SS",10
	   db  "MM        MM  AA       AA  RR     RR        TTT      EEE                    SS",10
	   db  "MM        MM  AA       AA  RR      RR       TTT      EEEEEEEEEEE  SSSSSSSSSSS ",10
Marteslen:    equ $-Martes

Miercoles: db  "MMM      MMM  IIIIIIIIIII  EEEEEEEEEEE  RRRRRRRRRR      CCCCCCCCC    OOOOOOOO    LLL          EEEEEEEEEEE   SSSSSSSSSS  ",10
           db  "MM M    M MM  IIIIIIIIIII  EEE          RR       RR   CC            OO      OO   LLL          EEE          SS           ",10
           db  "MM  M  M  MM      III      EEE          RR       RR  CC            OO        OO  LLL          EEE          SS           ",10
           db  "MM   MM   MM      III      EEEEEEE      RRRRRRRRRR   CC            OO        OO  LLL          EEEEEEE       SSSSSSSSSS  ",10
           db  "MM        MM      III      EEE          RR   RR      CC            OO        OO  LLL          EEE                    SS ",10
           db  "MM        MM  IIIIIIIIIII  EEE          RR     RR     CC            OO      OO   LLLLLLLLLLL  EEE                    SS ",10
           db  "MM        MM  IIIIIIIIIII  EEEEEEEEEEE  RR      RR      CCCCCCCCC    OOOOOOOO    LLLLLLLLLLL  EEEEEEEEEEE  SSSSSSSSSSS  ",10
           
Miercoleslen:  equ $-Miercoles
                                                        
Jueves:    db  "JJJJJJJJJJJJ  UUU     UUU  EEEEEEEEEEE VV         VV  EEEEEEEEEEE   SSSSSSSSSS  ",10    
           db  "JJJJJJJJJJJJ  UUU     UUU  EEE          VV       VV   EEE          SS           ",10    
           db  "     JJ       UUU     UUU  EEE           VV     VV    EEE          SS           ",10
           db  "     JJ       UUU     UUU  EEEEEEE        VV   VV     EEEEEEE       SSSSSSSSSS  ",10
           db  "     JJ       UUU     UUU  EEE             VV VV      EEE                    SS ",10
           db  "JJJJJJJ       UUUUUUUUUUU  EEE              VVV       EEE                    SS ",10
           db  "JJJJJJ        UUUUUUUUUUU  EEEEEEEEEEE       V        EEEEEEEEEEE  SSSSSSSSSSS  ",10
JuevesLen: equ $-Jueves           
           
Viernes:   db  "VV         VV IIIIIIIIIII  EEEEEEEEEEE  RRRRRRRRRR    NNNN     NN  EEEEEEEEEEE   SSSSSSSSSS ",10
           db  " VV       VV  IIIIIIIIIII  EEE          RR       RR   NNNNN    NN  EEE          SS          ",10
           db  "  VV     VV       III      EEE          RR       RR   NNN NN   NN  EEE          SS          ",10
           db  "   VV   VV        III      EEEEEEE      RRRRRRRRRR    NNN  NN  NN  EEEEEEE       SSSSSSSSSS ",10
           db  "    VV VV         III      EEE          RR   RR       NNN   NN NN  EEE                    SS",10
           db  "     VVV      IIIIIIIIIII  EEE          RR     RR     NNN    NNNN  EEE                    SS",10
           db  "      V       IIIIIIIIIII  EEEEEEEEEEE  RR      RR    NNN     NNN  EEEEEEEEEEE  SSSSSSSSSSS ",10
           
Vierneslen:    equ $-Viernes 


Sabado:    db  " SSSSSSSSSS       AAA      BBBBBBBBB        AAA      DDDDDDDDD      OOOOOOOO  ",10
           db  "SS               AA AA     BB       B      AA AA     DD      DD    OO      OO ",10
           db  "SS              AA   AA    BB       B     AA   AA    DD       DD  OO        OO",10
           db  " SSSSSSSSSS    AA     AA   BBBBBBBBB     AA     AA   DD       DD  OO        OO",10
           db  "          SS  AAAAAAAAAAA  BB      BB   AAAAAAAAAAA  DD       DD  OO        OO",10
           db  "          SS  AA       AA  BB       BB  AA       AA  DD      DD    OO      OO ",10
           db  "SSSSSSSSSSS   AA       AA  BBBBBBBBBB   AA       AA  DDDDDDDDD      OOOOOOOO  ",10
           
Sabadolen:     equ $-Sabado

Domingo:   db  "DDDDDDD        OOOOOOOO    MMM      MMM  IIIIIIIIIII  NNNN     NN   GGGGGGGGGG    OOOOOOOO  ",10
           db  "DD      DD    OO      OO   MM M    M MM  IIIIIIIIIII  NNNNN    NN  GG            OO      OO ",10
           db  "DD       DD  OO        OO  MM  M  M  MM      III      NNN NN   NN  GG           OO        OO",10
           db  "DD       DD  OO        OO  MM   MM   MM      III      NNN  NN  NN  GG    GGGGG  OO        OO",10 
           db  "DD       DD  OO        OO  MM        MM      III      NNN   NN NN  GG       GG  OO        OO",10
           db  "DD      DD    OO      OO   MM        MM  IIIIIIIIIII  NNN    NNNN  GG       GG   OO      OO ",10
           db  "DDDDDDD        OOOOOOOO    MM        MM  IIIIIIIIIII  NNN     NNN   GGGGGGGGG     OOOOOOOO  ",10
           
Domingolen:   equ $-Domingo
                      
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
j1               resb 5
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
    mov ecx, Buffer          ;mueve el buffer que contiene la fecha entera al ecx
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
       je mesTraduc             ;si hay un espacio entonces salta a mes1 
       inc edi              ;si no incrementa los contadores
       inc esi              ;nos movemos al siguiente caracter de ecx
       jmp cicloYear        ;loop
mesTraduc:                   ;sirve para cambiar si el mes viene en formato "febrero" cambiarlo a 02 por ejemplo son comparaciones sencillas 
         xor eax,eax
         mov eax, [mes]
         cmp eax, [enero1]
         je eneroCH
         cmp eax, [febrero1] 
         je febreroCH
         cmp eax, [marzo1] 
         je marzoCH
         cmp eax, [abril1] 
         je abrilCH
         cmp eax, [mayo1] 
         je mayoCH
         cmp eax, [junio1] 
         je junioCH
         cmp eax, [julio1] 
         je julioCH
         cmp eax, [agosto1] 
         je agostoCH
         cmp eax, [septiembre1] 
         je septiembreCH
         cmp eax, [octubre1] 
         je octubreCH
         cmp eax, [noviembre1] 
         je noviembreCH
         cmp eax, [diciembre1] 
         je diciembreCH
         jmp year1
eneroCH:
      mov eax,01
      mov [mes],eax
febreroCH:
      mov eax,02
      mov [mes],eax
marzoCH:
      mov eax,03
      mov [mes],eax
abrilCH:
      mov eax,04
      mov [mes],eax
mayoCH:
      mov eax,05
      mov [mes],eax
junioCH:
      mov eax,06
      mov [mes],eax
julioCH:
      mov eax,07
      mov [mes],eax
agostoCH:
      mov eax,08
      mov [mes],eax
septiembreCH:
      mov eax,09
      mov [mes],eax 
octubreCH:
      mov eax,10
      mov [mes],eax      
noviembreCH:
      mov eax,11
      mov [mes],eax
diciembreCH:
      mov eax,12
      mov [mes],eax      
year1:
            
       xor ebx, ebx
       xor ecx, ecx
       xor edx, edx
       
       xor eax, eax
       mov   eax,[dia]      ;mueve al eax el contenido del buffer dia
       call atoi            ;llama a el procedimiento atoi 
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

      mov [bufferAtoi],eax    ;mueve el contenido del buffer (dia, mes o año) al bufferAtoi para la conversion a int
      mov esi,bufferAtoi      ;mueve el bufferAtoi a el esi

      mov     eax, 0          ;el eax y el ecx son contadores
      mov     ecx, 0          
 
.ciclo:
      xor     ebx, ebx          
      mov     bl, byte[esi+ecx]    ;hace comparaciones para determinar el valor del string o si ya es un int
      cmp     bl, 48          
      jl      .terminarCiclo       
      cmp     bl, 57          
      jg      .terminarCiclo       
      cmp     bl, 10          
      je      .terminarCiclo       
      cmp     bl, 0           
       jz      .terminarCiclo       
 
       sub     bl, 48           ;el valor le resta y divide 48 y 10 para dar su valor entero
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
          mov eax,[bufAux] ;buffer para detectar si es o no el año biciesto 
          mov ebx,0
          mov [bufAux],ebx
         
	 mov     ecx, respuesta_F
         mov     edx, TextoF
         Escribir ecx, edx
       
	
	


;###############################CALCULAR DIA DE LA SEMANA###############################
preparar:              ;se encarga de preparar el mes y el año y las variables k y j para ser operados en el algoritmo de zeller 
    xor eax, eax    
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov eax, [mes]    ;mueve al eax el mes para comparar si es enero o febrero de ser asi les sumaria 12 ya que enero y febrero cuentan como mes 13 y 14 respectivamente
    cmp eax, 02       
    jle mesMenor      ;si es igual o menor a 02 salta a mesMenor
    jmp mesMayor
mesMenor:
   mov ebx, 12
   add eax, ebx      ;le suma 12 a el eax que contiene el mes
   xor ebx, ebx
   mov ebx, [year]
   mov esi, 1
   sub ebx,esi    ;le resta 1 a el año 1 
   xor esi,esi
   mov [mes],eax
   mov [year], ebx
   jmp K
   ;EBX TIENE EL AÑO EAX TIENE EL MES
mesMayor:
   mov eax, [mes]
   xor ebx, ebx 
  mov ebx, 2
   sub eax, ebx
   xor ebx,ebx
   mov [mes],eax
  
   
K:                 ;prepara la variable K
  xor eax,eax
  xor ecx,ecx
  xor edx,edx
  mov eax, [year]     ;le hace "mod 100" a el año que es el residuo de dividir el año entre 100
  mov ecx, 100
  div ecx
  mov [k],edx      ;mueve el residuo a la variable k
 
  
J:                   ;prepara la variable J
  xor eax,eax
  xor ecx,ecx
  xor edx,edx
  mov eax, [year]     
  mov ecx, 100
  IDIV ecx          ;hace division entera a el año con 100
  mov [j] ,eax      ;el resultado lo guarda en la variable J

  
K1:                   ;k1 es el resultado de dividir el k entre 4 
       xor eax,eax
       xor ecx,ecx
       xor edx, edx
       mov eax, [k]     
       mov ecx, 4
       div ecx
       mov [k1], eax

J1:               ;j1 es el resultado de dividir j entre 4
      xor eax,eax
       xor ecx,ecx
       xor edx, edx
       mov eax, [j]     
       mov ecx, 4
       div ecx
       mov [j1], eax
zeller:         ;el algoritmo que calcula el dia de la semana
       xor eax,eax   ;limpiamos los registros
       xor ebx,ebx
       xor ecx,ecx
       xor edx,edx
       
       
       mov eax, [mes]   ;mnovemos al eax el mes
       inc eax         ;y le sumamos 1 
       mov ecx, 26  
       mul ecx       ;eso lo multiplicmos por 26
       xor ecx, ecx
       mov ecx, 10 
       idiv ecx     ;y eso lo dividimos entero entre 10 
       mov ebx, eax
       add eax, ebx ;y luego lo sumamos
       
       xor ecx,ecx
       mov ecx,[k]
       add eax, ecx  ;sumamos el resultado con el valor de k
       xor ecx, ecx
       mov ecx, [k1]  ;sumamos ese resultado con el valor de k1 y despues con el valor de j1
       add eax, ecx
    
       xor ecx,ecx
       mov ecx,[j1]
       add eax,ecx
       
       xor ecx, ecx
       push eax
       mov eax,[j]    ;luego multiplicamos por 5 la j para luego sumarla al resultado
       mov ecx, 5
       mul ecx
       mov ebx ,eax
       pop eax
       add eax,ebx
       xor ebx,ebx
       mov ebx,[dia]  ;luego le sumamos el dia
       add eax, ebx
       mov ecx, 7    ;y luego dividimos el resultado por 7 el residuo seria la clave del valor del dia el dia dependera si es bisiesto o no
       div ecx
       mov eax,edx
       xor ebx,ebx
       mov ebx,[bufAux] ;si el dia es bisiesto entonces muestra un codigo diferente al de si no lo es 
       cmp ebx, 1
       je comparacion
       jmp comparacionNo
comparacion:     ;si es bisiesto usa este codigo
          
     cmp eax, 0 
     je sabado
     cmp eax, 1 
     je domingo
     cmp eax, 2 
     je lunes
     cmp eax, 3 
     je martes
     cmp eax, 4 
     je miercoles
     cmp eax, 5 
     je jueves
     cmp eax, 6 
     je viernes
     
     jmp error     

comparacionNo:     ;si no lo es entonces usa este 

     cmp eax, 0 
     je martes
     cmp eax, 1 
     je miercoles
     cmp eax, 2 
     je jueves
     cmp eax, 3 
     je viernes
     cmp eax, 4 
     je sabado
     cmp eax, 5 
     je domingo
     cmp eax, 6 
     je lunes
     
     jmp error          
;##########################IMPRESION DE BANNERS##########################3
domingo:                   
       mov ecx, Domingo
       mov edx, Domingolen
       Escribir ecx, edx
       jmp Exit
lunes:
        mov ecx, Lunes
	mov edx, Luneslen
        Escribir ecx, edx 
        jmp Exit
martes:

        mov ecx, Martes
	mov edx, Marteslen
        Escribir ecx, edx
        jmp Exit
miercoles:
        mov ecx, Miercoles
	mov edx, Miercoleslen
        Escribir ecx, edx
        jmp Exit
jueves:
        mov ecx, Jueves
	mov edx, JuevesLen
        Escribir ecx, edx
        jmp Exit
viernes:
        mov ecx, Viernes
	mov edx, Vierneslen
        Escribir ecx, edx
        jmp Exit
sabado:
        mov ecx, Sabado
	mov edx, Sabadolen
        Escribir ecx, edx
        jmp Exit

     
ReadText:
	
        mov eax, 3
	mov ebx, 0
	mov ecx, Buffer
	mov edx, BuffLen
	int 80h
        ret  
        
 error:  ;Si no se ingresa una fecha correcta envia un mensaje de error
         
         mov ecx,Error
         mov     edx, ErrorLen
         Escribir ecx, edx
         jmp Exit     

Exit: 
    mov     eax, 1
    xor     ebx, ebx
    int     80H


         
