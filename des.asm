
 EXTRN pro3:FAR
 EXTRN pro4:FAR
 EXTRN pro1:FAR
 EXTRN pro2:FAR
 EXTRN pro5:FAR
 EXTRN pro6:FAR
 PUBLIC p1ax, p1bx, p1cx,p1dx,p1si,p1di,p1sp,p1bp,p1ah, p1al, p1bh, p1bl,p1ch, p1cl, p1dh, p1dl,p1sil,p1sih,p1dih,p1dil,p1sph,p1spl,p1bpl,p1bph,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p1a,p1b,p1c,p1d,p1e,p1f,command1,p1stacksize,p1stackindex,p1stack
 PUBLIC p2ax, p2bx, p2cx,p2dx,p2si,p2di,p2sp,p2bp,p2ah, p2al, p2bh, p2bl,p2ch, p2cl, p2dh, p2dl,p2sil,p2sih,p2dih,p2dil,p2sph,p2spl,p2bpl,p2bph,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p2a,p2b,p2c,p2d,p2e,p2f,command2,p2stacksize,p2stackindex,p2stack
 PUBLIC p3ax, p3bx, p3cx,p3dx,p3si,p3di,p3sp,p3bp,p3ah, p3al, p3bh, p3bl,p3ch, p3cl, p3dh, p3dl,p3sil,p3sih,p3dih,p3dil,p3sph,p3spl,p3bpl,p3bph,p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p3a,p3b,p3c,p3d,p3e,p3f,p3stacksize,p3stackindex,p3stack
 PUBLIC p1name,p1point,p2name,p2point,comand1,s,preventingchar1,preventingchar2,p1carry,p2carry,p3carry,level,pgpoint,endornot,winvalue,startornot
.MODEL SMALL
.386
.STACK 100H
.DATA
  
  ;;;;ram1
  p10 db 0
 p11 db ?
   p12 db 00
   p13 db 00
   p14 db 00
   p15 db 00
   p16 db ?
   p17 db ?
   p18 db ?
   p19 db ?
   p1a db ?
   p1b db ?
   p1c db ?
   p1d db ?
   p1e db ?
   p1f db ?
  ;;;ram2
   p20 db 0
   p21 db 06h
   p22 db ?
   p23 db ?
   p24 db ?
   p25 db ?
   p26 db ?
   p27 db ?
   p28 db ?
   p29 db ?
   p2a db ?
   p2b db 05h
   p2c db 0ch
   p2d db 0dh
   p2e db 8h
   p2f db 00
  ;;;
  
  p30 db 0
   p31 db 06h
   p32 db ?
   p33 db ?
   p34 db ?
   p35 db ?
   p36 db ?
   p37 db ?
   p38 db ?
   p39 db ?
   p3a db ?
   p3b db 05h
   p3c db 0ch
   p3d db 0dh
   p3e db 8h
   p3f db 00

  ;;;
         p1ax Label Word
  p1al   Db   34h
  p1ah   db   12h
         p1bx Label Word
  p1bl   Db   78h
  p1bh   db   56h
         p1cx Label Word
  p1cl   Db   0h
  p1ch   db   00h
         p1dx Label Word
  p1dl   Db   0h
  p1dh   db   0h

  p1di Label Word
  p1dil   Db   0h
  p1dih   db   0h

  p1sp Label Word
  p1spl   Db   0h
  p1sph   db   0h

  p1bp Label Word
  p1bpl   Db   0h
  p1bph   db   0h

  p1si Label Word
  p1sil   Db   0h
  p1sih   db   0h


  p3ax Label Word
  p3al   Db   55h
  p3ah   db   66h
         p3bx Label Word
  p3bl   Db   78h
  p3bh   db   56h
         p3cx Label Word
  p3cl   Db   0h
  p3ch   db   00h
         p3dx Label Word
  p3dl   Db   0h
  p3dh   db   0h

  p3di Label Word
  p3dil   Db   0h
  p3dih   db   0h

  p3sp Label Word
  p3spl   Db   0h
  p3sph   db   0h

  p3bp Label Word
  p3bpl   Db   0h
  p3bph   db   0h

  p3si Label Word
  p3sil   Db   0h
  p3sih   db   0h

  p1stackindex dw 9
  p1stacksize db 10
  p1stack db  30,?,30 dup('$')

  p2stackindex dw 9
  p2stacksize db 10
  p2stack db  30,?,30 dup('$')

  p3stackindex dw 9
  p3stacksize db 10
  p3stack db  30,?,30 dup('$')
           
           

         p2ax Label Word
  p2al   Db   5h
  p2ah   db   0h

  
         p2bx Label Word
  p2bl   Db   0h
  p2bh   db   0h
         p2cx Label Word
  p2cl   Db   0h
  p2ch   db   00h
         p2dx Label Word
  p2dl   Db   0h
  p2dh   db   0h


  p2di Label Word
  p2dil   Db   0h
  p2dih   db   0h

  p2sp Label Word
  p2spl   Db   0h
  p2sph   db   0h

  p2bp Label Word
  p2bpl   Db   0h
  p2bph   db   0h

  p2si Label Word
  p2sil   Db   0h
  p2sih   db   0h
  rc db 0
   winvalueenter db   10,?,10 dup('$')
   comand1 db   30,?,30 dup('$')
  comand2 db   30,?,30 dup('$')
  p1name db    30,?,30 dup('$')
  p1point db    30,?,30 dup('$')
  s db    30,?,30 dup('$')
  p2point db    30,?,30 dup('$')
  pgpoint db ?
  powerstring db    30,?,30 dup('$')
  powerstring2 db    30,?,30 dup('$')
  p2name db    30,?,30 dup('$')
  command2 db   30,?,30 dup('$')
  command1 db   30,?,30 dup('$')
  preventingchar1 db '5','$'
  prevdone1 db 0
  cleardone1 db 0
   preventingchar2 db '7','$'
   prevdone2 db 0
  cleardone2 db 0
  changewinningkeydone1 db 0
  changewinningkeydone2 db 0
   regname dd   "bx ",'$'
  regname3 dd "bx ",'$'
   
   
  lpart  db   ?
  ramcounter db 0
  ramccouner db 48
  rampos db 0
  leveltxt db "choose level: ",'$'
  ;startsctext db "press any key to continue",'$'
  entername db "enter your name",'$' 
 regvalues db  10,?,10 dup('$')

  startsctext db "press any key to continue",'$' 
  enterpoint db "enter your point",'$'  
  texpoint1 db "p1 points: ",'$' 
  texpoint2 db "p2 points: ",'$'  
  trycmand db "inc ax$",'$'
 prevtxt db "enter forbidden character: ",'$'
 wat db "wait for player 2 ",'$'
 culmcount1 db 0
 culmcount2 db 0


 maintxt1 db "To start chatting press F1",'$' 
 maintxt2 db "To start the game press F2",'$' 
 maintxt3 db "To end the program press ESC",'$'
 carrytxt db "c: "
 forbiddentxt db "FOR:",'$'
 winname db "the win player :",'$'
 level2comand db 30,?,30 dup('$')
 wtxt db "WV:",'$'
 adress dw ?
 countwin db 0
 procnumper db 0
 pwin db ? ; player win
 countchat db 0
 chat db 30,?,30 dup('$')
 chat2 db 30,?,30 dup('$')
 buf db 0
 p1carry db 00h
 p2carry db 00h
 p3carry db 00h
  level db  '2'
  winvalue dw 10eh
  countstring db 0
  anotherwinvalue dw 10eh ;;use when change winning value
  endornot dw 0
  startornot db 0


.CODE

MAIN PROC far
    
                MOV  AX, @DATA
                MOV  DS, AX
                mov es,ax
  
                call SERIAL_INIT 
                call SETUP
         
                

                mov  ah, 0    ;change to video mode 
                mov  al, 13h
                int  10h

                  
                 mailop: 
                call setreg_tozero_p2
                call setreg_tozero_p1
                call setram_tozero_p1
                call setram_tozero_p2
                call pro3
                mov al,p1point
 mov ah,p2point
 cmp al,ah
 jbe lo2
 mov p1point,ah
 jmp m
 lo2:
 mov p2point,al
                m:
                 mov al, startornot
                 cmp al,1
                 je l5
                 call drew
                 	CHK264:	                ;; check wire is or not  empty   if empty wait
    	        in al , dx                  ;;;change
      	     	test al , 1
      	     JZ CHK264 
             call recivelevel
              mov al,level
              cmp al,'2'
              je lv2
              call forlevel1
              call sednforbchar
              mov al,rc
              cmp rc,1
              je k
               mov dx , 3FDH

             	CHK274:	                ;; check wire is or not  empty   if empty wait
    	        in al , dx                  ;;;change
      	     	test al , 1
      	     JZ CHK274 
                call recivefrob
                jmp k
                

                 l5:
                  call choose_the_level
                   call sendlevel  
                   cmp al,'2'
                     je lv2 
                  call forlevel1
              call sednforbchar
                  mov al,rc
                  cmp al,1
                  je k
             mov dx , 3FDH

                   	CHK824:	
    	            mov dx , 3FDH
                                     ;; check wire is or not  empty   if empty wait
    	       in al , dx                  ;;;change
      	     	test al , 1
      	     JZ CHK824 
                  call recivefrob
                  jmp k

                  lv2:
                  call initialize_the_game
                  call get_regvalue
    	            mov dx , 3FDH
         
                    in al , dx                  ;;;change
      	     	     test al , 1
      	           JnZ rvlop      ;;;;sended if not empty send
                   call sendrg

                   	CHKl4:	 
    	              mov dx , 3FDH
                                    ;; check wire is or not  empty   if empty wait
    	            in al , dx                  ;;;change
      	     	    test al , 1
      	           JZ CHKl4 
                   call recivinfo


                  call sendinfo
                  jmp k
                   rvlop:
                   call reciveredy
                   call sendinfo
                    

                   call recivinfo

                   
                     

                

                 k:
                 mov rc,0
                mov pwin,0
                 
                call drew
                 maingamelop:
                 mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz recivelop
			             
                   
                call check_win
                cmp dl,0
                je nowin1
                call endgame
                mov bx,5
                delay:              ;;;;;delay 5 sec
                dec bx
                mov cx,0fh
                mov dx,4240h
                mov ah,86h
                int 15h
                cmp bx,0
                jne delay
                mov endornot,1
                 jmp mailop
                nowin1:
                   mov ah, 1   ; peek
               int 16h
                    jz   continue
               
                mov ah, 0   ; get
               int 16h
                mov buf,al
                 
                 call chekgame
                cmp dl,100
                jne turn
                call sendfly
                call pro2
                
                call drew
                turn:

                mov al,buf
                cmp al,'c'
                je portcomandlop
                cmp al,'p'
                je portpowerlop
                cmp al,'m'
                je mlop
              
               continue:
               jmp maingamelop

               recivelop:                            
            call doreceive
               jmp maingamelop

                incl:
                mov ah,6
                mov al,1
                mov bh,0
                mov cl,1
                mov dl,19
                mov ch,19
                mov dh,24
                int 10h
                dec culmcount1

               mlop:
               mov al,culmcount1
               cmp al,5
               je incl
               mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz rec
                 MOV AH,2
                 mov  dl,1
                mov  dh,19
                mov  bh,0
                add dh,culmcount1
                add dl,countchat
                int  10h

                mov ah, 1   ; peek
                int 16h
               jz   mlop
                mov ah, 0   ; get
                  int 16h
	 
	              
                lea si,chat
	             mov bl,countchat
	              mov bh,0
	             add si,bx
              
	             mov dl,13
	             cmp al,dl
	            je endwriting2
	            mov [si],al
	            mov ah,2
	           mov dl,al
	           int 21h
	           inc countchat
               jmp mlop

               endwriting2:
               mov dl,'$'	
               mov [si],dl
               mov [di],dl
               mov countchat,0
               inc culmcount1
               call sendchat
               jmp maingamelop

               
                  rec:
                  call doreceive
                  jmp mlop

                portcomandlop:
                mov al,level
                cmp al,'2'
                je level2comandlop
                 mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz recivelopcomand

                     
                call getcommand1
                  cmp bl,0
                  je portcomandlop
                  call fors
                  call change_to_p31
                  mov al,p1point
                 mov pgpoint,al
                    call pro1
                    call pro4
                    call pro5
                    call pro6
                  call change_to_p13
                  mov al,pgpoint
                mov p1point,al
                  call drew
                  lea si,  command1
               call change
               lea si,  s
               call change
                   jmp maingamelop


                    recivelopcomand:                            
                   call doreceive
               jmp portcomandlop




                 
                 level2comandlop:
                 l2l:
                 mov dx , 3FDH   
	               in al , dx 
      		       test al , 1  
                 jnz l2lrecive
                  mov ah, 1   ; peek
                   int 16h
                   jz   l2l
                    mov ah, 0   ; get
                   int 16h
                   mov procnumper,al
                   l3l:
                  mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz recivelopcomand2   
                call getcommand1
                  cmp bl,0
                  je l3l
                    call fors
                    mov al,procnumper
                    cmp al,'1'
                     je proc2   
                  call change_to_p31
                  mov al,p1point
                 mov pgpoint,al
                    call pro1
                    call pro4
                    call pro5
                    call pro6
                  call change_to_p13
                  mov al,pgpoint
                mov p1point,al
                  call drew
                  lea si,  command1
               call change
               lea si,  s
               call change
                   jmp maingamelop
                   proc2:
                   call change_to_p21
                  mov al,p1point
                 mov pgpoint,al
                    call pro1
                    call pro4
                    call pro5
                    call pro6
                  call change_to_p12
                  mov al,pgpoint
                mov p1point,al
                  call drew
                  lea si,  command1
               call change
               lea si,  s
               call change
                   jmp maingamelop
                    
                    
                    l2lrecive:
                    call doreceive
               jmp l2l





                   recivelopcomand2:                            
                   call doreceive
               jmp l3l


             portpowerlop:
             mov ah, 1   ; peek
               int 16h
                jz   pskip
                mov ah, 0   ; get
               int 16h
                cmp al,'1'
                je power11
                cmp al,'2'
                je power12
                cmp al,'3'
                je power13
                cmp al,'4'
                je power14
                cmp al,'5'
                je power15
                jmp maingamelop
                
                 pskip:
                  mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz receivepower
                jmp portpowerlop

                power11:
                cmp p1point,8
               jb maingamelop
               cmp prevdone1,1
               je maingamelop
               s1:
                mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz receivepower1
               mov ah, 1   ; peek
               int 16h
                jz  s1
                mov ah, 0   ; get
               int 16h
               mov preventingchar2,al
               mov powerstring[0],'p'
                mov powerstring[1],'1'
                 mov powerstring[2],al
                sub p1point,8
                mov prevdone1,1
                call printpoint
                call printforbidden2
                call printforbidden1
                call sendpower
                jmp maingamelop

                
                   power12:
                cmp p1point,30
               jb maingamelop
               cmp cleardone1,1
               je maingamelop
               
                mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz receivepower2
                 call setreg_tozero_p1
                 call setreg_tozero_p2

               mov powerstring[0],'p'
                mov powerstring[1],'2'
                 mov powerstring[2],al
                sub p1point,30
                mov cleardone1,1
                call printpoint
                call print_p1reg
                call print_p2reg
               
                call sendpower
                jmp maingamelop


                 power13:
                cmp p1point,5
               jb maingamelop
                s3:
               mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz receivepower3
                     
                call getcommand1
                  cmp bl,0
                  je s3
                  call fors
                  call change_to_p21
                  mov al,p1point
                 mov pgpoint,al
                    call pro1
                    call pro4
                    call pro5
                    call pro6
                  call change_to_p12
                  mov al,pgpoint
                mov p1point,al
                  call drew

               mov powerstring[0],'p'
                mov powerstring[1],'3'
                
                sub p1point,5
        
                call drew
                call sendpowercommand
                jmp maingamelop


                      power14:
                cmp p1point,3
               jb maingamelop
                s4:
               mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz receivepower4
                     
                call getcommand1
                  cmp bl,0
                  je s4
                  call fors
                  call change_to_p21
                  mov al,p1point
                 mov pgpoint,al
                    call pro1
                    call pro4
                    call pro5
                    call pro6
                  call change_to_p12
                  mov al,pgpoint
                  call change_to_p31
                  mov al,p1point
                 mov pgpoint,al
                    call pro1
                    call pro4
                    call pro5
                    call pro6
                  call change_to_p13
                  mov al,pgpoint
                mov p1point,al
                  call drew

               mov powerstring[0],'p'
                mov powerstring[1],'4'
                
                sub p1point,3
                call drew
                call sendpowercommand
                jmp maingamelop


                 power15:
                cmp p1point,12
               jb maingamelop
               cmp changewinningkeydone1,1
               je maingamelop
               s5:
                mov dx , 3FDH   
	               in al , dx 
      		       test al , 1            ;;if empty
      	         jnz receivepower5
               mov ah, 1   ; peek
               int 16h
                jz  s5
                mov ah, 0   ; get
               int 16h
               lea si,winvalueenter
               mov cl,countwin
               mov ch,0
               add si,cx
               mov [si],al

               
               inc countwin
               cmp cl,4
               je chckkey

                jmp s5
               chckkey:
               call getwinkey
               call checkforwinningkey
                cmp bl,0
               jne maingamelop
               sub p1point,12
               mov ax,anotherwinvalue
               mov winvalue,ax
              
               call drew
               mov changewinningkeydone1,1
               mov powerstring[0],'p'
               mov powerstring[1],'5'
               call sendpowerchangwinvalue
               mov countwin,0
               jmp maingamelop



                receivepower:
                call doreceive
                jmp portpowerlop

                receivepower1:
                call doreceive
                jmp s1

                receivepower2:
                call doreceive
                jmp portpowerlop

                receivepower3:
                call doreceive
                jmp s3

                 receivepower4:
                call doreceive
                jmp s4
                receivepower5:
                call doreceive
                jmp s5
                
                  
            

                
                 
  final:        
              
               ;hlt
                ret

MAIN ENDP


getwinkey proc near
 
  mov ah,2       ;;;;move curser
                 
                
                lea bx,winvalueenter
                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov ch,cl

                mov cl,[bx+1]
                sub cl,30h
                mov ah,0
                mov al,[bx]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov dl,ch
                mov dh,cl
                mov anotherwinvalue,dx

 ret
getwinkey endp

doreceive proc near

               
            call reciveing
                cmp bl,1
                je part2
                 cmp bl,87
                je flop
                cmp bl,2
                je lev2comd
                cmp bl,3
                je prntchat
                 call fors
            call change_to_p21
            mov al,p2point
                 mov pgpoint,al
             call pro1
             call pro4
             call pro5
             call pro6
             call change_to_p12
             mov al,pgpoint
                mov p2point,al
             call drew
             lea si,  command1
              
               call change
               lea si,  s
               call change
                jmp endreceive
               part2:
               mov  al,powerstring2[0]
               cmp al,'1'
               je p1plop
               cmp al,'2'
               je p1plop2
               cmp al,'3'
               je p1plop3
               cmp al,'4'
               je p1plop4
               cmp al,'5'
               je p1plop5
               jmp endreceive
                 
               p1plop:
               cmp p2point,8
               jb endreceive
               cmp prevdone2,1
               je endreceive
               mov al,powerstring2[1]
               sub p2point,8
               mov preventingchar1,al
                mov prevdone2,1
                call printpoint
                call printforbidden2
                call printforbidden1
                jmp endreceive

                p1plop2:
               cmp p2point,3
               jb endreceive
               cmp cleardone2,1
               je endreceive
              call setreg_tozero_p1
                 call setreg_tozero_p2
               sub p2point,30
               
                mov cleardone2,1
                call printpoint
                call print_p1reg
                call print_p2reg
                jmp endreceive



                 p1plop3:
               
                 call fors
            call change_to_p31
            mov al,p2point
                 mov pgpoint,al
             call pro1
             call pro4
             call pro5
             call pro6
             call change_to_p13
             mov al,pgpoint
                mov p2point,al
                sub p2point,5
             call drew
             lea si,  command1
               call change
               lea si,  s
               call change
                jmp endreceive
                 

                  p1plop4:

                
                cmp p1point,5
               jb maingamelop
                 call fors
            call change_to_p31
            mov al,p2point
                 mov pgpoint,al
             call pro1
             call pro4
             call pro5
             call pro6
             call change_to_p13
             mov al,pgpoint
                mov p2point,al

                call change_to_p21
            mov al,p2point
                 mov pgpoint,al
             call pro1
             call pro4
             call pro5
             call pro6
             call change_to_p12
             mov al,pgpoint
                mov p2point,al
                 sub p2point,3
             call drew
             lea si,  command1
               call change
               lea si,  s
               call change

                jmp endreceive
                 
                 p1plop5:

                 cmp p2point,12
                 jb maingamelop
                cmp changewinningkeydone1,1
                je endreceive
                call getwinkey
               call checkforwinningkey
                cmp bl,0
               
               jne endreceive
               mov ax,anotherwinvalue
               mov winvalue,ax
               sub p1point,12
               
               call drew
               jmp endreceive

               
               lev2comd:
               call fors
            call change_to_p31
            mov al,p2point
                 mov pgpoint,al
             call pro1
             call pro4
             call pro5
             call pro6
             call change_to_p13
             mov al,pgpoint
                mov p2point,al
             call drew
             lea si,  command1
              
               call change
               lea si,  s
               call change
                jmp endreceive

                prntchat:
                mov al,culmcount2
                cmp al,5
                je ct
                 mov  ah,2             ;;;move curser
                mov  dl,21
                mov  dh,19
                mov  bh,0
                add dh,culmcount2
                int  10h
               mov dx,offset chat2 ;;print text(enter player1 name)
               mov ah,9
               int 21h
               inc culmcount2
               jmp endreceive
               ct:
               mov ah,6
                mov al,1
                mov bh,0
                mov cl,21
                mov dl,39
                mov ch,19
                mov dh,23
                int 10h
                dec culmcount2
                jmp prntchat


                flop:
                call pro2
                 
                 call drew
                 ret
              



                endreceive:
                ret

 
doreceive endp

chekgame proc near
  
   getrand:
   MOV AH, 2ch          
   INT 21H        ;;;get clock and ranom variable in dl
   MOV BH, 90    
   MOV AH, DL  
   CMP AH, BH    
   JA getrand ; if not not less than 10
   
   ret
chekgame endp
getwinningkey proc near
  

                mov ah,2       ;;;;move curser
                 mov  dl,1
                mov  dh,0
                mov  bh,0
                int  10h
                
                

                mov ah,10;;;;;;;;;get winning key
                mov dx,offset winvalueenter
                int 21h 
                mov cl,winvalueenter[1]
                cmp cl,4
                jb skip
                lea bx,winvalueenter
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov ch,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov dl,ch
                mov dh,cl
                mov anotherwinvalue,dx
              skip:
                 mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,1
               mov ch,0
               mov dl,5
               mov dh,0
               int 10h 
               call printwinvalue
                  
               


              
  ret
getwinningkey endp
checkforwinningkey proc ;;;;;;;;;;for not continue put v after every number 

 
 mov bx,anotherwinvalue

 cmp p2ax,bx
 je equal
 
 cmp p2bx,bx
 je equal
 cmp p2cx,bx
 je equal
 cmp p2dx,bx
 je equal

 cmp p2si,bx
 je equal
 cmp p2di,bx
 je equal
 cmp p2sp,bx
 je equal
 cmp p2bp,bx
 je equal
 cmp p3ax,bx
 je equal
 cmp p3bx,bx
 je equal
 cmp p3cx,bx
 je equal
 cmp p3dx,bx
 je equal

 cmp p3si,bx
 je equal
 cmp p2di,bx
 je equal
 cmp p3sp,bx
 je equal
 cmp p3bp,bx
 je equal


 mov bl,0
 ret
equal:
 mov bl,1
 ret
checkforwinningkey endp
endgame proc near
               mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cx,00
               mov dx,184fh
               int 10h

                mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,10
                mov  bh,0
                int  10h
                mov dx,offset texpoint1 ;;;print text p1 points
               mov ah,9
               int 21h
               mov al,p1point
               call printdec1byte
               

               mov  ah,2             ;;;move curser
                mov  dl,25
                mov  dh,10
                mov  bh,0
                int  10h


                mov dx,offset texpoint2 ;;;print text p2 points
               mov ah,9
               int 21h
               mov al,p2point
               call printdec1byte


               mov  ah,2             ;;;move curser
                mov  dl,15
                mov  dh,5
                mov  bh,0
                int  10h


                mov dx,offset winname ;;;print text p2 points
               mov ah,9
               int 21h
               mov dl,pwin
               cmp dl,2
               jne p2namelop
               mov dx,offset p1name+2 ;;;print text p2 points
               mov ah,9
               int 21h
               ret
               p2namelop:
               mov dx,offset p2name+2 ;;;print text p2 points
               mov ah,9
               int 21h

 
 ret


endgame endp

check_win proc near
 mov al,p1point
 cmp al,0
 jbe p3win
 mov al,p2point
 cmp al,0
 jbe p2win

 mov ax,winvalue
 mov bx,p2ax
 cmp ax,bx
 je p3win
 mov bx,p2bx
 cmp ax,bx
 je p3win
 mov bx,p2cx
 cmp ax,bx
 je p3win
 mov bx,p2dx
 cmp ax,bx
 je p3win
 mov bx,p2si
 cmp ax,bx
 je p3win
 mov bx,p2di
 cmp ax,bx
 je p3win
 mov bx,p2sp
 cmp ax,bx
 je p3win
 mov bx,p2bp
 cmp ax,bx
 je p3win


 mov bx,p3ax
 cmp ax,bx
 je p2win
 mov bx,p3bx
 cmp ax,bx
 je p2win
 mov bx,p3cx
 cmp ax,bx
 je p2win
 mov bx,p3dx
 cmp ax,bx
 je p2win
 mov bx,p3si
 cmp ax,bx
 je p2win
 mov bx,p3di
 cmp ax,bx
 je p2win
 mov bx,p3sp
 cmp ax,bx
 je p2win
 mov bx,p3bp
 cmp ax,bx
 je p2win

 mov dl,0
 
 ret
 p3win:

 mov dl,3
 mov pwin,3
 ret
 p2win:
 mov dl,2
 mov pwin,2
 ret
  
  
check_win endp

change_to_p21 proc near 

mov ax,p2ax
mov p1ax,ax
mov ax,p2bx
mov p1bx,ax
mov ax,p2cx
mov p1cx,ax
mov ax,p2dx
mov p1dx,ax
mov ax,p2si
mov p1si,ax
mov ax,p2di
mov p1di,ax
mov ax,p2sp
mov p1sp,ax
mov ax,p2bp
mov p1bp,ax
mov al,p21
mov p11,al
mov al,p20
mov p10,al
mov al,p22
mov p12,al
mov al,p23
mov p13,al
mov al,p24
mov p14,al
mov al,p25
mov p15,al
mov al,p26
mov p16,al
mov al,p27
mov p17,al
mov al,p28
mov p18,al
mov al,p29
mov p19,al
mov al,p2a
mov p1a,al
mov al,p2b
mov p1b,al
mov al,p2c
mov p1c,al
mov al,p2d
mov p1d,al
mov al,p2e
mov p1e,al
mov al,p2f
mov p1f,al
mov al,p2carry
mov p1carry,al


mov al,p2stacksize
mov p1stacksize,al
mov ax,p2stackindex
mov p1stackindex,ax
mov bx,0
mov cl,10
stacklop:
mov al,p2stack[bx]
mov p1stack[bx],al
dec cl
inc bx
cmp cl,0
jnz stacklop


ret
change_to_p21 endp

change_to_p31 proc near 

mov ax,p3ax
mov p1ax,ax
mov ax,p3bx
mov p1bx,ax
mov ax,p3cx
mov p1cx,ax
mov ax,p3dx
mov p1dx,ax
mov ax,p3si
mov p1si,ax
mov ax,p3di
mov p1di,ax
mov ax,p3sp
mov p1sp,ax
mov ax,p3bp
mov p1bp,ax
mov al,p31
mov p11,al
mov al,p30
mov p10,al
mov al,p32
mov p12,al
mov al,p33
mov p13,al
mov al,p34
mov p14,al
mov al,p35
mov p15,al
mov al,p36
mov p16,al
mov al,p37
mov p17,al
mov al,p38
mov p18,al
mov al,p39
mov p19,al
mov al,p3a
mov p1a,al
mov al,p3b
mov p1b,al
mov al,p3c
mov p1c,al
mov al,p3d
mov p1d,al
mov al,p3e
mov p1e,al
mov al,p3f
mov p1f,al
mov al,p3carry
mov p1carry,al


mov al,p3stacksize
mov p1stacksize,al
mov ax,p3stackindex
mov p1stackindex,ax
mov bx,0
mov cl,11
stacklop2:
mov al,p3stack[bx]
mov p1stack[bx],al
dec cl
inc bx
cmp cl,0
jnz stacklop2


ret
change_to_p31 endp

fors proc near
    mov ax,0
    mov ch,56                     ;;;;;;;;;;for not continue put v after every number 
    lea si, s
    lea di ,command1          
    mov bx,0
    lop: 
    mov dl,[di+bx]
    cmp dl,48
    jb lop2
    cmp dl,71
    ja lop2 
    cmp ch,2
    je lop2
    mov ch,2
    mov al,'v' 
      mov [si+bx],al
      inc si
    
    lop2:
      mov [si+bx],dl
      inc bx
      mov cl,'$'
      cmp dl,cl
      jne lop
 ret
fors endp

setreg_tozero_p1 proc near;;;;;;;set rgester to zero
 
 mov p2ax,0
 mov p2bx,0
 mov p2cx,0
 mov p2dx,0
 mov p2si,0
 mov p2di,0
 mov p2sp,0
 mov p2bp,0
 ret
setreg_tozero_p1 endp

setreg_tozero_p2 proc near;;;;;;;set rgester to zerox
 
 mov p3ax,0
 mov p3bx,0
 mov p3cx,0
 mov p3dx,0
 mov p3si,0
 mov p3di,0
 mov p3sp,0
 mov p3bp,0
 ret
setreg_tozero_p2 endp

setram_tozero_p1 proc near
 
 mov p20,0
 mov p21,0
 mov p22,0
 mov p23,0
 mov p24,0
 mov p25,0
 mov p26,0
 mov p27,0
 mov p28,0
 mov p29,0
 mov p2a,0
 mov p2b,0
 mov p2c,0
 mov p2d,0
 mov p2e,0
 mov p2f,0

 
 
 ret 
setram_tozero_p1 endp

setram_tozero_p2 proc near
 
 mov p30,0
 mov p31,0
 mov p32,0
 mov p33,0
 mov p34,0
 mov p35,0
 mov p36,0
 mov p37,0
 mov p38,0
 mov p39,0
 mov p3a,0
 mov p3b,0
 mov p3c,0
 mov p3d,0
 mov p3e,0
 mov p3f,0

 
 
 ret 
setram_tozero_p2 endp

printcarry1 proc near 
  
  mov ah,13h
 mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset carrytxt
 mov dl,1
 mov dh,1
 mov cx,2
 int 10h

               mov  ah,2             ;;;move curser
                mov  dl,3
                mov  dh,1
                mov  bh,0
                int  10h

                mov  ah,2
                      
                mov  dl,p2carry
                add dl,30h
                int  21h
  
 

 ret
printcarry1 endp

printcarry2 proc near 
  
  mov ah,13h
 mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset carrytxt
 mov dl,21
 mov dh,1
 mov cx,2
 int 10h

               mov  ah,2             ;;;move curser
                mov  dl,23
                mov  dh,1
                mov  bh,0
                int  10h
                mov  ah,2
                      
                mov  dl,p3carry
                add dl,30h
                int  21h
  
 

 ret
printcarry2 endp

printforbidden1 proc near 
  
  mov ah,13h
 mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset forbiddentxt
 mov dl,6
 mov dh,1
 mov cx,4
 int 10h

               mov  ah,2             ;;;move curser
                mov  dl,10
                mov  dh,1
                mov  bh,0
                int  10h

                mov  ah,2
                      
                mov  dl,preventingchar1
                int  21h
  
 

 ret
printforbidden1 endp

printforbidden2 proc near 
  
  mov ah,13h
 mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset forbiddentxt
 mov dl,26
 mov dh,1
 mov cx,4
 int 10h

               mov  ah,2             ;;;move curser
                mov  dl,30
                mov  dh,1
                mov  bh,0
                int  10h

                mov  ah,2
                      
                mov  dl,preventingchar2
                
                int  21h
  
 

 ret
printforbidden2 endp

change proc near   ;;;;;change command2 to $
 
    
    mov cl,28 
    mov bx,0 
    lop28:
    mov dl,'$'
      mov [si+bx],dl
      inc bx
      cmp bl,cl
      jne lop28
 ret
change endp


printpoint proc near   ;;;;print players points
                mov  ah,2             ;;;move curser
                mov  dl,2
                mov  dh,15
                mov  bh,0
                int  10h
                mov dx,offset texpoint1 ;;;print text p1 points
               mov ah,9
               int 21h
               mov al,p1point
               call printdec1byte
               

               mov  ah,2             ;;;move curser
                mov  dl,22
                mov  dh,15
                mov  bh,0
                int  10h


                mov dx,offset texpoint2 ;;;print text p2 points
               mov ah,9
               int 21h
               mov al,p2point
               call printdec1byte

 
 ret

printpoint endp


getcommand1 proc near
               
               MOV AH,2
                 mov  dl,1
                mov  dh,17
                mov  bh,0
                add dl,countstring
                int  10h

                
               

                mov ah, 1   ; peek
                int 16h
               jz   comandskip
                mov ah, 0   ; get
                  int 16h
	 
	              
                lea si,comand1+1
	             mov bl,countstring
	              mov bh,0
	             add si,bx
              
	             mov dl,13
	             cmp al,dl
	            je endwriting
	            mov [si],al
              
	            mov ah,2
	           mov dl,al
	           int 21h
	           inc countstring
                comandskip:
                mov bl,0
               ret

               endwriting:
               mov dl,'$'	
               mov [si],dl
               mov [di],dl
               mov countstring,0
          


         
               
    

        lea si,comand1+1
        lea di,command1
        ck:
        mov dl,[si]
        mov [di],dl
       ;mov dh,preventingchar1
       ;cmp dl,dh
       ;je prevlop1
       inc si
       inc di
        cmp dl,'$'
        jne ck      

              mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,1
               mov ch,17
               mov dl,16
               mov dh,18
               int 10h
               mov al,procnumper
               cmp al,'1'
               je p223
               mov comand1[0],'c'
                  call sending 
                  mov bl,1
               ret
               p223:
               mov comand1[0],'9'
                  call sending 
                  mov bl,1
               ret

               prevlop1:
              
               mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,1
               mov ch,17
               mov dl,16
               mov dh,17
               int 10h 
               mov bl,2 
               mov comand1[0],'e'
   
 ret
getcommand1 endp


getcommand2 proc near
               

                 mov ah,2       ;;;;move curser
                 mov  dl,21
                mov  dh,17
                mov  bh,0
                int  10h
                
                

               mov ah,10
                mov dx,offset comand1
                int 21h 

                lea si,  command1
                lea di ,comand1  
    mov cl,[di+1] 
    mov bx,0
    lop57: 
    mov dl,[di+bx+2]
    mov dh,preventingchar2
    cmp dl,dh
    je prevlop2
      mov [si+bx],dl
      inc bx
      cmp bl,cl
      jne lop57

              mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,21
               mov ch,38
               mov dl,16
               mov dh,18
               int 10h
               mov bh,12;;;;;
               ret

              prevlop2:
              mov bl,0 
              mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,21
               mov ch,17
               mov dl,38
               mov dh,17
               int 10h 
               
   
ret
getcommand2 endp


printram1 proc near


               mov rampos,16
               ramp1lop:  
               call print4bit
               inc ramcounter
               inc ramccouner
               cmp ramccouner,58
               je inclop
               lop3:
               cmp ramcounter,16
               jae final3
               jmp ramp1lop

               inclop:
               add ramccouner,7
               jmp lop3
               
               final3:
               mov cl,0
               mov ramcounter,cl
               mov cl,48
               mov ramccouner,cl


ret
printram1 endp

printram2 proc near

               mov rampos,36
               ramp2lop:  
               call print4bit2
               inc ramcounter
               inc ramccouner
               cmp ramccouner,58
               je inc3
               lop4:
               cmp ramcounter,16
               jae final2
               jmp ramp2lop

               inc3:
               add ramccouner,7
               jmp lop4
               
               final2:
               mov cl,0
               mov ramcounter,cl
               mov cl,48
               mov ramccouner,cl


ret
printram2 endp
print4bit proc near
                mov  ah,2
                
                mov  dl,16
                mov  dh,ramcounter
                mov  bh,0
                int  10h
                mov  ah,2                   
                mov  dl,ramccouner
                int  21h
                mov  dl,' '
                int  21h
                lea bx,p20
                add bl,ramcounter
               mov al,[bx]              
               call print1byte
ret
print4bit endp
print4bit2 proc near
                mov  ah,2
                
                mov  dl,36
                mov  dh,ramcounter
                mov  bh,0
                int  10h
                mov  ah,2                   
                mov  dl,ramccouner
                int  21h
                mov  dl,' '
                int  21h
                lea bx,p30
                add bl,ramcounter
               mov al,[bx]              
               call print1byte
ret
print4bit2 endp

drew proc near ;drew game gui 

              
               
               mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cx,00
               mov dx,184fh
               int 10h
               mov culmcount2,0
               mov culmcount1,0

                mov  cx,160   ;;vertivalll ine 
                mov  dx,0
                mov  al,5
                mov  ah,0ch		   
                vertcalline:       
    
    
                int  10h
                inc  dx
                cmp  dx,200
                jne  vertcalline

               ;;;;;;;;;;;;;;;;
                
              
                mov  cx,285  ;;;drew line ram 2
                mov  dx,0
                mov  al,5
                mov  ah,0ch		   
                v2:       
                int  10h
                inc  dx
                cmp  dx,130
                jne  v2
                ;;;;;;;;;;;;

                   mov  cx,125  ;;;drew line ram1
                mov  dx,0
                mov  al,5
                mov  ah,0ch		   
                v3:       
                int  10h
                inc  dx
                cmp  dx,130
                jne  v3

                ;;;;;;;;;;

               mov  cx,0
                mov  dx,130
                mov  al,5
                mov  ah,0ch
				    			   
               hline:    ;herzontal line    
                int  10h
                inc  cx
                cmp  cx,320
                jne  hline

                mov  cx,0
                mov  dx,150
                mov  al,5
                mov  ah,0ch
				    			   
               hline2:    ;herzontal line    
                int  10h
                inc  cx
                cmp  cx,320
                jne  hline2


  
               call print_p1reg ;print reg
               call print_p2reg
                                ;;; drew p1 name
                 mov  ah,2
                mov  dl,3
                mov  dh,12
                mov  bh,0
                int  10h
                mov dx,offset p1name+2
                call print_name

               ;;;;drew p1 box
                mov  cx,20  ;set dimension of the box
                mov  dx,90
                mov  al,5
                mov  ah,0ch
               box1:        
                int  10h
                inc  cx
                cmp  cx,100
                jne  box1 
                
                ;;;;;;;;;;;
                
               mov  cx,20
                mov  dx,110
                mov  al,5
                mov  ah,0ch	  
               			   
                 box2:        
                int  10h
                inc  cx
                cmp  cx,100
                jne  box2
                ;;;;;;;;
                mov  cx,20
                mov  dx,90
                mov  al,5
                mov  ah,0ch	  
               			   
                 box3:        
                int  10h
                inc  dx
                cmp  dx,110
                jne  box3
                
                ;;;;;;;;;;;
                mov  cx,100
                mov  dx,90
                mov  al,5
                mov  ah,0ch	  
               			   
                 box4:        
                int  10h
                inc  dx
                cmp  dx,110
                jne  box4
          

                   ;;;;;;;drew p2 box
                 ;drew p2 name 
                 mov  ah,2
                mov  dl,23
                mov  dh,12
                mov  bh,0
                int  10h
                mov dx,offset p2name+2
                call print_name

               

                ;call print_name

                ;;;;drew box
                mov  cx,180  ;set dimension of the box
                mov  dx,90
                mov  al,5
                mov  ah,0ch
               p2box1:        
                int  10h
                inc  cx
                cmp  cx,260
                jne  p2box1 
                
                ;;;;;;;;;;;
                
               mov  cx,180
                mov  dx,110
                mov  al,5
                mov  ah,0ch	  
               			   
                p2box2:        
                int  10h
                inc  cx
                cmp  cx,260
                jne  p2box2
                ;;;;;;;;
                mov  cx,180
                mov  dx,90
                mov  al,5
                mov  ah,0ch	  
               			   
                 p2box3:        
                int  10h
                inc  dx
                cmp  dx,110
                jne  p2box3
                
                ;;;;;;;;;;;
                mov  cx,260
                mov  dx,90
                mov  al,5
                mov  ah,0ch	  
               			   
                 p2box4:        
                int  10h
                inc  dx
                cmp  dx,110
                jne  p2box4

                call printram1
                call printram2
                call printpoint
                call printcarry1
                 call printcarry2
                 mov cl,level
              cmp cl,50
              jne levellop
              call printwinvalue
  ret
  levellop:
  call printforbidden1
  call printforbidden2
  call printwinvalue
  ret

drew endp

printwinvalue proc near 
              
              mov ah,13h
             mov al,0
            mov bh,0
           mov bl,5
            mov bp,offset wtxt
             mov dl,5
           mov dh,0
          mov cx,3
            int 10h
 
                MOV AH,2
                mov  dl,8
                mov  dh,0
                mov  bh,0
                int  10h
 mov ax,winvalue
 call print_nump

  mov ah,13h
             mov al,0
            mov bh,0
           mov bl,5
            mov bp,offset wtxt
             mov dl,25
           mov dh,0
          mov cx,3
            int 10h
 
                MOV AH,2
                mov  dl,29
                mov  dh,0
                mov  bh,0
                int  10h
 mov ax,winvalue
 call print_nump
 ret
printwinvalue endp
print_p1reg proc near  ;print p1 regester
               mov  ah,2
                mov  dl,2
                mov  dh,2
                mov  bh,0
                int  10h
                
                mov ecx,0000
                mov cx,"XA"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,2
                mov  bh,0
                int  10h
                mov  ax,[p2ax]
                call print_nump
                
                mov  dl,2
                mov  dh,3
       
                 mov cx,"XB"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,3
                mov  bh,0
                int  10h
                 mov  ax,[p2bx]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,4
                mov  bh,0
                int  10h
                 mov cx,"XC"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,4
                mov  bh,0
                int  10h
                mov  ax,[p2cx]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,5
                mov  bh,0
                int  10h
                 mov cx,"XD"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,5
                mov  bh,0
                int  10h
                mov  ax,[p2dx]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,6
                mov  bh,0
                int  10h
                 mov cx,"IS"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,6
                mov  bh,0
                int  10h
                mov  ax,[p2si]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,7
                mov  bh,0
                int  10h
                 mov cx,"ID"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,7
                mov  bh,0
                int  10h
                 mov  ax,[p2di]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,8
                mov  bh,0
                int  10h
                 mov cx,"PS"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,8
                mov  bh,0
                int  10h
                  mov  ax,[p2sp]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,9
                mov  bh,0
                int  10h
                 mov cx,"PB"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,9
                mov  bh,0
                int  10h
                mov  ax,[p2bp]
                call print_nump

ret
print_p1reg endp

print_p2reg proc near ;drew p2 regester
                mov  ah,2
                mov  dl,22
                mov  dh,2
                mov  bh,0
                int  10h
                
                
                mov cx,"XA"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,25
                mov  dh,2
                mov  bh,0
                int  10h
                mov  ax,[p3ax]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,3
                mov  bh,0
                int  10h
                 mov cx,"XB"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,25
                mov  dh,3
                mov  bh,0
                int  10h
                mov  ax,[p3bx]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,4
                mov  bh,0
                int  10h
                 mov cx,"XC"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,4
                mov  bh,0
                int  10h
                mov  ax,[p3cx]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,5
                mov  bh,0
                int  10h
                 mov cx,"XD"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,5
                mov  bh,0
                int  10h
                mov  ax,[p3dx]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,6
                mov  bh,0
                int  10h
                 mov cx,"IS"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,6
                mov  bh,0
                int  10h
                mov  ax,[p3si]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,7
                mov  bh,0
                int  10h
                 mov cx,"ID"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,7
                mov  bh,0
                int  10h
                mov  ax,[p3di]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,8
                mov  bh,0
                int  10h
                 mov cx,"PS"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,8
                mov  bh,0
                int  10h
                mov  ax,[p3bp]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,9
                mov  bh,0
                int  10h
                 mov cx,"PB"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,9
                mov  bh,0
                int  10h
                mov  ax,[p3bp]
                call print_nump
                ret 
print_p2reg endp


print_reg proc near 


mov ah,13h
mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset regname
 ;mov dl,2
 ;mov dh,2
mov cx,2
int 10h

ret
print_reg endp


print_name proc near 
mov ah,9

int 21h
ret
print_name endp


print_nump proc near       ;;;print ax 
        
   
                mov  lpart,al
                mov  al,ah
                mov  dl,10h
                mov  ah,0

                div  dl

                mov  dh,ah
                add  al,30h
                mov  ah,2
                cmp  al,58
                jae  icrementhex3
                jmp  dec3
                icrementhex3: 
                add  al,7
                 dec3:         
                mov  dl,al
                int  21h
   
                mov  al,dh
                add  al,30h
                mov  ah,2
                cmp  al,58
                jae  l1
                jmp  dec4
                l1:           
                add  al,7
               dec4:         
                mov  dl,al
                int  21h
   
                mov  al,lpart
                mov  dl,10h
                mov  ah,0

                div  dl

                mov  dh,ah
                add  al,30h
                mov  ah,2
                cmp  al,58
                jae  icrementhex1
                jmp  dec1
                icrementhex1: 
                add  al,7
                 dec1:         
                mov  dl,al
                int  21h
   
                mov  al,dh
                add  al,30h
                mov  ah,2
                cmp  al,58
                jae  icrementhex12
                jmp  dec2
                icrementhex12:
                add  al,7
                dec2:         
                mov  dl,al
                int  21h
                ret
print_nump endp


print1byte proc near ;print 1byte al
  

                
                mov  dl,10h
                mov  ah,0

                div  dl

                mov  dh,ah
                add  al,30h
                mov  ah,2
                cmp  al,58
                jae  pr1
                jmp  lo1
                pr1: 
                add  al,7
                 lo1:         
                mov  dl,al
                int  21h
   
                mov  al,dh
                add  al,30h
                mov  ah,2
                cmp  al,39h
                jae  pr2
                jmp  l2
                pr2:           
                add  al,7
               l2:         
                mov  dl,al
                int  21h

  ret
print1byte endp

printdec1byte proc near ;;;;;;;print al in byte decimal


       mov  dl,10  
                mov  ah,0

                div  dl

                mov  dh,ah
                add  al,30h
                mov  ah,2
                      
                mov  dl,al
                int  21h
   
                mov  al,dh
                add  al,30h
                mov  ah,2
                    
                mov  dl,al
                int  21h

ret
printdec1byte endp


change_to_p12 proc near 

mov ax,p1ax
mov p2ax,ax
mov ax,p1bx
mov p2bx,ax
mov ax,p1cx
mov p2cx,ax
mov ax,p1dx
mov p2dx,ax
mov ax,p1si
mov p2si,ax
mov ax,p1di
mov p2di,ax
mov ax,p1sp
mov p2sp,ax
mov ax,p1bp
mov p2bp,ax
mov al,p11
mov p21,al
mov al,p10
mov p20,al
mov al,p12
mov p22,al
mov al,p13
mov p23,al
mov al,p14
mov p24,al
mov al,p15
mov p25,al
mov al,p16
mov p26,al
mov al,p17
mov p27,al
mov al,p18
mov p28,al
mov al,p19
mov p29,al
mov al,p1a
mov p2a,al
mov al,p1b
mov p2b,al
mov al,p1c
mov p2c,al
mov al,p1d
mov p2d,al
mov al,p1e
mov p2e,al
mov al,p1f
mov p2f,al
mov al,p1carry
mov p2carry,al

mov al,p1stacksize
mov p2stacksize,al
mov ax,p1stackindex
mov p2stackindex,ax
mov bx,0
mov cl,10
stacklop21:
mov al,p1stack[bx]
mov p2stack[bx],al
dec cl
inc bx
cmp cl,0
jnz stacklop21

ret
change_to_p12 endp

change_to_p13 proc near 

mov ax,p1ax
mov p3ax,ax
mov ax,p1bx
mov p3bx,ax
mov ax,p1cx
mov p3cx,ax
mov ax,p1dx
mov p3dx,ax
mov ax,p1si
mov p3si,ax
mov ax,p1di
mov p3di,ax
mov ax,p1sp
mov p3sp,ax
mov ax,p1bp
mov p3bp,ax
mov al,p11
mov p31,al
mov al,p30
mov p10,al
mov al,p12
mov p32,al
mov al,p13
mov p33,al
mov al,p14
mov p34,al
mov al,p15
mov p35,al
mov al,p16
mov p36,al
mov al,p17
mov p37,al
mov al,p18
mov p38,al
mov al,p19
mov p39,al
mov al,p1a
mov p3a,al
mov al,p1b
mov p3b,al
mov al,p1c
mov p3c,al
mov al,p1d
mov p3d,al
mov al,p1e
mov p3e,al
mov al,p1f
mov p3f,al
mov al,p1carry
mov p3carry,al

mov al,p1stacksize
mov p3stacksize,al
mov ax,p1stackindex
mov p3stackindex,ax
mov bx,0
mov cl,10
stacklop22:
mov al,p1stack[bx]
mov p3stack[bx],al
dec cl
inc bx
cmp cl,0
jnz stacklop22

ret
change_to_p13 endp

SERIAL_INIT PROC  near
    ; Divisor latch access bit
    mov dx,3fbh 			; Line Control Register
    mov al,10000000b		;Set Divisor Latch Access Bit
    out dx,al				;Out it
    ; Set baudrate
    mov dx,3f8h			
    mov al,0ch			
    out dx,al
    ; Set MSB byte of baudrate
    mov dx,3f9h
    mov al,00h
    out dx,al
    ; Set port config
    ; 	0:Access to Receiver buffer, Transmitter buffer
    ;	0:Set Break disabled
    ;	011:Even Parity
    ;	0:One Stop Bit
    ;	11:8bits
    mov dx,3fbh
    mov al,00011011b
    out dx,al
    RET
SERIAL_INIT ENDP

SETUP proc near
        mov ah,6       ; function 6
   mov al,1        ; scroll by 1 line    
   mov bh,7       ; normal video attribute         
   mov ch,0       ; upper left Y
   mov cl,0        ; upper left X
   mov dh,12     ; lower right Y
   mov dl,79      ; lower right X 
   int 10h
   ret       
 SETUP endp 


forme proc near
 
  
 
 
 ret
 forme endp
 reciveing proc near
    
      mov dx , 3FDH
    	CHK:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK                                    ;Not Ready
                       ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		cmp al,'p'
    je getpower
    cmp al,'y'
    je flylop
    cmp al,'9'
    je lev2
     cmp al,'m'
    je chatl
    LEA SI,command1
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
    getpower:
       LEA SI,powerstring2
     mov dx , 3FDH
    	CHK31:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK31                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
    
        inc si
        
       cmp al,51
       je porlop
       cmp al,52
       je   porlop
        cmp al,53
       je   changewin
       mov dx , 3FDH
    	CHK32:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK32                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
      inc si

       mov dx , 3FDH
    	CHK33:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK33                                   ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
     
        jmp rcexit


        porlop:
    LEA SI,command1
  	DEC SI
	  SERIAL_RECEIVE_STRING2:;;;;;;to receive value
    	INC SI
    	mov dx , 3FDH
    	CHK3:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK3                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
      

  		
  	mov cl,'$'
    CMP al,cl
    JNZ SERIAL_RECEIVE_STRING2
    mov dl,'$'
    MOV [SI],dl
    mov bl,1
        jmp rcexit

        changewin:
        LEA SI,winvalueenter
  	DEC SI
    mov cl,4
         SERIAL_RECEIVE_STRING23:;;;;;;to receive value
    	INC SI
    	mov dx , 3FDH
    	CHK37:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK37                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
     mov cl,'$'
     cmp al,cl
    JNZ SERIAL_RECEIVE_STRING23
    jmp rcexit


    lev2:
    LEA SI,command1
  	DEC SI
	  SERIAL_RECEIVE_STRING89:;;;;;;to receive value
    	INC SI
    	mov dx , 3FDH
    	CHK78:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK78                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
  		
  		mov cl,'$'
    CMP al,cl
    JNZ SERIAL_RECEIVE_STRING89
    mov dl,'$'
    MOV [SI],dl
  	; DISPLAY STRING
    
   
    mov bl,2
    ret
    chatl:
    lEA SI,chat2
  	DEC SI
	  SERIAL_RECEIVE_STRING899:;;;;;;to receive value
    	INC SI
    	mov dx , 3FDH
    	CHK787:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK787                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
  		
  		mov cl,'$'
    CMP al,cl
    JNZ SERIAL_RECEIVE_STRING899
    mov dl,'$'
    MOV [SI],dl

    mov bl,3
    ret

     flylop:
     mov bl,87
     ret

    rcexit:
    mov bl,1
	ret
 reciveing endp
 
 recivinfo proc near 
  LEA SI,p3al
  	DEC SI
    mov cl,16
	  SERIAL_RECEIVE_STRING0:;;;;;;to receive value
    	INC SI
    	mov dx , 3FDH
    	CHK02:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK02                                    ;Not Ready
        ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov  [SI], al
  		
  	dec cl
    JNZ SERIAL_RECEIVE_STRING0


 ret
   recivinfo endp 

sending proc near
   
   LEA SI,comand1
   ; MOV CL,SEND_VALUE+1 


    
    SERIAL_SEND_STRING:
        mov dx , 3FDH		; Line Status Register
        AGAIN20:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN20                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		INC SI
  		out dx , al
		mov cl,'$'
        cmp al,cl
    JNZ SERIAL_SEND_STRING
	
	
   
  ret
sending endp
sendpower proc near
   
   LEA SI,powerstring

      mov dx , 3FDH		; Line Status Register
        AGAIN11:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN11                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		out dx , al
		   
       inc si 

       mov dx , 3FDH		; Line Status Register
        AGAIN10:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN10                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  	
  		out dx , al
      inc si 

       mov dx , 3FDH		; Line Status Register
        AGAIN9:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN9                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		out dx , al
   ; MOV CL,SEND_VALUE+1 
      
  
        mov dx , 3FDH		; Line Status Register
        AGAIN8:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN8                               ;Not empty
         inc si
    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H	
        mov cl,'$'	; Transmit data register
  		mov  al,cl
  		
  		out dx , al
		 
  ret
sendpower endp
sendpowercommand proc near
   
   LEA SI,powerstring

      mov dx , 3FDH		; Line Status Register
        AGAIN7:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN7                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		out dx , al
      inc si

      mov dx , 3FDH		; Line Status Register
        AGAIN6:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN6                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  	
  		out dx , al

		  
      lea si,command1
    SERIAL_SEND_STRING22:
        mov dx , 3FDH		; Line Status Register
        AGAIN5:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN5                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		INC SI
  		out dx , al
		   mov cl,'$'
        cmp al,cl
    JNZ SERIAL_SEND_STRING22
	
	
   
  ret
sendpowercommand endp
 sendpowerchangwinvalue proc near
      LEA SI,powerstring

      mov dx , 3FDH		; Line Status Register
        AGAIN77:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN77                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		out dx , al
      inc si

      mov dx , 3FDH		; Line Status Register
        AGAIN66:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN66                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  	
  		out dx , al

		  
      lea si,winvalueenter
      mov cl,4
    SERIAL_SEND_STRING2523:
        mov dx , 3FDH		; Line Status Register
        AGAIN55:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN55                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		INC SI
  		out dx , al
		   mov cl,'$'
      cmp cl,al
    JNZ SERIAL_SEND_STRING2523
	
	
   
  ret
sendpowerchangwinvalue endp
sendchat proc near
     
      
       mov dx , 3FDH		; Line Status Register
        AGAIN57:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN57                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,'m'
  		out dx , al
		 

      lea si,chat
      
    SERIAL_SEND_STRING252:
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
    JNZ SERIAL_SEND_STRING252
	
	
   
  ret
sendchat endp
sendinfo proc near
     
     
		 

      lea si,p2al
      mov cl,16
    SERIAL_SEND_STRING262:
        mov dx , 3FDH		; Line Status Register
        AGAIN564:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN564                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,[SI]
  		INC SI
  		out dx , al
		   dec cl
    JNZ SERIAL_SEND_STRING262
	
	
   
  ret
sendinfo endp
sendlevel proc near 
        mov dx , 3FDH		; Line Status Register
        
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
 sendrg proc near 
        mov dx , 3FDH		; Line Status Register
        
   AGAIN730:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN730                              ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,'r'
  		out dx , al
 
 ret
 sendrg endp
 reciveredy proc near
    
      mov dx , 3FDH
    	CHK810:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK810                                    ;Not Ready
                       ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  	
      
	ret
 reciveredy endp
clearscreen proc near ;clear screen

              mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cx,00
               mov dx,184fh
               int 10h
 ret 
clearscreen endp
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

sednforbchar proc near
 
      mov dx , 3FDH

 AGAIN735:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN735                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,preventingchar2
  		out dx , al
  
 
 ret
sednforbchar endp
recivefrob proc near
    
      mov dx , 03FDH
    	CHK881:	                ;; check wire is or not  empty   if empty wait
    	    in al , dx                  ;;;change
      		test al , 1
      	JZ CHK881                                    ;Not Ready
                       ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H             
  		in al , dx                ;;;get and put it al                
  		mov preventingchar1,al
      mov rc,1
	ret
 recivefrob endp

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
                  l3:
                   mov dx , 3FDH 
                  in al , dx                  ;;;change
      	     	test al , 1
      	     JnZ chck24 

                   mov ah, 1   ; peek
               int 16h
                jz   l3
                mov ah, 0   ; get
               int 16h
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

              ; mov ah,7        ;;;;;to wait until press 
               ;int 21h
               ret

                  	                ;; check wire is or not  empty   if empty wait
    	        
             chck24:
                  call recivefrob
                  mov rc,1
                  jmp l3

               


              

 ret
forlevel1 endp
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
print_reg3 proc near 


mov ah,13h
 mov bh,0
 mov bl,5
 mov bp,offset regname3
mov cx,3
int 10h
ret
print_reg3 endp

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

sendfly proc NEAR
  
   mov dx , 3FDH

 AGAIN735p:  	           ;; if not empty wait
            In al , dx 			;Read Line Status
      		test al , 00100000b
      	JZ AGAIN735p                               ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  	mov al,'y'
  		out dx , al

ret
sendfly endp

END MAIN
    