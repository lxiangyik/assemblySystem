.model small
.stack 100h
 .data


 mainMenu db 9,10,10,13,"==== Main Menu ===="
 db 9,10,10,13,"Please choose one of the patterns:"
 db 9,10,10,13,"1 - Number Pattern"
db 9,10,13,"2 - Design Pattern"
 db 9,10,13,"3 - Box Type Pattern"
 db 9,10,13,"4 - Nested Loop Pattern"
 db 9,10,13,"5 - Exit"
 db 9,10,10,13,"$"

 msg_Menu db 13, "		DDDDD   IIIII  SSSSS   CCCCC   OOOOO		"  
         db 10, "		DD  DD   III  SS      CC    C OO   OO		"
		 db 10,"		DD   DD  III   SSSSS  CC      OO   OO		"
         db 10,"		DD   DD  III       SS CC    C OO   OO		"
		 db 10,"		DDDDDD  IIIII  SSSSS   CCCCC   OOOOO		"
         db 10,13,"---------------------------------------------------------------------"

 msgCont db 9,10,10,13, "Press any key to continue...$"
 msgnum db 9,10,10,13,"Choose a number from 1 - 5: $"
 msgPrint db 9,10,13,"The Pattern is being Printed..."
 db 9,10,10,13,"$"

 msgError db 9,10,13,"Error, wrong input"
 db 9,10,13,"Press any key to continue...$"

 msgExit db 9,10,13,"Exiting....$"



 msg1 db 9,10,13," 11"
 db 9,10,13," 1111"
 db 9,10,13," 111111"
 db 9,10,13,"11111111"
 db 9,10,13," 111111" 
 db 9,10,13," 1111"
 db 9,10,13," 11$"

 msg2 db 9,10,13," 22"
 db 9,10,13," 2222"
 db 9,10,13," 222222"
 db 9,10,13,"22222222"
 db 9,10,13," 222222"
 db 9,10,13," 2222"
 db 9,10,13," 22$"


 msg3 db 9,10,13," 33"
 db 9,10,13," 33333"
 db 9,10,13," 3333333"
 db 9,10,13,"333333333"
 db 9,10,13," 333333"
 db 9,10,13," 3333"
 db 9,10,13," 33$"

 msg4 db 9,10,13," 44"
 db 9,10,13," 44444"
 db 9,10,13," 4444444"
 db 9,10,13,"444444444"
 db 9,10,13," 4444444"
 db 9,10,13," 44444"
 db 9,10,13," 44$"

 msg5 db 9,10,13," 55"
 db 9,10,13," 5555"
 db 9,10,13," 5555555"
 db 9,10,13,"555555555"
 db 9,10,13," 555555"
 db 9,10,13," 5555"
db 9,10,13," 55$"




 counter2 dw 0
 counter4 dw 7
 counter3 dw 3
 counter5 dw 0

 counter6 dw 1
 counter1 dw 0
 boxcounter1 dw 10
 boxcounter2 dw 4

 .code
 .386

 Welcome proc
 mov ax,@data
 mov ds,ax


 Start:

 mov ah,00
 mov al,02
 int 10h
 
  Banner:
 mov ah,09h
 mov dx,offset msg_Menu
 int 21h

 mov ah,09h
 mov dx,offset mainMenu
 int 21h

 mov ah,01h
 mov dl,al
 int 21h
 cmp al,49
 je Num

 cmp al,50
 je Des

 cmp al,51
 je Box

 cmp al,52
 je Nes

 cmp al,53
 je Ended

 jmp Error

 Error:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgError
 int 21h 

 mov ah, 01h
 mov dl,al
 int 21h

 jmp Start

Num:
;number patterns
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgnum
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 cmp al,49
 je num1
 cmp al,50
 je num2
 cmp al,51
 je num3
 cmp al,52
 je num4
 cmp al,53
 je num5




 back:
 mov ah,09h
 mov dx,offset msgCont
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp start

 num1: mov dx,offset msg1
 mov ah,09h
 int 21h
 jmp back
 num2: mov dx,offset msg2
 mov ah,09h
 int 21h
 jmp back
 num3: mov dx,offset msg3
 mov ah,09h
 int 21h
 jmp back
 num4: mov dx,offset msg4
 mov ah,09h
 int 21 
 jmp back
 num5: mov dx,offset msg5
 mov ah,09h
 int 21h
 jmp back

 

 Des:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgPrint
 int 21h

 jmp faraway


 backfromfaraway:

 mov ah,09h
 mov dx,offset msgCont
 int 21h

 mov ah,01h
 mov dl,al
 int 21h
 jmp Start
 Box:
mov ah,00
mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgPrint
 int 21h

 jmp awayfrombox


 backawayfrombox:



 mov ah,09h
 mov dx,offset msgCont
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp start

 Nes:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgPrint
 int 21h

 mov ah,2
 mov cx,6

 Nesloop:
 push cx
 NesInner:
 mov dl,254
int 21h

 loop NesInner
 mov dl,10
 int 21h

 pop cx 
 loop NesLoop

 mov ah,09h
 mov dx,offset msgCont
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp start

 Ended:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgExit
 int 21h

 mov ah,4ch
 int 21h

 faraway:

 pre_design:

 inc counter1 ;check whether is first line
 cmp counter1,2
 jl restart

 mov cx,counter2

 rea:
 cmp counter2,0
 je jumprea

 mov dl,32
 mov ah,2
 int 21h
 loop rea

 jumprea:

 inc counter2
cmp counter1,5 ;check middle line
 je restart
mov dl,254
mov ah,2
 int 21h

 restart:

 mov cx,counter3

 pattern_head:

 mov bx,cx
 mov cx,counter4

 cmp counter1,5 ;check middle line
 je b

 a:
 mov dl,32
 mov ah,2
 int 21h

 loop a


 b:
 mov dl,254
 mov ah,2
 int 21h

 mov cx,counter5

 c:
 cmp counter5,0
 je d

 mov dl,32
 mov ah,2
 int 21h

 loop c

 d:
 cmp counter1,5 ;check middle line
 je jump_d 


 mov dl,254
 mov ah,2
 int 21h
 jump_d:

 mov cx,bx

loop pattern_head


cmp counter1,5 ;check middle line
 jne recraft_next_line

 mov dl,254
 mov ah,2
 int 21h

 recraft_next_line:

 mov dl,10
 mov ah,2
 int 21h

 mov dl,13
 int 21h

 
 cmp counter6,5
 je end_pattern_head
 inc counter5
 inc counter5

 ;dec counter4
 dec counter4
 dec counter4

 inc counter6 ;pre diamond shape

 cmp counter6,6
 jne pre_design

 end_pattern_head:

 ;first half <--


 ;seconf half -->
 dec counter2
 dec counter2


 inc counter4
 inc counter4

 
 dec counter5
 dec counter5


 pre_design1:
 dec counter1 ;check whether is end line
 cmp counter1,2
 jl restart_opt



 mov cx,counter2

 rea1:
 cmp counter2,0
 je jumprea_opt

 mov dl,32
 mov ah,2
 int 21h

 loop rea1


 jumprea_opt:

 dec counter2

 mov dl,42
 mov ah,2
 int 21h
 restart_opt:

 mov cx,counter3


 pattern_tail:

 mov bx,cx
 mov cx,counter4

 e:
 mov dl,32
 mov ah,2
 int 21h

 loop e

 f:
 mov dl,42
 mov ah,2
 int 21h

 mov cx,counter5

 g:
 cmp counter5,0
 je h

 mov dl,32
 mov ah,2
 int 21h

 loop g

 h:
 mov dl,42
 mov ah,2
 int 21h

 mov cx,bx

 loop pattern_tail

 recraft_next_line_tail:

 mov dl,10
 mov ah,2
 int 21h

 mov dl,13
 int 21h

 dec counter5
 dec counter5

 inc counter4
 inc counter4

 dec counter6 ;pre diamond shape


 cmp counter6,1
 jne pre_design1


 mov ah,09h
 mov dx,offset msgCont
 int 21h


 jmp backfromfaraway


 awayfrombox:

 boxstart: mov cx,boxcounter1

 mov dl,42
 mov ah,2
 hi: int 21h
  dec cx
cmp cx,0
jne hi

 mov cx,boxcounter2
 cmp cx,0
 je byebox
 dec boxcounter2
 mov dl,10
 mov ah,2
 int 21h
 jmp boxstart


 byebox: jmp backawayfrombox

 Welcome endP
 end Welcome