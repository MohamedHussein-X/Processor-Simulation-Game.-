        
		
		
		
		 EXTRN p1point :BYTE
EXTRN p2point :BYTE
		 
		
		
        PUBLIC PRO2
.MODEL SMALL
.386
.STACK 1000H
.DATA
mmsg db 5, 10 dup ('$')
Ball_X db 0ah  ; x pos of the ball  
Ball_y db 0ah  ; y pos of the ball  
Ball_Size db 0ah ;ball size
Col db 0fh 

Ball_Velx db 04h
Ball_Vely db 05h 

Time_Aux db 0

gunxobj1pos dw 160
gun1speed dw 4
xgun1width dw 0 
gun1color db 2
lazor1color db 4
gun1buttonright db 4dh
gun1buttonleft db  4bh
gun1buttonshoot db 39h
gunshoothit1 db 0

p1points db 0


gunxobj2pos dw 160
gun2speed dw 4
xgun2width dw 0 
gun2color db 7
lazor2color db 6
gun2buttonright db 4dh
gun2buttonleft db  4bh
gun2buttonshoot db 39h
gunshoothit2 db 0

p2points db 0

exitguns db 1bh
keygotten db 1
keygotten2 db 1

Blue1 db 0
Red1 db 0
Green1 db 0
Yel1 db 0
LBlue1 db 0

Blue2 db 0
Red2 db 0
Green2 db 0
Yel2 db 0
LBlue2 db 0
 
var1 db 0
var1_2 db 0

var2 db 0
var3 db 0
Point_X db 82

gun1header db "p1$"
gun2header db "p2$"

CHAR DB '$', '$'
		;SENDMES DB ?, '$'
		RESCHAR DB '$', '$'

        timecol db 0

.CODE   

INITIALIZEUART PROC NEAR
		;SET DIVISOR LATCH ACCESS BIT
		MOV DX,3FBH 			; LINE CONTROL REGISTER
		MOV AL,10000000B		;SET DIVISOR LATCH ACCESS BIT
		OUT DX,AL				;OUT IT

		;SET LSB BYTE OF THE BAUD RATE DIVISOR LATCH REGISTER.
		MOV DX,3F8H			
		MOV AL,0CH			
		OUT DX,AL

		;SET MSB BYTE OF THE BAUD RATE DIVISOR LATCH REGISTER.
		MOV DX,3F9H
		MOV AL,00H
		OUT DX,AL

		;SET PORT CONFIGURATION
		MOV DX,3FBH
		MOV AL,00011011B
			;0:ACCESS TO RECEIVER BUFFER, TRANSMITTER BUFFER
			
		OUT DX,AL
		RET
	INITIALIZEUART ENDP

  SENDING MACRO VALUE
LOCAL AGAIN
;PUSHA
;Check that Transmitter Holding Register is Empty
	mov dx,3FDH		; Line Status Register
AGAIN:
	In al,dx 			;Read Line Status
  	AND al,00100000b
  	JZ AGAIN

;If empty put the VALUE in Transmit data register
  	mov dx,3F8H		; Transmit data register
  	mov al,VALUE
  	out dx,al 
;POPA
ENDM SENDING

RECEIVING MACRO VALUE
	;PUSHA
  ;CHECK THAT DATA READY
  MOV DX,3FDH		; LINE STATUS REGISTER
  IN AL,DX 
  AND AL,1
  JNZ READ 
  JMP FINISH

  READ:
  ;IF READY READ THE VALUE IN RECEIVE DATA REGISTER
	MOV DX,03F8H
	IN AL,DX 
	MOV VALUE,AL

  FINISH:
	;POPA
ENDM RECEIVING

DispHitPoits2 proc near
    mov ah,02
    ;mov dl,Point_x
    mov dh,16
    int 10h
    
    mov ah,02

    mov dl,var1

   cmp var1,9
   ja disppointsnormal2
   cmp var1,0
   jb disppointsnormal2
   add dl,30h
   int 21h
   ret
    disppointsnormal2:
    mov dl,'+'
    int 21h
    ret

    ;;;;;;;;;;;;; add a 9+ check
    ret
DispHitPoits2 endp

DispHitPoits1 proc near
    mov ah,02
    ;mov dl,Point_x
    mov dh,18
    int 10h
    
    mov ah,02

    mov dl,var1

   cmp var1,9
   ja disppointsnormal1
   cmp var1,0
   jb disppointsnormal1
   add dl,30h
   int 21h
   ret
    disppointsnormal1:
    mov dl,'+'
    int 21h
    ret

    ;;;;;;;;;;;;; add a 9+ check
    ret
DispHitPoits1 endp


Draw_Ball proc near 
 
    ; start delay

mov cx, 0f40h;86A0h
mov dx, 0ffh ;0001h
int 15h
; end delay
   
   mov cl,Ball_x
   mov dl,Ball_y
   mov ch,0
   mov dh,0
   Draw_Ball_Horz:
   mov ah,0ch 
   mov al,Col
   mov bh,00h
   int 10h

   inc cx
   mov ax,cx
   sub al,Ball_X
   cmp al,Ball_Size
   jng Draw_Ball_Horz
   mov cl,Ball_X
   inc dx
   mov ax,dx
   sub al,Ball_Y  
   cmp al,Ball_Size
   jng Draw_Ball_Horz
    
   ret
Draw_Ball endp 

Draw_Random proc near 
    
    Check_Time: ; Func to Check time to do actions 
     
     mov ah,2ch 
     int 21h ; Ah = 2ch/int 21h to get time return CH= hours ,CL= Minutes ,DH= Seconds, DL=1/100 Seconds
     cmp dl ,Time_Aux ;Id dl == time_Aux so time still the same .. no actions will be taken  
     je Check_Time  ; Check till time pass 
      ; If it is different go and draw ball 
     mov Time_Aux,dl ; Update Time 
     
     mov al ,Ball_Velx
     add Ball_X,al
     ; ----------------- Add black background to remove the tail       
        mov ah,00h
        mov al,13h
        int 10h

        mov ah,0bh
        mov bh,00h
        mov bl,00h
        int 10h
     ; ----------------------------------------------------------
     ; Set ball color 
    

    mov ah ,0bh 
    cmp timecol,2 
    je Col1  
    cmp timecol,24 
    je Col1  
    cmp timecol,54 
    je Col1 
    cmp timecol,74
    je Col1
    cmp timecol,94
    je Col1
    jmp Nochnge
    Col1:
    push dx
    mov dh,timecol
     mov Col,dh
     pop dx
     Nochnge:
     add timecol,2
     cmp timecol, 114
     jbe timecolskip
     mov timecol,0
     timecolskip:

     call Draw_Ball
     push dx
     push cx 
      mov cl,Blue1
      mov ch,0
      mov dl,82
      mov var1,cl
     call DispHitPoits1
     
     mov cl,Red1
     mov var1,Cl
     mov ch,0
     mov dl,85    
      call DispHitPoits1
      
      mov cl,Yel1             
      mov var1,cl
      mov ch,0
      mov dl, 88  
      call DispHitPoits1
      
      mov cl,LBlue1
      mov var1,cl
      mov dl, 91  
      call DispHitPoits1
      
      mov cl ,Green1 
      mov var1,cl
      mov dl, 94  
      call DispHitPoits1

      mov cl,Blue2
      mov ch,0
      mov dl,82
      mov var2,cl
      call DispHitPoits2
      
      mov cl,Red2
      mov var1,Cl
      mov ch,0
      mov dl,85    
      call DispHitPoits2
      
      mov cl,Yel2
      mov var1,cl
      mov ch,0
      mov dl, 88  
      call DispHitPoits2
      
      mov cl,LBlue2
      mov var1,cl
      mov ch,0
      mov dl, 91  
      call DispHitPoits2
      
      mov cl ,Green2
      mov var1,cl
      mov ch, 0
      mov dl, 94  
      call DispHitPoits2

      mov ah,02
      mov dh,16
      mov dl, 96
      int 10h
      mov ah,9
      mov dx, offset gun2header
      int 21h

      mov ah,02
      mov dh,18
      mov dl,96
      int 10h
      mov ah,9
      mov dx, offset gun1header
      int 21h
      
       pop cx
       pop dx
       mov bl, Ball_y 
       mov al, Ball_x
       mov Cl, Col
       mov ch,0 
       mov bh,0 
       mov ah,0  
       mov dh,0 
       mov dl, Ball_Size
       push ax 
       push bx 
       push cx
       push dx 
       mov Ball_Size,16h
       
       
       mov Ball_y,160
       
       mov Ball_X ,10
       mov Col, 2 
       call Draw_Ball  ; Draw Blue Ball 
       
       
       mov Ball_X ,35
       mov Col, 24 
       call Draw_Ball  ; Draw Red Ball 
       
       
       mov Ball_X ,60
       mov Col, 54 
       call Draw_Ball  ; Draw Yellow Ball
       
       
       mov Ball_X ,85
       mov Col, 74 
       call Draw_Ball  ; Draw Light Blue Ball  
       
       
       mov Ball_X ,110
       mov Col, 94 
       call Draw_Ball  ; Draw Green Ball
       pop dx 
       pop cx
       pop bx
       pop ax  
       
       mov Ball_x,al
       mov Ball_y,bl  
       mov Col,Cl 
       mov Ball_Size,dl

     mov ah, 1   ; peek
     int 16h
     jz  gunnokey
     mov ah, 0   ; get
     int 16h
     gunnokey:

     mov  keygotten,ah
     ;mov keygotten2,ah


     SENDING ah
     RECEIVING keygotten2

     ; start delay

mov cx, 0D40h;86A0h
mov dx, 0ffffh ;0001h
int 15h
; end delay


     call gunmoveandshoot
     call gun2moveandshoot 
       
       
       mov al,Ball_X
      cmp al,110
       je GetOut
       
      
    
       
     jmp  Check_Time          
    ret          
    GetOut:
    inc var3
    mov al,var3
    cmp al,3
    jae GetOut2
    jmp  Check_Time
    ret 
    GetOut2: 
    ret
    Draw_Random endp 


    
pro2 PROC far
    
    MOV AX, @DATA
    MOV DS, AX

		;CALL INITIALIZEUART
   


    ;mov ah,00h
    ;mov al,13h
    ;int 10h
    mov ah,0bh
    mov bh,00h
    mov bl,00h
    int 10h   
    mov var3,0
    mov Blue1,0
    mov Blue2,0

    mov Green1,0
    mov Green2,0
    mov LBlue1,0
    mov LBlue2,0
    mov Yel1,0
    mov Yel2,0
    mov red1,0
    mov red2,0




    
   call Draw_Random 
      
       ret
    pro2 ENDP




gunmoveandshoot proc near

call drawgun

movegun:       

mov ah,keygotten
cmp ah, gun1buttonright
je gunmovementright

cmp ah, gun1buttonleft  
je gunmovementleft

cmp ah, gun1buttonshoot 
je gunshoot


;cmp ah, exitguns 
;je removeguncontrol ;;control should be put outside not here

jmp gunmovement

gunmovementright:
cmp gunxobj1pos,290
je gunmovement
mov bx, gun1speed
add gunxobj1pos,bx
jmp gunmovement

gunmovementleft:
cmp gunxobj1pos,10
je gunmovement
mov bx, gun1speed
sub gunxobj1pos,bx
jmp gunmovement


gunmovement:


call drawgun

jmp removeguncontrol

gunshoot:
call drawgunlazor
     push bx
     push cx 
     push dx
     mov dl,Ball_X
     mov cl,Ball_X
     add cl, Ball_Size
     mov ch,0
     mov dh,0 
     mov bx ,gunxobj1pos
     add bx,3
     
     cmp bx,dx
     jna Continue1
     cmp bx,cx
     jnb Continue1
       
     Cmp Col,24
     je IncRed1

     cmp Col,94 
      je IncGn1
     Cmp Col,2
     je IncBl1
     Cmp Col,74          
     je IncLBl1
     cmp Col,54
     je IncYel1
        
      
     IncYel1:
     inc Yel1
     add p1point,2
     jmp Continue1
     
     IncLBl1:
     Inc LBlue1
     add p1point,2

     jmp Continue1
     
     IncBl1: 
     inc Blue1
     add p1point,2

     jmp Continue1
     
     IncGn1:
     inc Green1
     add p1point,2

     jmp Continue1
     
     IncRed1:
     inc Red1
     add p1point,2

     jmp Continue1 
     
     
       Continue1:
      pop dx
      pop cx 
      pop bx
     
     gun1movement:


call drawgun
     
  mov ah,0         
mov al, Ball_x

gunshootmiss1:


;jmp movegun

removeguncontrol:


hlt
ret
               
gunmoveandshoot endp
drawgun proc near

                mov bx,gunxobj1pos
                add bx,6            ;change the number here to adjust the width!!  
                
                mov  cx,gunxobj1pos
                drawsquareflyingobj11:
                                   ;vertivalll ine 
                mov  dx,190
                mov  al,gun1color
                mov  ah,0ch	 

                vertcalline11:       
    
                int  10h
                inc  dx
                cmp  dx,200
                jbe  vertcalline11   
                
                inc cx 
                cmp cx,bx
                jbe drawsquareflyingobj11
                
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                mov bx,gunxobj1pos
                add bx,4            ;change the number here to adjust the width!!  
                
                mov  cx,gunxobj1pos
                add cx,2
                drawsquareflyingobj22:
                                   ;vertivalll ine 
                mov  dx,180
                mov  al,gun1color
                mov  ah,0ch	 

                vertcalline22:       
    
                int  10h
                inc  dx
                cmp  dx,185
                jbe  vertcalline22   
                
                inc cx 
                cmp cx,bx
                jbe drawsquareflyingobj22
                ;;;;;;;;;;;;;;;;;;;;;;;
                
                ret

drawgun endp

drawgunlazor proc 
                mov cx,3
                add cx, gunxobj1pos
                                  ;vertivalll ine 
                mov  dx,0
                mov  al,lazor1color
                mov  ah,0ch	 
                
                lazorvertcalline:       
                
                int  10h
                inc  dx
                cmp  dx,200
                jbe  lazorvertcalline   
                
                  
            
ret
drawgunlazor endp

drawgun2 proc near

                mov bx,gunxobj2pos
                add bx,6            ;change the number here to adjust the width!!  
                
                mov  cx,gunxobj2pos
                drawsquareflyingobj111:
                                   ;vertivalll ine 
                mov  dx,190
                mov  al,gun2color
                mov  ah,0ch	 

                vertcalline111:       
    
                int  10h
                inc  dx
                cmp  dx,200
                jbe  vertcalline111  
                
                inc cx 
                cmp cx,bx
                jbe drawsquareflyingobj111
                
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                mov bx,gunxobj2pos
                add bx,4            ;change the number here to adjust the width!!  
                
                mov  cx,gunxobj2pos
                add cx,2
                drawsquareflyingobj222:
                                   ;vertivalll ine 
                mov  dx,180
                mov  al,gun2color
                mov  ah,0ch	 

                vertcalline222:       
    
                int  10h
                inc  dx
                cmp  dx,185
                jbe  vertcalline222   
                
                inc cx 
                cmp cx,bx
                jbe drawsquareflyingobj222
                ;;;;;;;;;;;;;;;;;;;;;;;
                
                ret

drawgun2 endp

drawgun2lazor proc near
                mov cx,3
                add cx, gunxobj2pos
                                  ;vertivalll ine 
                mov  dx,0
                mov  al,lazor2color
                mov  ah,0ch	 
                
                lazor2vertcalline:       
                
                int  10h
                inc  dx
                cmp  dx,200
                jbe  lazor2vertcalline   
                
                  
            
ret
drawgun2lazor endp

gun2moveandshoot proc near

;call drawgun2

movegun2:       

  mov ah, keygotten2

cmp ah, gun2buttonright
je gun2movementright

cmp ah, gun2buttonleft  
je gun2movementleft

cmp ah, gun2buttonshoot 
je gun2shoot


;cmp ah, exitguns 
;je removeguncontrol ;;control should be put outside not here

jmp gun2movement

gun2movementright:
cmp gunxobj2pos,290
je gunmovement
mov bx, gun2speed
add gunxobj2pos,bx
jmp gun2movement

gun2movementleft:
cmp gunxobj2pos,10
je gunmovement
mov bx, gun2speed
sub gunxobj2pos,bx
jmp gun2movement




gun2shoot:
call drawgun2lazor
     push bx
     push cx 
     push dx
     mov dl,Ball_X
     mov cl,Ball_X
     add cl, Ball_Size
     mov ch,0
     mov dh,0 
     mov bx ,gunxobj2pos
     add bx,3
     
     cmp bx,dx
     jna Continue2
     cmp bx,cx
     jnb Continue2
       
     Cmp Col,24
     je IncRed2

     cmp Col,94 
      je IncGn2
     Cmp Col,2
     je IncBl2
     Cmp Col,74          
     je IncLBl2
     cmp Col,54
     je IncYel2
        
      
     IncYel2:
     inc Yel2
     add p2point,2

     jmp Continue2
     
     IncLBl2:
     Inc LBlue2
     add p2point,2

     jmp Continue2
     
     IncBl2: 
     inc Blue2
     add p2point,2

     jmp Continue2
     
     IncGn2:
     inc Green2
     add p2point,2

     jmp Continue2
     
     IncRed2:
     inc Red2
     add p2point,2

     jmp Continue2 
     
     
       Continue2:
      pop dx
      pop cx 
      pop bx
     

     gun2movement:


call drawgun2

jmp removegun2control
;mov ah,0         
;mov al, Ball_x
;cmp gunxobj2pos, ax    ;;;;;;;;;;repeat those 2 lines here for all flying position objects
;jne gunshootmiss2

;mov gunshoothit2, 1

;gunshootmiss2:

; start delay

;mov cx, 0D40h;86A0h
;mov dx, 0003h ;0001h
;int 15h
; end delay

;jmp movegun2

removegun2control:
hlt
ret
               
gun2moveandshoot endp





END pro2

 