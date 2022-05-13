
EXTRN ct:FAR
   
   
   EXTRN p2ax :word
		EXTRN p2bx :word
		EXTRN p2cx :word
		EXTRN p2dx :word
		EXTRN p2si :word
		EXTRN p2di :word
		EXTRN p2sp :word
		EXTRN p2bp :word
		EXTRN p2ah :BYTE
		EXTRN p2bh :BYTE
		EXTRN p2al :BYTE
		EXTRN p2bl :BYTE
		EXTRN p2ch :BYTE
		EXTRN p2cl :BYTE
     EXTRN p2dh :BYTE
		EXTRN p2dl :BYTE
		EXTRN p2sil :BYTE
		EXTRN p2sih :BYTE
		EXTRN p2dih  :BYTE
		EXTRN p2dil  :BYTE
		EXTRN p2sph :BYTE
		EXTRN p2spl :BYTE
		EXTRN p2bpl :BYTE
		EXTRN p2bph :BYTE

    EXTRN p3ax :word
		EXTRN p3bx :word
		EXTRN p3cx :word
		EXTRN p3dx :word
		EXTRN p3si :word
		EXTRN p3di :word
		EXTRN p3sp :word
		EXTRN p3bp :word
		EXTRN p3ah :BYTE
		EXTRN p3bh :BYTE
		EXTRN p3al :BYTE
		EXTRN p3bl :BYTE
		EXTRN p3ch :BYTE
		EXTRN p3cl :BYTE
     EXTRN p3dh :BYTE
		EXTRN p3dl :BYTE
		EXTRN p3sil :BYTE
		EXTRN p3sih :BYTE
		EXTRN p3dih  :BYTE
		EXTRN p3dil  :BYTE
		EXTRN p3sph :BYTE
		EXTRN p3spl :BYTE
		EXTRN p3bpl :BYTE
		EXTRN p3bph :BYTE
    EXTRN level :BYTE
     EXTRN endornot :BYTE
EXTRN p1name :BYTE
EXTRN p2name :BYTE
EXTRN p1point :BYTE
EXTRN p2point :BYTE
EXTRN preventingchar2 :BYTE
EXTRN preventingchar1 :BYTE
EXTRN winvalue :word
EXTRN startornot :BYTE


PUBLIC pro3
.MODEL SMALL
.386
.data
entername db "enter your name",'$' 
sendr db "you send game invitation",'$' 
sendc db "you send chat invitation",'$' 

invittxt db " invite you for game",'$' 
chatttxt db " invite you for chat",'$' 

  startsctext db "press any key to continue",'$' 
  enterpoint db "enter your point",'$'  
  texpoint1 db "p1 points: ",'$' 
  texpoint2 db "p2 points: ",'$'  
  regname3 dd "bx ",'$'
  valuefor_player1 db 0  ;;;;;for player 1 that intial the game in level 2 can chose winning value
 maintxt1 db "To start chatting press F1",'$' 
 maintxt2 db "To start the game press F2",'$' 
 maintxt3 db "To end the program press ESC",'$'
 prevtxt db "enter forbidden character: ",'$'
 leveltxt db "choose level: ",'$'
 wintxt db "choose winning value: ",'$'

 regvalues db  10,?,10 dup('$')
.CODE
pro3 PROC FAR
       mov ax,@data
	     mov ds,ax
       mov es,ax
       mov dh,endornot
       cmp dh,0
       jne mainscreenlop
       call startpage
       
       mov endornot,0
        mainscreenlop:
       call mainscreen
       
       
	   
	  
	   
	  
	  
        RET
pro3 ENDP

startpage proc near      ;for start page
               mov  ah,2             ;;;move curser
                mov  dl,1
                mov  dh,1
                mov  bh,0
                int  10h

               mov dx,offset entername ;;print text(enter player1 name)
               mov ah,9
               int 21h

               mov  ah,2             ;;;move curser
                mov  dl,2
                mov  dh,3
                mov  bh,0
                int  10h

               mov ah,10                  ;;;;;get player1 name
                mov dx,offset p1name
                int 21h
                

                mov  ah,2             ;;;move curser
                mov  dl,1
                mov  dh,5
                mov  bh,0
                int  10h


                 mov dx,offset enterpoint ;;;print text (enter player1 point)
               mov ah,9
               int 21h

               mov  ah,2             ;;;move curser
                mov  dl,2
                mov  dh,7
                mov  bh,0
                int  10h
                

               mov ah,10                  ;;;;;get player1 point
                mov dx,offset p1point
                int 21h

                mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,9
                mov  bh,0
                int  10h
                

                mov dx,offset startsctext ;;print text()
               mov ah,9
               int 21h
               

               mov ah,7;;;;;;;to take any key from user
               int 21h
          




                mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cx,00
               mov dx,184fh
               int 10h


               lea si ,p1point
         
         mov bl,[si+1]

          cmp bl,1
          jz lop1
          jmp lop2
          
          lop1:
         mov bl,[si+2]   ; read b number 
          sub bl,30h
          mov p1point,bl
        
          
          lop2:
          mov bl,[si+3]        
          sub bl,30h  
          mov al,[si+2]
          sub al,30h
          mov ah,0
          mov ch,10 
          mul ch
          add bl,al 
           mov p1point,bl

           

        

               
          

               
               
          final1:     
 ret
 startpage endp
 

startpage2 proc near      ;for start page
               mov  ah,2             ;;;move curser
                mov  dl,1
                mov  dh,1
                mov  bh,0
                int  10h

               mov dx,offset entername ;;print text(enter player1 name)
               mov ah,9
               int 21h

               mov  ah,2             ;;;move curser
                mov  dl,2
                mov  dh,3
                mov  bh,0
                int  10h

               mov ah,10                  ;;;;;get player1 name
                mov dx,offset p2name
                int 21h
                

                mov  ah,2             ;;;move curser
                mov  dl,1
                mov  dh,5
                mov  bh,0
                int  10h


                 mov dx,offset enterpoint ;;;print text (enter player1 point)
               mov ah,9
               int 21h

               mov  ah,2             ;;;move curser
                mov  dl,2
                mov  dh,7
                mov  bh,0
                int  10h
                

               mov ah,10                  ;;;;;get player1 point
                mov dx,offset p2point
                int 21h

                mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,9
                mov  bh,0
                int  10h
                

                mov dx,offset startsctext ;;print text()
               mov ah,9
               int 21h
               

               mov ah,7;;;;;;;to take any key from user
               int 21h
          




                mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cx,00
               mov dx,184fh
               int 10h


               lea si ,p2point
         
         mov bl,[si+1]

               cmp bl,1
          jz lop12
          jmp lop22
          
          lop12:
         mov bl,[si+2]   ; read b number 
          sub bl,30h
          mov p1point,bl
        
          
          lop22:
          mov bl,[si+3]        
          sub bl,30h  
          mov al,[si+2]
          sub al,30h
          mov ah,0
          mov ch,10 
          mul ch
          add bl,al 
           mov p2point,bl


           mov bh,p1point
           cmp bh,bl
           ja abvlop2
           mov p2point,bh
            jmp final12
            abvlop2:
            mov p1point,bl

        

               
          

               
               
          final12:     
 ret
 startpage2 endp
 
initialize_the_game proc near
   

                 call clearscreen   
                            ;;;move curser
                   mov  dl,3
                    mov  dh,1
                    mov ah,13h
                   mov bh,0
                    mov bl,5
                   mov bp,offset prevtxt
                   mov cx,26
                   int 10h

                mov  dl,2 ;;;;;mov curser
                mov  dh,4
                mov cx,"XA"
                mov regname3,ecx
                call print_reg3

                mov  dl,2 ;;;;;mov curser
                mov  dh,5
                mov cx,"XB"
                mov regname3,ecx
                call print_reg3

                mov  dl,2 ;;;;;mov curser
                mov  dh,6
                mov cx,"XC"
                mov regname3,ecx
                call print_reg3

                mov  dl,2 ;;;;;mov curser
                mov  dh,7
                mov cx,"XD"
                mov regname3,ecx
                call print_reg3

                mov  dl,2 ;;;;;mov curser
                mov  dh,8
                mov cx,"SI"
                mov regname3,ecx
                call print_reg3

                mov  dl,2 ;;;;;mov curser
                mov  dh,9
                mov cx,"DI"
                mov regname3,ecx
                call print_reg3

                mov  dl,2 ;;;;;mov curser
                mov  dh,10
                mov cx,"SP"
                mov regname3,ecx
                call print_reg3

                mov  dl,2 ;;;;;mov curser
                mov  dh,11
                mov cx,"BP"
                mov regname3,ecx
                call print_reg3
 ret
initialize_the_game endp

get_regvalue proc near 
   
                mov  ah,2             ;;;move curser
                mov  dl,32
                mov  dh,1
                mov  bh,0
                int  10h

                mov ah,7        ;;;;;get player2 forbidden character 
               int 21h
               mov preventingchar2,al
               mov ah,2         ;;;;;print the char
               mov dl,al
               int 21h

               mov ah,7        ;;;;;for enter
               int 21h



                mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,4
                mov  bh,0
                int  10h
                
                

                mov ah,10;;;;;;;;;get ax value
                mov dx,offset regvalues
                int 21h 
                mov cl,regvalues[1]
                cmp cl,4
                jb blop
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2al,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2ah,cl
                ;;;;;;;;;;;
                

                  blop:
                mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,5
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                mov cl,regvalues[1]
                cmp cl,4
                jb clop
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2bl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2bh,cl
                ;;;;;;;;;;;
                clop:

                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,6
                mov  bh,0
                int  10h

                

                 mov ah,10;;;;;;;;;get cx value
                mov dx,offset regvalues
                int 21h 
                mov cl,regvalues[1]
                cmp cl,4
                jb dlop
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2cl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2ch,cl
                ;;;;;;;;;;;
                 dlop:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,7
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get dx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb silop
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2dl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2dh,cl
                ;;;;;;;;;;;
                silop:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,8
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb dilop
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2sil,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2sih,cl
                ;;;;;;;;;;;
                dilop:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,9
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb splop
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2dil,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2dih,cl
                ;;;;;;;;;;;
                   splop:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,10
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb bplop
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2spl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2sph,cl
                ;;;;;;;;;;;
                bplop:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,11
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb outlop
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2bpl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p2bph,cl
                ;;;;;;;;;;;

                outlop:

 
 ret
get_regvalue endp

get_regvalue2 proc near 
   
                mov  ah,2             ;;;move curser
                mov  dl,32
                mov  dh,1
                mov  bh,0
                int  10h

                mov ah,7        ;;;;;get player2 forbidden character 
               int 21h
               mov preventingchar1,al
               mov ah,2        ;;;;;;;;to print char
               mov dl,al
               int 21h

                mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,4
                mov  bh,0
                int  10h

                mov ah,7        ;;;;;for enter
               int 21h
                
                

                mov ah,10;;;;;;;;;get ax value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb blop2
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3al,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3ah,cl
                ;;;;;;;;;;;
                blop2:

                mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,5
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb clop2
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3bl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3bh,cl
                ;;;;;;;;;;;
                  clop2:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,6
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb dlop2
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3cl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3ch,cl
                ;;;;;;;;;;;
                dlop2:

                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,7
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb silop2
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3dl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3dh,cl
                ;;;;;;;;;;;
                silop2:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,8
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb dilop2
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3sil,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3sih,cl
                ;;;;;;;;;;;
                dilop2:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,9
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb splop2
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3dil,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3dih,cl
                ;;;;;;;;;;;
                 splop2:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,10
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb bplop2
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3spl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3sph,cl
                ;;;;;;;;;;;
                bplop2:
                 mov ah,2       ;;;;move curser
                 mov  dl,5
                mov  dh,11
                mov  bh,0
                int  10h

                 mov ah,10;;;;;;;;;get bx value
                mov dx,offset regvalues
                int 21h 
                 mov cl,regvalues[1]
                cmp cl,4
                jb outlop2
                lea bx,regvalues
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3bpl,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov p3bph,cl
                ;;;;;;;;;;;
                outlop2:
               mov valuefor_player1,0
                




 
 ret
get_regvalue2 endp

mainscreen proc near
   
               l:
                 
               call clearscreen
               

                 mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,4
                mov  bh,0
                int  10h
               mov dx,offset maintxt1 ;;print text(enter player1 name)
               mov ah,9
               int 21h

               mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,6
                mov  bh,0
                int  10h
               mov dx,offset maintxt2 ;;print text(enter player1 name)
               mov ah,9
               int 21h
               

               mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,8
                mov  bh,0
                int  10h
               mov dx,offset maintxt3 ;;print text(enter player1 name)
               mov ah,9
               int 21h
               
               

               main4:
                 mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz recivelop
			             
               
              mov ah, 1   ; peek
               int 16h
                jz   continue
                mov ah, 0   ; get
               int 16h
              cmp ah,59 ;f1
              je main1
              cmp ah,60 ;;scan code f2
              je main2
              cmp ah,1 
              je main3
              continue:
              jmp main4

              main1:
              call sendchatinvitaition
              call prtch
                 	mov dx , 3FDH
          	CHK204:	                ;; check wire is or not  empty   if empty wait
    	        in al , dx                  ;;;change
      	     	test al , 1
      	     JZ CHK204 
             call reciveresponschat
            ; cmp bl,44
             ;jne main4
             call ct
             call clearscreen

             
             jmp l


            
              
              main2:
              call sendgameinvitaition
              call prtg

             	mov dx , 3FDH
          	CHK24:	                ;; check wire is or not  empty   if empty wait
    	        in al , dx                  ;;;change
      	     	test al , 1
      	     JZ CHK24 
             call reciverespons

             cmp bl,0
             je main4
            
             ;call choose_the_level
             ;call sendlevel
                 mov startornot,1

              jmp ending
              lo62:
              mov p2point,al

              ;mov cl,level
              ;cmp cl,50
              l9:
              ;je level2lop
              ;call forlevel1  ;;get p2forbiden char
            ;  call forlevel1p2  ;;;;;;;;get p2forcidin char  
              jmp ending

              level2lop:
               call initialize_the_game
               call get_regvalue
               call initialize_the_game
               call get_regvalue2
               jmp ending
            
              

              main3:
              call clearscreen
              mov ax,4c00h    ;;;exit
              int 21h
             

             recivelop:
             call doreceive
             s:
               mov ah, 1   ; peek
               int 16h
                jz  s
                mov ah, 0   ; get
               int 16h
               cmp ah,59
               je l2p
               cmp ah,60
               jne s
                
               call sendacceptedyed
               mov startornot,0


                                
             



         ending:
            call clearscreen
               
              
 ret
 l2p:
 call sendacceptedyedchat
 call ct
 call clearscreen
 jmp l
 ret
mainscreen endp


choose_the_level proc near
 
               call clearscreen
               mov  ah,2             ;;;move curser
                mov  dl,4
                mov  dh,4
                mov  bh,0
                int  10h

               mov dx,offset leveltxt ;;print text(enter player1 name)
               mov ah,9
               int 21h
                mov  ah,2             ;;;move curser
                mov  dl,6
                mov  dh,6
                mov  bh,0
                int  10h

                mov ah,7        ;;;;;get player2 forbidden character 
               int 21h
               mov level,al
               mov ah,2
               mov dl,al
               int 21h

               mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,10
                mov  bh,0
                int  10h

               mov dx,offset startsctext ;;print text(press any key to continue)
               mov ah,9
               int 21h

               mov ah,7        ;;;;;to wait until press 
               int 21h

 
 ret
choose_the_level endp

doreceive proc near
               call reciveing
               cmp bl,44
               je chatfuckup
                 mov  cx,0
                mov  dx,180
                mov  al,5
                mov  ah,0ch
				    			   
               hline:    ;herzontal line    
                int  10h
                inc  cx
                cmp  cx,320
                jne  hline

                  mov  ah,2             ;;;move curser
                mov  dl,1
                mov  dh,23
                mov  bh,0
                int  10h
                   

                 
                  mov ah,9                  ;;;;;get player1 point
                mov dx,offset p2name+2
                int 21h
                mov  ah,2             ;;;move curser
                mov  dl,6
                mov  dh,23
                mov  bh,0
                int  10h
               mov ah,9                  ;;;;;get player1 point
                mov dx,offset invittxt
                int 21h
                 h:
                 mov ah, 1   ; peek
               int 16h
                jz  h
                mov ah, 0   ; get
               int 16h
               cmp ah,64
               jmp ext
               cmp ah,60
               jne h
               
               call sendacceptedyed
                
 mov al,p1point
 mov ah,p2point
 cmp al,ah
 jae lo2
 mov p1point,ah
 ret
 lo2:
 mov p2point,al
 ret
 chatfuckup:
    mov  cx,0
                mov  dx,180
                mov  al,5
                mov  ah,0ch
				    			   
               hlineh:    ;herzontal line    
                int  10h
                inc  cx
                cmp  cx,320
                jne  hlineh

                  mov  ah,2             ;;;move curser
                mov  dl,1
                mov  dh,23
                mov  bh,0
                int  10h
                   

                 
                  mov ah,9                  ;;;;;get player1 point
                mov dx,offset p2name+2
                int 21h
                mov  ah,2             ;;;move curser
                mov  dl,6
                mov  dh,23
                mov  bh,0
                int  10h
               mov ah,9                  ;;;;;get player1 point
                mov dx,offset chatttxt
                int 21h
                 h19:
                 mov ah, 1   ; peek
               int 16h
                jz  h19
                mov ah, 0   ; get
               int 16h
               cmp ah,64
               jmp ext
               cmp ah,59
               jne h19
               
               call sendacceptedyedchat

 ext:
 ret
doreceive endp
prtch proc near
   mov  cx,0
                mov  dx,180
                mov  al,5
                mov  ah,0ch
				    			   
               hlinehw:    ;herzontal line    
                int  10h
                inc  cx
                cmp  cx,320
                jne  hlinehw

                  mov  ah,2             ;;;move curser
                mov  dl,1
                mov  dh,23
                mov  bh,0
                int  10h
                   

                 
                  mov ah,9                  ;;;;;get player1 point
                mov dx,offset sendc
                int 21h
 
 ret
prtch endp
prtg proc near
   mov  cx,0
                mov  dx,180
                mov  al,5
                mov  ah,0ch
               hlineht:    ;herzontal line    
                int  10h
                inc  cx
                cmp  cx,320
                jne  hlineht

                  mov  ah,2             ;;;move curser
                mov  dl,1
                mov  dh,23
                mov  bh,0
                int  10h
                   

                 
                  mov ah,9                  ;;;;;get player1 point
                mov dx,offset sendr
                int 21h
 
 ret
prtg endp
forlevel1 proc near

                  call clearscreen
                    mov  dl,3
                    mov  dh,2
                    mov ah,13h
                   mov bh,0
                    mov bl,5
                   mov bp,offset prevtxt
                   mov cx,26
                   int 10h

                   mov  ah,2             ;;;move curser
                mov  dl,30
                mov  dh,2
                mov  bh,0
                int  10h

                mov ah,7        ;;;;;get player2 forbidden character 
               int 21h
               mov preventingchar2,al
               mov ah,2
               mov dl,al
               int 21h

               mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,10
                mov  bh,0
                int  10h


                mov dx,offset startsctext ;;print text(press any key to continue)
               mov ah,9
               int 21h

               mov ah,7        ;;;;;to wait until press 
               int 21h

 ret
forlevel1 endp

forlevel1p2 proc near

                  call clearscreen
                    mov  dl,3
                    mov  dh,2
                    mov ah,13h
                   mov bh,0
                    mov bl,5
                   mov bp,offset prevtxt
                   mov cx,26
                   int 10h

                   mov  ah,2             ;;;move curser
                mov  dl,30
                mov  dh,2
                mov  bh,0
                int  10h

                mov ah,7        ;;;;;get player2 forbidden character 
               int 21h
               mov preventingchar1,al
               mov ah,2
               mov dl,al
               int 21h

               mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,10
                mov  bh,0
                int  10h


                mov dx,offset startsctext ;;print text(press any key to continue)
               mov ah,9
               int 21h

               mov ah,7        ;;;;;to wait until press 
               int 21h

 ret
forlevel1p2 endp


clearscreen proc near ;clear screen

              mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cx,00
               mov dx,184fh
               int 10h
 ret 
clearscreen endp

print_reg3 proc near 


mov ah,13h
 mov bh,0
 mov bl,5
 mov bp,offset regname3
mov cx,3
int 10h
ret
print_reg3 endp

sendgameinvitaition proc near 
 
  
       mov dx , 3FDH		; Line Status Register
        AGAIN57:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN57                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,p1point
  		out dx , al
		 

      lea si,p1name
      
    SERIAL_SEND_STRING2572:
        mov dx , 3FDH		; Line Status Register
        AGAIN56:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN56                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		INC SI
  		out dx , al
		   mov cl,'$'
      cmp cl,al
    JNZ SERIAL_SEND_STRING2572
  
      
    
 
 ret

sendgameinvitaition endp

sendchatinvitaition proc near

 mov dx , 3FDH		; Line Status Register
        AGAIN5790:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN5790                              ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,'s'
  		out dx , al
		 

  lea si,p1name
      
    SERIAL_SEND_STRING257k2:
        mov dx , 3FDH		; Line Status Register
        AGAIN56k:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN56k                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		INC SI
  		out dx , al
		   mov cl,'$'
      cmp cl,al
    JNZ SERIAL_SEND_STRING257k2
  
      
    
 
 ret

sendchatinvitaition endp
reciveing proc near
    
      mov dx , 3FDH
    	CHK:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK                                    ;Not Ready
                       ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		cmp al,'e'
    ;je esclop
    	cmp al,'a'
    je acptlop
    cmp al,'s'
    je chatlop
    mov p2point,al
    LEA SI,p2name
  	DEC SI
	  SERIAL_RECEIVE_STRING:;;;;;;to receive value
    	INC SI
    	mov dx , 3FDH
    	CHK2:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK2                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
  		
  		mov cl,'$'
    CMP al,cl
    JNZ SERIAL_RECEIVE_STRING
    mov dl,'$'
    MOV [SI],dl
  	; DISPLAY STRING
    
   
    mov bl,0
    ret
    esclop:


    chatlop:
     mov p2point,al
    LEA SI,p2name
  	DEC SI
	  SERIAL_RECEIVE_STRING3:;;;;;;to receive value
    	INC SI
    	mov dx , 3FDH
    	CHK23o:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK23o                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
  		
  		mov cl,'$'
    CMP al,cl
    JNZ SERIAL_RECEIVE_STRING3
    mov dl,'$'
    MOV [SI],dl
    mov bl,44

     ret
    acptlop:
    mov bl,5
    ret


    rcexit:
    mov bl,1
	ret
 reciveing endp
 reciverespons proc near
    
      mov dx , 3FDH
    	CHK8:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK8                                    ;Not Ready
                       ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		cmp al,'f'
      je reflop
    ;je esclop
    	mov p2point,al
   ; je chatlop
  
    LEA SI,p2name+2
  	DEC SI
	  SERIAL_RECEIVE_STRING9:;;;;;;to receive value
    	INC SI
    	mov dx , 3FDH
    	CHK29:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK29                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
  		
  		mov cl,'$'
    CMP al,cl
    JNZ SERIAL_RECEIVE_STRING9
    mov dl,'$'
    MOV [SI],dl
  	; DISPLAY STRING
    
   
    mov bl,2
    ret
    reflop:
    mov bl,0
    
    


    rcexit2:
    mov bl,1
	ret
 reciverespons endp

 sendacceptedyed proc near 
        mov dx , 3FDH
       
   AGAIN58:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN58                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,p1point
  		out dx , al
      lea si,p1name+2
      
    SERIAL_SEND_STRING2582:
        mov dx , 3FDH		; Line Status Register
        AGAIN546:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN546                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		INC SI
  		out dx , al
		   mov cl,'$'
      cmp cl,al
    JNZ SERIAL_SEND_STRING2582
  
 
 ret
 sendacceptedyed endp
 sendrefuse proc near 
        mov dx , 3FDH
     
   AGAIN7:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN7                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,'f'
  		out dx , al
 
 ret
 sendrefuse endp
 sendlevel proc near 
        mov dx , 3FDH
   AGAIN73:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN73                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,level
  		out dx , al
 
 ret
 sendlevel endp
 recivelevel proc near
    
      mov dx , 3FDH
    	CHK81:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK81                                    ;Not Ready
                       ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov level,al
      
	ret
 recivelevel endp

  
sednforbchar proc near
        mov dx , 3FDH
     
 AGAIN735:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN735                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,preventingchar1
  		out dx , al
  
 
 ret
sednforbchar endp

 sendacceptedyedchat proc near 
        mov dx , 3FDH
       
   AGAIN580:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN580                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,'a'
  		out dx , al
      lea si,p1name+2
      
    SERIAL_SEND_STRING2582p:
        mov dx , 3FDH		; Line Status Register
        AGAIN546p:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN546p                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		INC SI
  		out dx , al
		   mov cl,'$'
      cmp cl,al
    JNZ SERIAL_SEND_STRING2582p
  
 
 ret
 sendacceptedyedchat endp

 reciveresponschat proc near
    
      mov dx , 3FDH
    	CHK8q:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK8                                    ;Not Ready
                       ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		;cmp al,'a'
      ;'je reflop
    ;je esclop
    	;mov p2point,al
   ; je chatlop
  
    LEA SI,p2name+2
  	DEC SI
	  SERIAL_RECEIVE_STRING9q:;;;;;;to receive value
    	INC SI
    	mov dx , 3FDH
    	CHK29q:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK29q                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
  		
  		mov cl,'$'
    CMP al,cl
    JNZ SERIAL_RECEIVE_STRING9q
    mov dl,'$'
    MOV [SI],dl
  	; DISPLAY STRING
    
   
   
	ret
 reciveresponschat endp

end pro3