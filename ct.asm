

EXTRN p1name :BYTE
EXTRN p2name :BYTE

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
LOCAL READ
LOCAL FINISH
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

CURSOR MACRO X, Y
	MOV AH,2       ;move cursor function
	MOV DH,Y	   ;DH = Y
	MOV DL,X       ;DL = X
	MOV BH,0 	   ;Display Page
	INT 10H        ;Execute
ENDM CURSOR

SCROLL MACRO X, Y, EX, EY
	MOV AX, 0601h    ; Scroll up function
	MOV CH, Y     ; Upper left corner CH=row, CL=column
	MOV CL, X
	MOV DH, EY   ; lower right corner DH=row, DL=column
	MOV DL, EX
	MOV BH, 60h    
	INT 10H
ENDM SCROLL
 PUBLIC ct
.MODEL SMALL
.386
.STACK 64
.DATA 



VAR DW 0;
InputString DB 'THis iS A TEsT MESsaGE$' ; 10 line feed , 13 carriage return
start1 DB 'Press C to Enter the chat mode$'
start2 DB 'Press Z to Continue to the game$'
start3 DB 'Press Ctrl+F9 to exit$'
chat DB 'Welcome to chat mode$'
WAITT DB 'Wait For The Other Player$'
;PlayerName1 DB 'Enter Your Name:$'
;PlayerName2 DB 'Enter 2nd Player Name:$'
MAX DW 30D


S1 DB '0'
S2 DB '0'

Winner DB ' is the winner$'
Press DB ' Press any key to continue$'



SPLIT DB ' =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-= ', '$'
BYE DB 'End of Chatting mode', '$'
SPACE DB ' ', '$'
CHAR DB '$', '$'
CHAR1 DB '$', '$'
CHAR3 DB '$', '$'
;SENDMES DB ?, '$'
RESCHAR DB '$', '$'
RESCHAR1 DB '$', '$'
RESCHAR2 DB '$', '$'
RESCHAR3 DB '$', '$'
X1 DB 00H
Y1 DB 01H
EX1 DB 00H
EY1 DB 00H
X2 DB 00H
X3 DB 00H
Y2 DB 0eH
EX2 DB 00H
EY2 DB 0CH

.CODE

ct PROC  FAR
                    
        MOV AX, @DATA
        MOV DS, AX


       ; CALL INITIALIZEUART
       ; CALL InputNames
        call ChatMode
		ret
        ;CALL WaitOtherPlayer
       ; ENDCHAT:	
	    ;ENDOTher:
	
	RecalMainScreen:
		;SENDING 27
		   mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cx,00
               mov dx,184fh
               int 10h
		ret
	      CALL CLEAR
		 CALL SetVideoMode
         CALL SETBG   
		 CALL ESCA
		 ret

ct ENDP





ChatMode PROC NEAR 

    CALL SetVideoMode
    CALL SETBG
	
       ; MOV DX, 0907H
       ; CALL MoveCursor

       ; LEA dx, chat
        ;CALL DisplayMsg 
		
		CALL INITIALIZEUART
		CALL CLEAR
		CURSOR 0, 0
		mov ah,9 
		mov dx, OFFSET p1name[2] 
		int 21h
        CURSOR p1name[1],0
		mov ah,2
		mov dl,':'
		int 21h
		CURSOR 00H, 0CH
		MOV SI, OFFSET SPLIT
		CALL DISPLAYMESSAGE
		mov ah,9 
		mov dx, OFFSET p2name[2]
		int 21h
         CURSOR p2name[1],0dH
		mov ah,2
		mov dl,':'
		int 21h
		CURSOR 0, 1
		
		
	;MAIN LOOP ==> Infinite LOOP as long as the program is running
	CHECKCHAT:
		MOV RESCHAR, '$'
		;We have two possibilities: 1) Sending 2) Recieve
		MOV AH, 1;get key pressed function (don't wait)
		INT 16H  ;execute
		JNZ SEND ;Ther is a key pressed = sending a message or closing chat
		JMP RES  ;No key pressed then recieving a message
		
		SEND:
			MOV AH, 0 ;get key pressed function (wait)
			INT 16H   ;execute
			
			CMP AL, 27 ;ESC key
			JZ RecalMainScreen
			
			CMP AH, 1CH ;ENTER key
			JZ ENT
			
			
			
			CMP AL, 08 ;BACKSPACE
			JZ BACKSPACE
			
			MOV CHAR, AL
			CURSOR X1, Y1
			MOV SI, OFFSET CHAR
			CALL DISPLAYMESSAGE
			SENDING CHAR
			
			INC X1
			CMP X1, 80
			JE COLOVERFLOWHELPER
			BACKSEND:
			JMP RES
		
		
		ENT:
			mov al, X1
			mov x3, al        
			MOV X1, 0
			ADD Y1, 1
			CMP Y1, 12
			JE NEWLINE1
			CONT_SE:
			CURSOR X1, Y1
			SENDING 0CH
			JMP ENDSEND
			
		   ;ESCAHELPER:
            ;CALL ESCA
            ;SENDING 27
            ;JMP ENDSEND
			
        
           ; CALL ESCA
           ; SENDING 27
            ;JMP RecalMainScreen
		COLOVERFLOWHELPER:
			JMP COLOVERFLOW
		BACKSPACE:
			CURSOR X1, Y1
			MOV SI, OFFSET SPACE
			CALL DISPLAYMESSAGE
			cmp X1,0
			je fixed
			DEC X1
			fixed:
			CURSOR X1, Y1
			SENDING SPACE
			JMP ENDSEND
		
		JMPCHECKCHAT:
			JMP CHECKCHAT	
		
		NEWLINE1:
			SCROLL 0, 0, 79, 11
			MOV Y1, 11
			JMP CONT_SE
			
		COLOVERFLOW:
			MOV X1, 0
			INC Y1
			CMP Y1, 12
			JE ROWOVERFLOW
			BACKCOLOVERFLOW:
			JMP BACKSEND
		ROWOVERFLOW:
			SCROLL 0, 0, 79, 11
			MOV Y1, 11
			JMP BACKCOLOVERFLOW
		

		ENDSEND:
		RES:
			RECEIVING RESCHAR
			CMP RESCHAR, '$'
			JE JMPCHECKCHAT
			
			CMP RESCHAR, 0CH
			JE ENTRES
			
			CMP RESCHAR, 08
			JE BACKSPACERES

            CMP RESCHAR, 27 ;ESC key
			JZ out2
			
			
			CURSOR X2, Y2
			MOV SI, OFFSET RESCHAR
			CALL DISPLAYMESSAGE
			INC X2
			CMP X2, 80
			JE COLOVERFLOWRES
			BACKSENDRES:
			JMP JMPCHECKCHAT
			
		ENTRES:        
			MOV X2, 0
			ADD Y2, 1
			CMP Y2, 24
			JE NEWLINE2
			CONT_RES:
			CURSOR X2, Y2
			JMP JMPCHECKCHAT
			
		BACKSPACERES:
			CURSOR X2, Y2
			MOV SI, OFFSET SPACE
			CALL DISPLAYMESSAGE
			cmp X2,0
			je fixed2
			DEC X2
			fixed2:
			CURSOR X2, Y2
			JMP JMPCHECKCHAT
        ;ESCAHELPEREC:
           ; CALL ESCA
            ;JMP ENDCHAT 
			
		NEWLINE2:
			SCROLL 0, 0DH, 79, 24
			CURSOR 0, 12
			MOV SI, OFFSET SPLIT
			CALL DISPLAYMESSAGE
			MOV Y2, 23
			JMP CONT_RES
			
		COLOVERFLOWRES:
			MOV X2, 0
			INC Y2
			CMP Y2, 24
			JE ROWOVERFLOWRES
			COLOVERFLOWRESBACK:
			JMP BACKSENDRES
			
		ROWOVERFLOWRES:
			SCROLL 0, 0DH, 79, 24
			CURSOR 0, 12
			MOV SI, OFFSET SPLIT
			CALL DISPLAYMESSAGE
			MOV Y2, 23
			JMP COLOVERFLOWRESBACK

	JMP CHECKCHAT
	
	out2:
	ret
    	
RET 
ChatMode ENDP

		   





SetVideoMode PROC NEAR
        mov ah , 00h     ; call of the interrupt (VSet video mode)
        mov al , 0Dh     ; chosing the video mode type (13h  for 320x200 256 color graphics (MCGA,VGA))
        int 10h          ; excution of the interrupt 
RET 
SetVideoMode ENDP 

SetBG PROC NEAR 
        mov ah , 0Bh     ; call of the interrupt (set bg color) .... would change it later to have image bg
        mov bh , 00h        
        mov bl , 3h     ; 8 for the grey color 
        int 10h          ; excution of the interrupt 
RET 
SETBG ENDP 

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
			;0:SET BREAK DISABLED
			;011:EVEN PARITY
			;0:ONE STOP BIT
			;11:8BITS
		OUT DX,AL
		RET
	INITIALIZEUART ENDP
	
	CLEAR PROC NEAR
		MOV AX, 0600h    ; Scroll up function
		XOR CX, CX     ; Upper left corner CH=row, CL=column
		MOV DX, 184FH  ; lower right corner DH=row, DL=column
		MOV BH, 00    
		INT 10H
		RET
	CLEAR ENDP
	
	
	DISPLAYMESSAGE PROC NEAR
		MOV AH, 9		;Display string function
		MOV DX, SI		;offset of the string
		INT 21H			;execute
		RET
	DISPLAYMESSAGE ENDP
	
	ESCA PROC NEAR
		CALL CLEAR
		CURSOR 0, 0
		MOV SI, OFFSET BYE
		CALL DISPLAYMESSAGE
        RET
	ESCA ENDP
	
end ct
end ct

