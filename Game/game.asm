INCLUDE Irvine32.inc
include macros.inc
;INCLUDE  winmm.inc
INCLUDELIB  winmm.lib

BUFFER_SIZE = 1000
  
.data

 buffer BYTE BUFFER_SIZE DUP(?)
 filename BYTE "Highscore.txt", 0
 fileHandle HANDLE ?
 stringLength DWORD ?
 bytesWritten DWORD ?
  
 strname byte "Name             Score        Level",0
 strsco byte "Score           ",0
 scorestring byte "          ",0
 levelstring byte "          ",0
 newline byte 0ah
 spaces byte "  ",0
 nameofuser byte 20 dup (?)

ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
ground1 BYTE "|",0ah,0
ground2 BYTE "|",0

;First page data

title0 byte " _-_-_-_-_-      - -      -_-_-_-_-   _-_      _-_       - -      _-_           ", 0ah, 0 
title1 byte "/          |   /- - -\   /            / \      / \     /- - -\   /   \         |", 0ah, 0 ;0ah is a newline character
title2 byte "|          |  /       \  |           /   \    /   \   /       \  |    \        |", 0ah, 0
title3 byte "|          | |         | |           |   \    /   |  |         | |     \       |", 0ah, 0 
title4 byte "|_-_-_-_-_-| |         | |           |    \  /    |  |         | |      \      |", 0ah, 0
title5 byte "|            |_-_-_-_-_| |           |     \/     |  |_-_-_-_-_| |       \     |", 0ah, 0
title6 byte "|            |         | |           |            |  |         | |        \    |", 0ah, 0
title7 byte "|            |         | |           |            |  |         | |         \   /", 0ah, 0
title8 byte "|            |         | \_-_-_-_-_  |            |  |         | |          -_- ", 0ah, 0 

strline byte"---#--^--#--^--#--^--#--^--#--^--#--^--#^/^\^#--^--#--^--#--^--#--^--#--^--#---",0ah,0

title9  byte  "                 " ,0ah,0
title10 byte  "     ----------  " ,0ah,0
title11 byte  "   --------0---- " ,0ah,0
title12 byte  "  -----------    " ,0ah,0
title13 byte  " --------        " ,0ah,0
title14 byte  "  -----------    " ,0ah,0
title15 byte  "   ------------- " ,0ah,0
title16 byte  "     ----------  " ,0ah,0
title17 byte  "                 " ,0ah,0

nameprompt byte "Enter your name: ",0
namestr byte 25 DUP(?),0
fpageprompt byte "Press [ENTER] to continue....",0
;First page data------------------------------------------

;MENU PAGE
;PAUSE
mptitle byte "|           Paused!!!            |",0ah,0
mptitle0 byte"| [1] Resume                     |",0ah,0
mptitle1 byte"| [2] Start over                 |",0ah,0


mtitle0 byte " -------------------------------- ",0ah,0
mtitle1 byte "|           Main Menu            |",0ah,0
mtitle2 byte "|--------------------------------|",0ah,0 
mtitle3 byte "| [1] Play game                  |",0ah,0 
mtitle4 byte "| [2] High Score                 |",0ah,0 
mtitle5 byte "| [3] Instructions               |",0ah,0
mtitle6 byte "| [4] Exit                       |",0ah,0
mtitle7 byte "|--------------------------------|",0ah,0
mtitle8 byte "| {PRESS 1,2,3,4 to take action} |",0ah,0


;Instructions----------------------------

ins0 byte "+-+------------INSTRUCTIONS-----------+-+",0ah,0
ins1 byte "+-+         Press[W] to move UP       +-+",0ah,0
ins2 byte "+-+         Press[S] to move DOWN     +-+",0ah,0
ins3 byte "+-+         Press[D] to move LEFT     +-+",0ah,0
ins4 byte "+-+         Press[A] to move Right    +-+",0ah,0
ins5 byte "+-+         Press[P] to PAUSE         +-+",0ah,0
ins6 byte "+-+         Press[X] to exitgame      +-+",0ah,0
ins7 byte "+-+         Press[ESC] for menu       +-+",0ah,0
ins8 byte "+-+/---------------\*/---------------\+-+",0ah,0


;MAP LEVEL 1
maplevel1 db " #------------------------------------------------ LEVEL (1)! ------------------------------------------------------#",0
          db " #---------------------------------Pac-Mania: Chomping through the Maze of Adventure!-------------------------------#",0
          db " #------------------------------------------------------------------------------------------------------------------#",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   * --------  *   * --------  *   * ||||||||||||||||||||||||||||| *   * --------  *   * --------  *   *   * #",0
          db " #*   *   * --------  *   * --------  *   * ||||||||||||||||||||||||||||| *   * --------  *   * --------  *   *   * #",0
          db " #*   *   * --------  *   * --------  *   * ||/\/\/\/\/\/\/\/\/\/\/\/\||| *   * --------  *   * --------  *   *   * #",0
          db " #*   *   * --------  *   * --------  *   * ||------------------------||| *   * --------  *   * --------  *   *   * #",0 
          db " #*   *   * --------  *   * --------  *   * ||\/\/\/\/\/\/\/\/\/\/\/\/||| *   * --------  *   * --------  *   *   * #",0
          db " #*   *   * --------  *   * --------  *   * ||||||||||||||||||||||||||||| *   * --------  *   * --------  *   *   * #",0
          db " #*   *   * --------  *   * --------  *   * ||||||||||||||||||||||||||||| *   * --------  *   * --------  *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #------------------------------------------------------------------------------------------------------------------#",0


maplevel1c db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0
           db "                                                                                                                     ",0

maplevel2 db " #------------------------------------------------ LEVEL (2)! ------------------------------------------------------#",0
          db " #---------------------------------Pac-Mania: Chomping through the Maze of Adventure!-------------------------------#",0
          db " #------------------------------------------------------------------------------------------------------------------#",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   * ------------------------------------  *   *   *   *   * ------------------------------------  *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #----------------*   *   *   * --------  * ||/\/\/\/\/\/\/\/\/\/\/\/\||| * --------  *   *   *   * ----------------#",0
          db " #----------------*   *   *   * --------  * ||||||||||||||||||||||||||||| * --------  *   *   *   * ----------------#",0
          db " #----------------*   *   *   * --------  * ||||||||||||||||||||||||||||| * --------  *   *   *   * ----------------#",0
          db " #*   *   *   *   *   *   *   * --------  * ||------------------------||| * --------  *   *   *   *   *   *   *   * #",0 
          db " #*   *   * --------  *   *   * --------  * ||||||||||||||||||||||||||||| * --------  *   *   * --------  *   *   * #",0
          db " #*   *   * --------  *   *   * --------  * ||||||||||||||||||||||||||||| * --------  *   *   * --------  *   *   * #",0
          db " #*   *   *   *   *   *   *   * --------  * ||\/\/\/\/\/\/\/\/\/\/\/\/||| * --------  *   *   *   *   *   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   *  -------------*   *   *   *   *   *-------------  *   *   *   ||||||  *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   *  -------------*   *   *   *   *   *-------------  *   *   *   ||||||  *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   *  -------------*   *   *   *   *   *-------------  *   *   *   ||||||  *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   *  -------------*   *   *   *   *   *-------------  *   *   *   ||||||  *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   *   * * * * * * *   *   *   *   *   * * * * * * *   *   *   *   ||||||  *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   *   * * * * * * *   *   *   *   *   * * * * * * *   *   *   *   ||||||  *   *   * #",0
          db " #------------------------------------------------------------------------------------------------------------------#",0

maplevel3 db " #------------------------------------------------ LEVEL (3)! ------------------------------------------------------#",0
          db " #---------------------------------Pac-Mania: Chomping through the Maze of Adventure!-------------------------------#",0
          db " #------------------------------------------------------------------------------------------------------------------#",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   *   ||||||||  ||||||||  ||||||||||  *   *  ------------ *   *   * |||    |||  ||||||  |||    || *   *   * #",0
          db " #*   *   *   ||||||||  ||||||||  ||          *   *  ------------ *   *   * || |  | ||  ||||||  || |   || *   *   * #",0
          db " #*   *   *   ||||||||  ||----||  ||          *   *  ------------ *   *   * ||  ||  ||  |----|  ||  |  || *   *   * #",0
          db " #*   *   *   ||        ||    ||  ||          *   *  ------------ *   *   * ||      ||  |    |  ||   | || *   *   * #",0
          db " #*   *   *   ||        ||    ||  ||||||||||  *   *  ------------ *   *   * ||      ||  |    |  ||    ||| *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #----------------*   *   *  -------- *   * |||||||||            |||||||| *   * --------  *   *   ------------------#",0
          db " #----------------*   *   *  -------- *   * |||||||||            |||||||| *   * --------  *   *   ------------------#",0
          db " #----------------*   *   *  -------- *   * ||                         || *   * --------  *   *   ------------------#",0
          db " #*   *   *   *   *   *   *  -------- *   * ||                         || *   * --------  *   *   *   *   *   *   * #",0 
          db " #*   *   *   *   *   *   *  -------- *   * ||                         || *   * --------  *   *   *   *   *   *   * #",0
          db " #*   *   * --------  *   *  -------- *   * ||                         || *   * --------  *   ---------   *   *   * #",0
          db " #*   *   * --------  *   *  -------- *   * ||                         || *   * --------  *   ---------   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   * ------------- *   *   *   *   *   * ------------- *   *   *  ||||||   *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   * ------------- *   *   *   *   *   * ------------- *   *   *  ||||||   *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   * ------------- *   *   *   *   *   * ------------- *   *   *  ||||||   *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   * ------------- *   *   *   *   *   * ------------- *   *   *  ||||||   *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *  ||||||   *   *   * #",0
          db " #*   *   * ||||||*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *  ||||||   *   *   * #",0
          db " #------------------------------------------------------------------------------------------------------------------#",0

endscreen db " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0
		  db " $ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ H a s s a n M U R T A Z A^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^$ ", 0
		  db " $                                                                                                                 $ ", 0
		  db " $                                                                                                                 $ ", 0
		  db " $                                                                                                                 $ ", 0
		  db " $                                                                                                                 $ ", 0
		  db " $                                                                                                                 $ ", 0
		  db " $                   ||||||   |||||  |||    ||| |||||||      ||||||  ||    || ||||||| ||||||                       $ ", 0
		  db " $                  ||       ||   || ||||  |||| ||          ||    || ||    || ||      ||   ||                      $ ", 0
		  db " $                  ||   ||| ||||||| || |||| || |||||       ||    || ||    || |||||   ||||||                       $ ", 0
  		  db " $                  ||    || ||   || ||  ||  || ||          ||    ||  ||  ||  ||      ||   ||                      $ ", 0
		  db " $                   ||||||  ||   || ||      || |||||||      ||||||    ||||   ||||||| ||   ||                      $ ", 0
		  db " $                                                                                                                 $ ", 0
		  db " $                   Name:                                   WITH A SCORE OF:                                      $ ", 0
		  db " $                                                                                                                 $ ", 0
          db " $                                                                                                                 $ ", 0
		  db " $                                                                                                                 $ ", 0
		  db " $                                                 ||||||||\\                                                      $ ", 0
		  db " $                                               ||||||||-||||                                                     $ ", 0
		  db " $                                              |||||||||||                                                        $ ", 0
		  db " $                                             |||||||||                                                           $ ", 0
		  db " $                                              |||||||||||                                                        $ ", 0
		  db " $                                               |||||||||||||                                                     $ ", 0
		  db " $                                                 ||||||||//                                                      $ ", 0
		  db " $                                                                                                                 $ ", 0
		  db " $ ________________________________________________________________________________________________________________$ ", 0
		  db " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0

temp byte ?

strScore BYTE "Your score is: ",0
score dw 0

level db 1
delayghost db 0
delayghost1 db 0
delayghost2 db 0

oldChar db ?

booldirection db 0
boolup db 0
boolup1 db 0
boolright db 0
boolright1 db 0
boolleft db 0
boolcreatefile db 1

nooffruits dw 1000


strLive BYTE "Lives: ",0
live BYTE 3

xPos BYTE 59
yPos BYTE 22

;LEVEL 1 
xgPos BYTE 40
ygPos Byte 11

xgPoslevel1 BYTE 49
ygPoslevel1 BYTE 21


xgPos1 BYTE 29
ygPos1 Byte 14

xgPos2 BYTE 89
ygPos2 Byte 14

xgPos3 BYTE 14
ygPos3 BYTE 5

xgPos4 byte 40
ygPos4 byte 11

oldX byte 0
oldY byte 0

oldX1 byte 0
oldY1 byte 0

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?

beginSound BYTE ".\sounds\pacman_beginning.wav", 0
endSound BYTE ".\sounds\pacman_death.wav", 0
wakaSound BYTE ".\sounds\waka.wav", 0
bigDotSound BYTE ".\sounds\bigdot.wav", 0
cherrySound BYTE ".\sounds\cherry.wav", 0

PlaySoundA PROTO,
pszSound:PTR BYTE, 
hmod:DWORD, 
fdwSound:DWORD

SND_ASY   equ 00000001h
SND_NOWAIT  equ 00002000h 

szFormat db "%d", 0  
coinchar db '*'

.code

     jmp main
  
    ;1st page
    ;=======================1st PAGE EMOJI======================
     Printingemoji proc
            ;Move to the center of the page
            mGotoxy 10,9

            mov  eax,yellow
            call SetTextColor

            mov  edx,OFFSET title9
            call WriteString
            mGotoxy 10,10
            mov  edx,OFFSET title10
            call WriteString
            mGotoxy 10,11
            mov  edx,OFFSET title11
            call WriteString

            mov  eax,yellow
            call SetTextColor
            mGotoxy 10,12
            mov  edx,OFFSET title12
            call WriteString
            mGotoxy 10,13
            mov  edx,OFFSET title13
            call WriteString
            mGotoxy 10,14
            mov  edx,OFFSET title14
            call WriteString

            mov  eax,yellow
            call SetTextColor
            mGotoxy 10,15
            mov  edx,OFFSET title15
            call WriteString
            mGotoxy 10,16
            mov  edx,OFFSET title16
            call WriteString
            mGotoxy 10,17
            mov  edx,OFFSET title17
            call WriteString
            mGotoxy 10,18
        ret 
        Printingemoji ENDP


        ;=========================1st page pacman name----------------

        Prinitingpacmanword proc
         ;Move to the center of the page
            mGotoxy 35,9
           ;Setting white color
            mov  eax,blue
            call SetTextColor
            mov  edx,OFFSET title0
            call WriteString
            mGotoxy 35,10 
		    mov  edx,OFFSET title1
            call WriteString
            mGotoxy 35,11
            mov  edx,OFFSET title2
            call WriteString

           ;Setting yellow color
            mov  eax,yellow
            call SetTextColor
            mGotoxy 35,12
            mov  edx,OFFSET title3
            call WriteString
            mGotoxy 35,13
            mov  edx,OFFSET title4
            call WriteString
            mGotoxy 35,14
            mov  edx,OFFSET title5
            call WriteString

           ;Setting blue color
            mov  eax,blue
            call SetTextColor
            mGotoxy 35,15
            mov  edx,OFFSET title6
            call WriteString
            mGotoxy 35,16
            mov  edx,OFFSET title7
            call WriteString
            mGotoxy 35,17
            mov  edx,OFFSET title8
            call WriteString
        ret
        Prinitingpacmanword ENDP

   GETDATAINBUFFER PROC

	  mov edx , offset filename
	  call OpenInputfile
	  mov filehandle, eax
	  
	  mov  eax,fileHandle
	  mov  edx, OFFSET buffer
	  mov  ecx, BUFFER_SIZE
	  call ReadFromFile
	  mov buffer[eax], 0
      
	  mov  eax,fileHandle
	  call CloseFile

      ret
    GETDATAINBUFFER ENDP

    ;========FIRST PAGE MAIN FUNCTION-===========
    firstpage proc

       call Clrscr

   ;(PACMAN Title page)
       ;0-------TO print emoji
       call Printingemoji
       ;-------Printing pacman word
       call Prinitingpacmanword
       ;(PACMAN First page)


       call GETDATAINBUFFER
       
        
       ;-----Reading user name---------
       call readname
       ;======Waiting for enter to be pressed=========
       call waitingentertobepressed
       call clrscr

    ret 
   
  firstpage ENDP
  ;----------------------------------------

  ;============PRINTING PACMAN WORD FOR MENU=========
   Pacmanwordmenu proc
   ;Move to the center of the page
            mGotoxy 22,2
           ;Setting blue color
            mov  eax,blue
            call SetTextColor
            mov  edx,OFFSET title0
            call WriteString
            mGotoxy 22,3
		    mov  edx,OFFSET title1
            call WriteString
            mGotoxy 22,4
            mov  edx,OFFSET title2
            call WriteString

           ;Setting white color
            mov  eax,white
            call SetTextColor
            mGotoxy 22,5
            mov  edx,OFFSET title3
            call WriteString
            mGotoxy 22,6
            mov  edx,OFFSET title4
            call WriteString
            mGotoxy 22,7
            mov  edx,OFFSET title5
            call WriteString

           ;Setting blue color
            mov  eax,blue
            call SetTextColor
            mGotoxy 22,8
            mov  edx,OFFSET title6
            call WriteString
            mGotoxy 22,9
            mov  edx,OFFSET title7
            call WriteString
            mGotoxy 22,10
            mov  edx,OFFSET title8
            call WriteString
        ret
        Pacmanwordmenu endp

      ;===============MENU writing===============

       Writemenu proc

         ;Move to the center of the page
             mGotoxy 45,15
        
             mov  eax,blue+(white*16)
             call SetTextColor
        
             mov  edx,OFFSET mtitle0
             call WriteString
             mGotoxy 45,16
             mov  edx,OFFSET mtitle1
             call WriteString
             mGotoxy 45,17
             mov  edx,OFFSET mtitle2
             call WriteString
        
             mov  eax,white
             call SetTextColor
             mGotoxy 45,18
             mov  edx,OFFSET mtitle3
             call WriteString
             mGotoxy 45,19
             mov  edx,OFFSET mtitle4
             call WriteString
        
             mGotoxy 45,20
             mov  edx,OFFSET mtitle5
             call WriteString
             mGotoxy 45,21
             mov  edx,OFFSET mtitle6
             call WriteString
             mGotoxy 45,22
             mov  edx,OFFSET mtitle7
             call WriteString

             mov  eax,white
             call SetTextColor
             mGotoxy 45,23
             mov  edx,OFFSET mtitle8
             call WriteString
             ;---------RESET color
             mov  eax,0
             call SetTextColor
        ret
        Writemenu endp
    ;=============MENU==================
      Menu Proc
        call Clrscr
       
        ;Printing pacman word
        call Pacmanwordmenu
      
        ;-------Separating line-----------------
             mov  eax,blue
             call SetTextColor
             mGotoxy 22,12
             mov  edx,OFFSET strline
             call WriteString
      
        ;WRITING MENU=====
           call writemenu
             
        ;======Waiting for input to be pressed=========
        call checkmenuinput
        call clrscr
        
        ret
      MENU ENDP
      
     ;===MENU INPUT============
      checkmenuinput PROC
        mov eax, 0
        call ReadChar
        cmp al,'1'
        je Restartafterp
        cmp al,'2'
        je highscoredisplay
        cmp al,'3'
        je instructionpage
        cmp al,'4'
        je exitGame
        call checkmenuinput
      ret
      checkmenuinput ENDP

     ;============High score display=============
     highscoredisplay proc

            call clrscr
        
            push eax
            mov  eax,blue
            call SetTextColor
            mov dl,0
            mov dh,0
            call gotoxy
            mov edx,offset strname
            call writestring

            pop eax

        	;reading
            
            mov dl,0
            mov dh,1
            call gotoxy
            mov  edx, offset buffer
            mov  eax,magenta
            call SetTextColor
            mov eax,[edx]
            call writestring
        
        	
                call escapebutton
                ret
highscoredisplay endp


     ;===========INSTRUCTION PAGE PACMAN===========
     Instructionpacman proc
      
       ;Move to the center of the page
            mGotoxy 22,2
           ;Setting Magenta color
            mov  eax,Magenta
            call SetTextColor
            mov  edx,OFFSET title0
            call WriteString
            mGotoxy 22,3
		    mov  edx,OFFSET title1
            call WriteString
            mGotoxy 22,4
            mov  edx,OFFSET title2
            call WriteString

           ;Setting white color
            mov  eax,white
            call SetTextColor
            mGotoxy 22,5
            mov  edx,OFFSET title3
            call WriteString
            mGotoxy 22,6
            mov  edx,OFFSET title4
            call WriteString
            mGotoxy 22,7
            mov  edx,OFFSET title5
            call WriteString

           ;Setting blue color
            mov  eax,blue
            call SetTextColor
            mGotoxy 22,8
            mov  edx,OFFSET title6
            call WriteString
            mGotoxy 22,9
            mov  edx,OFFSET title7
            call WriteString
            mGotoxy 22,10
            mov  edx,OFFSET title8
            call WriteString
        ret
        Instructionpacman endp

        ;=====================INSTRUCTIONS============================
         Allinstruction proc
            mov  eax,cyan
           call SetTextColor
           mGotoxy 45,15
           mov  edx,OFFSET ins0
           call WriteString
           mGotoxy 45,16
           mov  edx,OFFSET ins1
           call WriteString
           mGotoxy 45,17
           mov  edx,OFFSET ins2
           call WriteString
           mGotoxy 45,18
           mov  edx,OFFSET ins3
           call WriteString
           mGotoxy 45,19
           mov  edx,OFFSET ins4
           call WriteString
           mGotoxy 45,20
           mov  edx,OFFSET ins5
           call WriteString
           mGotoxy 45,21
           mov  edx,OFFSET ins6
           call WriteString
           mGotoxy 45,22
           mov  edx,OFFSET ins7
           call WriteString
           mGotoxy 45,23
           mov  edx,OFFSET ins8
           call WriteString
          
           mov  eax,0
           call SetTextColor

           ret
        Allinstruction Endp
      ;=====INSTRUCTION PAGE========
       Instructionpage PROC
         call Clrscr
         
           ;Printing pacman word
             call Instructionpacman
               
           ;Separating line-----------------
                mov  eax,red+(yellow*16)
                call SetTextColor
                mGotoxy 22,12
                mov  edx,OFFSET strline
                call WriteString
      
           ;Instruction---------------
             call allinstruction
          ;=====Waiting for escape button to be pressed===========
             call escapebutton
       ret
       Instructionpage ENDP

   ;=FOr escape press function========
    escapebutton PROC
      mov eax, 0
      call ReadChar
      cmp al,1Bh ;checking input is equal to the escape or not
      jne escapebutton
      ;------Calling menu after the instruction tab------
      cmp ecx,01
      je  pausegame
      call menu
    ret
    escapebutton ENDP

  ;=FOr enter press function========
     waitingentertobepressed proc

      mov eax, 0
      call ReadChar
      cmp al,13 ;checking input is equal to the enter or not
      jne waitingentertobepressed
      
     ret 
     waitingentertobepressed ENDP

   ;Reading user name====

     readname Proc


     mov eax,yellow
     call settextcolor
     mGotoxy 0,19
         
     mov edx,offset nameprompt
     call writestring

     mov edx,offset namestr
     mov ecx,lengthof namestr
     call readstring
     
     mGotoxy 0,20
     mov edx,offset fpageprompt
     call writestring

    ret
    readname ENDP
   ;--------------------

    drawground PROC
    ; draw ground at (0,29):

      ;DRAWING THE OUTER BOUNDARY UPPER SIDE
      mov eax,blue ;(black * 16)
      call SetTextColor
      mov dl,0
      mov dh,29
      call Gotoxy
      mov edx,OFFSET ground
      call WriteString
      
      ;DRAWING THE OUTER BOUNDARY LOWER SIDE
      mov dl,0
      mov dh,1
      call Gotoxy
      mov edx,OFFSET ground
      call WriteString
      
      mov ecx,27
      mov dh,2
      l1:
      mov dl,0
      call Gotoxy
      mov edx,OFFSET ground1
      call WriteString
      ;inc dh
      loop l1
      
      
      mov ecx,27
      mov dh,2
      mov temp,dh
      l2:
      mov dh,temp
      mov dl,119
      call Gotoxy
      mov edx,OFFSET ground2
      call WriteString
      inc temp
      loop l2
      ret
    drawground endp

    pausegame PROC
      pusha
      pushfd
       call clrscr
       ;Printing pacman word
           ;Move to the center of the page
            mGotoxy 22,2
           ;Setting Magenta color
            mov  eax,Magenta
            call SetTextColor
            mov  edx,OFFSET title0
            call WriteString
            mGotoxy 22,3
		    mov  edx,OFFSET title1
            call WriteString
            mGotoxy 22,4
            mov  edx,OFFSET title2
            call WriteString

           ;Setting white color
            mov  eax,white
            call SetTextColor
            mGotoxy 22,5
            mov  edx,OFFSET title3
            call WriteString
            mGotoxy 22,6
            mov  edx,OFFSET title4
            call WriteString
            mGotoxy 22,7
            mov  edx,OFFSET title5
            call WriteString

           ;Setting magenta color
            mov  eax,magenta
            call SetTextColor
            mGotoxy 22,8
            mov  edx,OFFSET title6
            call WriteString
            mGotoxy 22,9
            mov  edx,OFFSET title7
            call WriteString
            mGotoxy 22,10
            mov  edx,OFFSET title8
            call WriteString
 
       ;Separating line-----------------
            mov  eax,white+(magenta*16)
            call SetTextColor
            mGotoxy 22,12
            mov  edx,OFFSET strline
            call WriteString

        ;WRITING PAUSESCREEN=====
           ;Move to the center of the page
             mGotoxy 45,15
        
             mov  eax,magenta+(white*16)
             call SetTextColor
        
             mov  edx,OFFSET mtitle0
             call WriteString
             mGotoxy 45,16
             mov  edx,OFFSET mptitle
             call WriteString
             mGotoxy 45,17
             mov  edx,OFFSET mtitle2
             call WriteString
        
             mov  eax,white
             call SetTextColor
             mGotoxy 45,18
             mov  edx,OFFSET mptitle0
             call WriteString
             mGotoxy 45,19
             mov  edx,OFFSET mptitle1
             call WriteString
        
             mGotoxy 45,20
             mov  edx,OFFSET mtitle5
             call WriteString
             mGotoxy 45,21
             mov  edx,OFFSET mtitle6
             call WriteString
             mGotoxy 45,22
             mov  edx,OFFSET mtitle7
             call WriteString

             mov  eax,white
             call SetTextColor
             mGotoxy 45,23
             mov  edx,OFFSET mtitle8
             call WriteString
             ;---------RESET color
             mov  eax,0
             call SetTextColor
             
             call pausescreeinput 
             popfd
             popa
             call clrscr
             call drawground
             call LEVELDRAWcopy
             call DrawPlayer
             call DrawCoin
             call Startafterp

     ret
     pausegame endp

   ;====PAUSE SCREEN INPUT======
     pausescreeinput proc
     mov eax, 0
     call ReadChar
     cmp al,'1'
     je exitp
     cmp al,'2'
     je Restartafterp
     cmp al,'3'
     je inputp
     cmp al,'4'
     je exitGame
     call pausescreeinput
     
     jmp exitp
     inputp:
      push ecx
      mov ecx,01
      call instructionpage
      pop ecx

    exitp:
    
     ret
    pausescreeinput endp

    ;=======================LEVEL 1 DRaw=========================
     level1draw proc
          
          mov al,59
          mov xPos,al
          
          mov al,23
          mov yPos,al

         mov ecx,27
         mov esi,offset maplevel1
         mov edi,offset maplevel1c
         mov dl,1
         mov dh,1
         outerlevelloop:
             push ecx
             mov dl,1
             inc dh
             call gotoxy
             mov ecx,117
         levelloop:
               mov  eax,brown
               call SetTextColor
               mov eax,0
               mov eax,[esi]
               mov [edi],eax
               call writechar
               inc esi
               inc edi
         loop levelloop
               inc esi
               inc edi
               pop ecx
         loop outerlevelloop

        ret
        level1draw endp
    ;=======================LEVEL 2 DRaw=========================
     level2draw proc
         
         call clrscr

          call drawground


          mov eax,100
          call delay

        
          mov al,59
          mov xPos,al
          
          mov al,27
          mov yPos,al

          mov ecx,27
          mov esi,offset maplevel2
          mov edi,offset maplevel1c
          mov dl,1
          mov dh,1
          outerlevelloop:
             push ecx
             mov dl,1
             inc dh
             call gotoxy
             mov ecx,117
          levelloop:
               mov  eax,cyan
               call SetTextColor
               mov eax,0
               mov eax,[esi]
               mov [edi],eax
               call writechar
               inc esi
               inc edi
         loop levelloop
               inc esi
               inc edi
               pop ecx
         loop outerlevelloop

         call Drawplayer
         call CreateRandomCoin
         call DrawCoin

        ret
        level2draw endp
      ;===============LEVEL 3 DRAW=================
        level3draw PROC

         call clrscr

         call drawground

        
          mov eax,100
          call delay

         
          mov al,56
          mov xPos,al
          
          mov al,27
          mov yPos,al

          mov ecx,27
          mov esi,offset maplevel3
          mov edi,offset maplevel1c
          mov dl,1
          mov dh,1
          outerlevelloop:
             push ecx
             mov dl,1
             inc dh
             call gotoxy
             mov ecx,117
          levelloop:
               mov  eax,magenta
               call SetTextColor
               mov eax,0
               mov eax,[esi]
               mov [edi],eax
               call writechar
               inc esi
               inc edi
         loop levelloop
               inc esi
               inc edi
               pop ecx
         loop outerlevelloop

         call Drawplayer
         call CreateRandomCoin
         call DrawCoin

        ret
        level3draw endp

    ;======================LEVEL DRAW============================
    LEVELDRAW PROC
     
     mov al,level
     cmp al,1
     je level1
     cmp al,2
     je level2
     cmp al,3
     je level3


     jmp exitp

     level1:
      call level1draw

      jmp exitp

     level2:
      call level2draw

      jmp exitp

      level3:
      call level3draw
        
       exitp:
    ret 
    LEVELDRAW ENDP

    ;==================LEVEL 1 DRAW COPy=================
    leveldrawcopy1 PROC

         mov ecx,27
          mov esi,offset maplevel1c
          mov dl,1
          mov dh,1
          outerlevelloop:
              push ecx
              mov dl,1
              inc dh
              call gotoxy
              mov ecx,117
          levelloop:
                mov  eax,brown
                call SetTextColor
                mov eax,0
                mov eax,[esi]
                call writechar
                inc esi
          loop levelloop
                inc esi
                pop ecx
          loop outerlevelloop

           call DrawCoin
    ret
    leveldrawcopy1 ENDP

    leveldrawcopy2 PROC
         mov ecx,27
          mov esi,offset maplevel1c
          mov dl,1
          mov dh,1
          outerlevelloop:
              push ecx
              mov dl,1
              inc dh
              call gotoxy
              mov ecx,117
          levelloop:
                mov  eax,cyan
                call SetTextColor
                mov eax,0
                mov eax,[esi]
                call writechar
                inc esi
          loop levelloop
                inc esi
                pop ecx
          loop outerlevelloop

           call DrawCoin
    ret
    leveldrawcopy2 ENDP

    leveldrawcopy3 PROC
         mov ecx,27
          mov esi,offset maplevel1c
          mov dl,1
          mov dh,1
          outerlevelloop:
              push ecx
              mov dl,1
              inc dh
              call gotoxy
              mov ecx,117
          levelloop:
                mov  eax,magenta
                call SetTextColor
                mov eax,0
                mov eax,[esi]
                call writechar
                inc esi
          loop levelloop
                inc esi
                pop ecx
          loop outerlevelloop

          call DrawCoin
    ret
    leveldrawcopy3 ENDP
    ;========================LEVEL DRAW COPY===========
     LEVELDRAWcopy PROC
     
          mov al,level
          cmp al,1
          je level1
          cmp al,2
          je level2
          cmp al,3
          je level3
         
         
          jmp exitp

          level1:

          call leveldrawcopy1
           jmp exitp

          level2:
          call leveldrawcopy2
          call DrawPlayer
          jmp exitp

          level3:
          call leveldrawcopy3
          call DrawPlayer
    
    exitp:  
    ret 
    LEVELDRAWcopy ENDP
    ;==========CHECKING  ++++++++ CHARACTER ON THAT POSITION+++++++++++++++++++
     checkcharonpos proc
      
       mov esi, OFFSET maplevel1c
	   push ebx
	   mov ebx,lengthof maplevel1c
	   mul ebx
       pop ebx
	   add eax,ebx 
       add esi,eax
       add edi,eax
	   mov al,[esi]
       cmp al,'*'
       jne back
       push ebx
       mov bl,' '
       mov [esi],bl
       pop ebx
       back:
    ret
    checkcharonpos ENDP

    checkcharonposg proc
      
       mov esi, OFFSET maplevel1c
	   push ebx
	   mov ebx,lengthof maplevel1c
	   mul ebx
       pop ebx
	   add eax,ebx 
       add esi,eax
       add edi,eax
	   mov al,[esi]
       
    ret
    checkcharonposg ENDP

    checkcharonposcoin PROC

       mov eax,0
       mov al,yCoinPos
       sub al,2
       mov esi, OFFSET maplevel1c
       mov ebx,0
       mov bl,xCoinPos
	   push ebx
	   mov ebx,lengthof maplevel1c
	   mul ebx
       pop ebx 
	   add eax,ebx 
       add esi,eax
	   mov al,[esi]
       
       ret
    checkcharonposcoin ENDP

    ;==========CHECKING CHARACTER ON THAT POSITION ""GHOST""+++++++++++++++++++
      checkupcharg Proc
          mov eax,0 ; Moving eax zero
          push ecx  ; pushing ecx to stack if it already had value
          mov ecx,0  
          mov cl,ygPos   ; moving yPos to cl
          sub cl,3      ; as my array start after 2 index of console
          mov al,cl                          ; moving ypos to the eax ,eax=ypos
          pop ecx       
          push ebx    
          mov ebx,0
          mov bl,xgPos   ;moving xpos of pacman
          sub bl,1       ;as array start after two index of the console
          call checkcharonposg           ; checking can we move on that index or not?
          pop ebx
        ret 
        checkupcharg endp

       ;===================MOVE DOWN CHECK=========================
       checkdowncharg Proc
          mov eax,0 ; Moving eax zero
          push ecx  ; pushing ecx to stack if it already had value
          mov ecx,0  
          mov cl,ygPos   ; moving yPos to cl
          sub cl,1      ; as my array start after 2 index of console
          mov al,cl                          ; moving ypos to the eax ,eax=ypos
          pop ecx       
          push ebx    
          mov ebx,0
          mov bl,xgPos    ;moving xpos of pacman
          sub bl,1
          call checkcharonposg         ; checking can we move on that index or not?
          pop ebx
        ret 
        checkdowncharg endp
    ;===================MOVE left CHECK=========================
       checkleftcharg Proc
        mov eax,0 ; Moving eax zero
        push ecx  ; pushing ecx to stack if it already had value
        mov ecx,0  
        mov cl,ygPos   ; moving yPos to cl
        sub cl,2      ; as my array start after 2 index of console
        mov al,cl                          ; moving ypos to the eax ,eax=ypos
        pop ecx       
        push ebx    
        mov ebx,0
        mov bl,xgPos    ;moving xpos of pacman
        sub bl,2       ;as array start after two index of the console
        call checkcharonposg            ; checking can we move on that index or not?
        pop ebx

         ret
        checkleftcharg endp
      ;===================MOVE right CHECK=========================
       checkrightcharg Proc
          mov eax,0 ; Moving eax zero
          push ecx  ; pushing ecx to stack if it already had value
          mov ecx,0  
          mov cl,ygPos   ; moving yPos to cl
          sub cl,2      ; as my array start after 2 index of console
          mov al,cl                          ; moving ypos to the eax ,eax=ypos
          pop ecx       
          push ebx    
          mov ebx,0
          mov bl,xgPos    ;moving xpos of pacman
        call checkcharonposg          ; checking can we move on that index or not?
        pop ebx
        ret
        checkrightcharg endp

   ;==========================MOVE UP CHECK PACMAN=========================
       checkupchar Proc
          mov eax,0 ; Moving eax zero
          push ecx  ; pushing ecx to stack if it already had value
          mov ecx,0  
          mov cl,yPos   ; moving yPos to cl
          sub cl,3      ; as my array start after 2 index of console
          mov al,cl                          ; moving ypos to the eax ,eax=ypos
          pop ecx       
          push ebx    
          mov ebx,0
          mov bl,xPos    ;moving xpos of pacman
          sub bl,1       ;as array start after two index of the console
          call checkcharonposg           ; checking can we move on that index or not?
          pop ebx
        ret 
        checkupchar endp

       ;===================MOVE DOWN CHECK=========================
       checkdownchar Proc
          mov eax,0 ; Moving eax zero
          push ecx  ; pushing ecx to stack if it already had value
          mov ecx,0  
          mov cl,yPos   ; moving yPos to cl
          sub cl,1      ; as my array start after 2 index of console
          mov al,cl                          ; moving ypos to the eax ,eax=ypos
          pop ecx       
          push ebx    
          mov ebx,0
          mov bl,xPos    ;moving xpos of pacman
          sub bl,1
          call checkcharonposg         ; checking can we move on that index or not?
          pop ebx
        ret 
        checkdownchar endp
    ;===================MOVE left CHECK=========================
       checkleftchar Proc
        mov eax,0 ; Moving eax zero
        push ecx  ; pushing ecx to stack if it already had value
        mov ecx,0  
        mov cl,yPos   ; moving yPos to cl
        sub cl,2      ; as my array start after 2 index of console
        mov al,cl                          ; moving ypos to the eax ,eax=ypos
        pop ecx       
        push ebx    
        mov ebx,0
        mov bl,xPos    ;moving xpos of pacman
        sub bl,2       ;as array start after two index of the console
        call checkcharonpos            ; checking can we move on that index or not?
        pop ebx

         ret
        checkleftchar endp
      ;===================MOVE right CHECK=========================
       checkrightchar Proc
          mov eax,0 ; Moving eax zero
          push ecx  ; pushing ecx to stack if it already had value
          mov ecx,0  
          mov cl,yPos   ; moving yPos to cl
          sub cl,2      ; as my array start after 2 index of console
          mov al,cl                          ; moving ypos to the eax ,eax=ypos
          pop ecx       
          push ebx    
          mov ebx,0
          mov bl,xPos    ;moving xpos of pacman
        call checkcharonpos           ; checking can we move on that index or not?
        pop ebx
        ret
        checkrightchar endp
  ;=================INCREMENTING SCORE=====================================
  checkscoreinc PROC
    cmp al, '*' ; If the character is '*', increment the score
    jne backtoloop
    mov bl,' '
    mov [esi],bl
    add score,2
    dec nooffruits

    backtoloop:
        ret
   checkscoreinc ENDP



   ;============DRAW SCORE=================================
    drawscore proc
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov ax,score
        call WriteDec
        
     ret
     drawscore endp
    ;============DRAW Lives=================================

     drawlives proc
        mGotoxy 110,0
        mov edx,OFFSET strLive
        call WriteString
        mov al,Live
        call WriteDec
     ret
     drawlives endp
    
    ;======================MOVING Up=======================
    movingup proc
          call checkupchar
          cmp al,'#'
          je nomove 
          cmp al,'-'
          je nomove 
          cmp al,'|'
          je nomove
          cmp al,'/'
          je nomove
          cmp al,'\'
          je nomove
          call checkscoreinc    ;calling to check if score is to be incremented or not
         ;allow player to jump:
         mov ecx,1
         jumpLoop:
            call UpdatePlayer
            dec yPos
            call DrawPlayer
         loop jumpLoop
              invoke PlaySoundA, ADDR wakaSound, NULL, SND_ASY or SND_NOWAIT
        nomove:
    ret
    movingup endp
     ;======================MOVING DOWN=======================
     movingdown proc
          call checkdownchar
          cmp al,'#'
          je nomove 
          cmp al,'-'
          je nomove 
          cmp al,'|'
          je nomove
          cmp al,'/'
          je nomove
          cmp al,'\'
          je nomove
          call checkscoreinc ;calling to check if score is to be incremented or not
          call UpdatePlayer
          inc yPos
          call DrawPlayer
          invoke PlaySoundA, ADDR wakaSound, NULL, SND_ASY or SND_NOWAIT
     nomove:
     ret
    movingdown endp
    ;======================MOVING Left=======================
     movingleft proc
        call checkleftchar
        cmp al,'#'
        je nomove 
        cmp al,'-'
        je nomove 
        cmp al,'|'
        je nomove
        cmp al,'/'
        je nomove
        cmp al,'\'
        je nomove
        call checkscoreinc ;calling to check if score is to be incremented or not
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        invoke PlaySoundA, ADDR wakaSound, NULL, SND_ASY or SND_NOWAIT

    nomove:
     ret
    movingleft endp
     ;======================MOVING Right=======================
     movingright proc
        call checkrightchar
        cmp al,'#'
        je nomove 
        cmp al,'-'
        je nomove 
        cmp al,'|'
        je nomove
        cmp al,'/'
        je nomove
        cmp al,'\'
        je nomove
        ;calling to check if score is to be incremented or not
        call checkscoreinc
        
        call UpdatePlayer
        inc xPos
        call DrawPlayer
            invoke PlaySoundA, ADDR wakaSound, NULL, SND_ASY or SND_NOWAIT

     nomove:
       ret
     movingright endp
    
    ;=====================Get char at the current position======================
    GetCharAtPos Proc
       mov eax,0 ; Moving eax zero
       push ecx  ; pushing ecx to stack if it already had value
       mov ecx,0  
       mov cl,oldY   ; moving yPos to cl
       sub cl,2      ; as my array start after 2 index of console
       mov al,cl                          ; moving ypos to the eax ,eax=ypos
       pop ecx       
       push ebx    
       mov ebx,0
       mov bl,oldX    ;moving xpos of pacman
       sub bl,1
       ;The logic for moving to that index of array
       mov esi, OFFSET maplevel1c
	   push ebx
	   mov ebx,lengthof maplevel1c
	   mul ebx
       pop ebx
	   add eax,ebx 
       add esi,eax
	   mov al, [esi]
       pop ebx
    ret
    GetCharAtPos ENDP
    ;===============CHECK ghost collision===========
      checkcollisionghost proc
      
          push eax 
      
          cmp level, 1
          jne checkLevel2
      
          call checkCollisionLevel1
          jmp postCollisionCheck
      
          checkLevel2:
          cmp level, 2
          jne checklevel3
          call checkCollisionLevel2
          jmp postCollisionCheck

          checklevel3: 
          call checkCollisionLevel2
          call checkCollisionLevel3

      postCollisionCheck:
          pop eax   
          ret
      checkcollisionghost endp
      
     ;===========FOOD AND GHOST COLLISIO====================
      foodandghostcoll proc

          mov al, xCoinPos
          mov ah, xgPos
          cmp al, ah
          jne checkghost1
      
          mov al, yCoinPos
          mov ah, ygPos
          cmp al, ah
          je handlefoodandghost
          jmp exitp

        checkghost1:
          mov al, xCoinPos
          mov ah, xgPoslevel1
          cmp al, ah
          jne checkghost2
      
          mov al, yCoinPos
          mov ah, ygPoslevel1
          cmp al, ah
          je handlefoodandghost
          jmp exitp

         checkghost2:
            mov al, xCoinPos
            mov ah, xgPos1
            cmp al, ah
            jne checkghost3
           
            mov al, yCoinPos
            mov ah, ygPos1
            cmp al, ah
            je handlefoodandghost
            jmp exitp

         checkghost3:
            mov al, xCoinPos
            mov ah, xgPos2
            cmp al, ah
            jne exitp
           
            mov al, yCoinPos
            mov ah, ygPos2
            cmp al, ah
            je handlefoodandghost

      exitp:
           ret
      foodandghostcoll ENDP

      handlefoodandghost proc

            mov eax,red+(white*16)
            call SetTextColor
            mov dl,xCoinPos
            mov dh,yCoinPos
            call Gotoxy
            mov al,"@"
            call WriteChar

        ret
      handlefoodandghost endp

      ;-------------Checking ghost one collision in the level-------------
      checkCollisionLevel1 proc

          mov al, xgPos
          mov ah, xPos
          cmp al, ah
          jne nextGhostLevel1
      
          mov al, ygPos
          mov ah, yPos
          cmp al, ah
          je handleCollision
      
       nextGhostLevel1:
          mov al, xgPoslevel1
          mov ah, xPos
          cmp al, ah
          jne exitCollisionLevel1
      
          mov al, ygPoslevel1
          mov ah, yPos
          cmp al, ah
          je handleCollision
      
      exitCollisionLevel1:
          ret
      
      checkCollisionLevel1 endp
      
      checkCollisionLevel2 proc

          mov al, xgPos
          mov ah, xPos
          cmp al, ah
          jne nextGhostLevel1
      
          mov al, ygPos
          mov ah, yPos
          cmp al, ah
          je handleCollision

        nextGhostLevel1:

          mov al, xgPos1
          mov ah, xPos
          cmp al, ah
          jne nextGhostLevel2
      
          mov al, ygPos1
          mov ah, yPos
          cmp al, ah
          je handleCollision
      
      nextGhostLevel2:
          mov al, xgPos2
          mov ah, xPos
          cmp al, ah
          jne exitCollisionLevel2
      
          mov al, ygPos2
          mov ah, yPos
          cmp al, ah
          je handleCollision
      
      exitCollisionLevel2:
          ret
      
      checkCollisionLevel2 endp

      checkCollisionLevel3 proc

          mov al, xgPos3
          mov ah, xPos
          cmp al, ah
          jne next
      
          mov al, ygPos3
          mov ah, yPos
          cmp al, ah
          je handleCollision
         
          jmp exitp

          next:
          mov al, xgPos4
          mov ah, xPos
          cmp al, ah
          jne exitp
      
          mov al, ygPos4
          mov ah, yPos
          cmp al, ah
          je handleCollision

        exitp:
      ret
      checkCollisionLevel3 endp
      
      ;==============DECREMENTING SCORE AFTER THE COLLISION===============
      handleCollision proc

          push eax
          cmp score,5
          jl nodecrement
          sub score, 5
          nodecrement:
          sub live,1
          pop eax

          mov al,59
          mov xPos,al
          
          mov al,23
          mov yPos,al

          call drawplayer

         ret
      
      handleCollision endp
      

     
     ;================Check the code=============
       GetCharAtPos1 PROC
          mov eax,0 ; Moving eax zero
          push ecx  ; pushing ecx to stack if it already had value
          mov ecx,0  
          mov cl,oldY   ; moving yPos to cl
          sub cl,2      ; as my array start after 2 index of console
          mov al,cl                          ; moving ypos to the eax ,eax=ypos
          pop ecx       
          push ebx    
          mov ebx,0
          mov bl,oldX    ;moving xpos of pacman
          sub bl,1
          ;The logic for moving to that index of array
          mov esi, OFFSET maplevel1c
          push ebx
          mov ebx,lengthof maplevel1c
          mul ebx
          pop ebx
          add eax,ebx 
          add esi,eax
          mov al, [esi]
          pop ebx
          ret
       GetCharAtPos1 ENDP
     ;================Check no of Fruits==========
      Checkingnofruit PROC
        mov cx,nooffruits
        cmp cx,0
        jne exitp
        inc level
        cmp level,4
        je exitgame
        call LEVELDRAW
        mov cx,50
        mov nooffruits,cx
        exitp:
      ret
      Checkingnofruit ENDP

        ;===========TELEPORTATIOn===========
           teleportation PROC
               mov al, xPos
               cmp al, 3
               je checkYPos
               jmp second
           
           checkYPos:
               mov al, yPos
               mov oldY, al
               cmp al, 5
               je moveToStart
           
           second:
               mov al, xPos
               cmp al, 97
               je checkYPos1
               jmp exitP
           
           checkYPos1:
               mov al, yPos
               mov oldY, al
               cmp al, 27
               je moveToStart1
           
               jmp exitp

           moveToStart:
               mov al, xPos
               mov oldX, al
               mov al, yPos
               mov oldY, al
               mov xPos, 59
               mov yPos, 27
           
           makingChar:
               call GetCharAtPos
               mov oldchar, al
               mgotoxy 3, 5
               mov al, oldchar
               call writechar
               call DrawPlayer
           
               jmp exitP  ; Jump to the exit point
           
           moveToStart1:
               mov al, xPos
               mov oldX, al
               mov al, yPos
               mov oldY, al
               mov xPos, 10
               mov yPos, 27
           
               call GetCharAtPos
               mov oldchar, al
               mgotoxy 97, 27
               mov al, oldchar
               call writechar
               call DrawPlayer
           
           exitP:
               ret
           teleportation ENDP

        ;=====================CONEVRT LOOP==============
        convertloop proc

            convert_loop:
             xor edx, edx            ; Clear EDX for the DIV instruction
             div ebx                 ; EDX:EAX / 10, result in EAX, remainder in EDX
             add dl, '0'             ; Convert remainder to ASCII
             dec esi
             mov [esi], dl           ; Store the digit
             test eax, eax           ; Check if there are more digits
             jnz convert_loop

        ret
        convertloop endp
        ;===================Wrap around================
           wraparound PROC
               mov al, xPos
               cmp al, 1
               je checkYPos
               jmp second
           
           checkYPos:
               mov al, yPos
               mov oldY, al
               cmp al, 12
               je moveToStart
               
           second:
               mov al, xPos
               cmp al, 24
               je checkYPos1

               jmp exitP
           
           checkYPos1:
               mov al, yPos
               mov oldY, al
               cmp al, 28
               je moveToStart1
      
               jmp exitp

           moveToStart:
               mov al, xPos
               mov oldX, al
               mov al, yPos
               mov oldY, al
               mov xPos, 118
               mov yPos, 20
           
           makingChar:
               call GetCharAtPos
               mov oldchar, al
               mgotoxy 1, 12
               mov al, oldchar
               call writechar
               call DrawPlayer
           
               jmp exitP  ; Jump to the exit point
           
           moveToStart1:
               mov al, xPos
               mov oldX, al
               mov al, yPos
               mov oldY, al
               mov xPos, 110
               mov yPos, 3
           
               call GetCharAtPos
               mov oldchar, al
               mgotoxy 24, 28
               mov al, oldchar
               call writechar
               call DrawPlayer
           
           exitP:
               ret
           wraparound ENDP
           
        ;===============DRAWING GHOST===========
            drawingghost proc
                cmp level, 1
                jne ghostlevel2
            
                mov al, delayghost
                cmp al, 30
                jne noghostmove
            
                call Drawghostlevel1
                call Drawghostlevel12
            
                xor al, al  ; Equivalent to mov al, 0
                mov delayghost, al
            
            noghostmove:
                inc delayghost
                jmp nextgame
            
            ghostlevel2:
                cmp level, 2
                jne ghostlevel3
            
                mov al, delayghost1
                cmp al, 30
                jne noghostmove1
            
                call Drawghostlevel2
                call Drawghostlevel21
                call Drawghostlevel22
            
                xor al, al
                mov delayghost1, al
            
            noghostmove1:
                inc delayghost1
                jmp nextgame
            
            ghostlevel3:
                call teleportation
                cmp level, 3
                jne increment
            
                mov al, delayghost2
                cmp al, 30
                jne increment
            
                call Drawghostlevel3
                call Drawghostlevel31
                call Drawghostlevel21
                call Drawghostlevel22
            
                xor al, al
                mov delayghost2, al
            
            increment:
                inc delayghost2
            
            nextgame:
                ret
            drawingghost endp
            
main PROC
     
     ;--------Calling the firstpage of the game only i will call this when game open first time---------
         call firstpage
     ;--------Calling the menu--------------------------
         call Menu
     
     ;-----------Game start after the pause--------------

     Restartafterp proc
      
       invoke PlaySoundA, ADDR beginSound, NULL, SND_ASY or SND_NOWAIT


       mov ax,0
       mov score,ax
          
       mov level,1

       mov al,3
       mov live,al

       mov cx,50
       mov nooffruits,cx

    ;--------Calling level draw------------------------
      call LEVELDRAW
    

     Startafterp proc

    
     ;--------Calling the ground------------------------
      call drawground
     
     ;-------Calling to draw level one ground-----------
      call DrawPlayer
      
     
       
         
      call Randomize
  
      gameLoop:

        ;getting points for fruits:
         mov bl,xPos
         cmp bl,xCoinPos
         jne notCollecting
         mov bl,yPos
         cmp bl,yCoinPos
         jne notCollecting
         invoke PlaySoundA, ADDR cherrySound, NULL, SND_ASY or SND_NOWAIT
         ; player is intersecting coin:
         mov cx,score
         add cx,5
         mov score,cx
        

         call CreateRandomCoin
         call DrawCoin
         
         notCollecting:

         mov eax,white (black * 16)
         call SetTextColor

        ;--Calling function to draw the scores
         call drawscore
        ;--Calling function to draw the lives
         call drawlives

        ;=============COmparing lifes========
         mov al,live
         cmp al,0
         je exitGame

        ;=------------DRAWING GHOST----------
          call drawingghost
        ;-------------CHECK THE FRUITS-----------------
         call checkingnofruit
        ;---CHeck the collision of the ghost and the pacman------------------
         call checkcollisionghost
         ;call foodandghostcoll

        ; get user key input:
        call Readkey
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar,"p"
        je pausegame
        
        jmp gameloop
        ;=========CALLING MOVE FUNCTION=================
        moveUp:
          call movingUp
        jmp gameLoop

        moveDown:
          call movingdown
         jmp gameLoop
     
        moveLeft:
            call movingleft
          jmp gameLoop

         moveRight:
            call movingright
          jmp gameLoop
        
        
     jmp gameLoop
     ret
     Startafterp endp
     ret
     Restartafterp endp
    call exitGame

main ENDP

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,red+(white*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret
DrawPlayer ENDP

Drawghostlevel1 PROC

    ; Save old position
    mov dl, xgPos
    mov oldX, dl
    mov dh, ygPos
    mov oldY, dh

    ; Save the character at the current position
    call GetCharAtPos
    mov oldChar, al

    ; Check if the ghost should move left or right
    mov cl, boolright
    cmp cl, 1
    je moveleft

    ; Increment xgPos
    inc xgPos
    jmp drawGhost

moveleft:
    ; Decrement xgPos
    dec xgPos

drawGhost:
    ; Draw ghost at the current position
    mov eax, white + (red * 16)
    call SetTextColor
    mov dl, xgPos
    mov dh, ygPos
    call Gotoxy
    mov al, "O"
    call WriteChar

    ; Restore text color
    push eax
    mov eax, brown
    call SetTextColor
    pop eax

    ; Restore old position
    mov dl, oldX
    mov dh, oldY
    call Gotoxy
    mov al, oldChar
    call WriteChar

    ; Check if the column is 116 to reverse direction
    cmp xgPos, 116
    jne checkright

    ; Change direction when column is 116
    mov cl, boolright
    xor cl, 1  ; Reverse the direction
    mov boolright, cl

    jmp exitp

    checkright:
    cmp xgPos,3
    jne exitp

    ; Change direction when column is 116
    mov cl, boolright
    xor cl, 1  ; Reverse the direction
    mov boolright, cl

exitp:
    ret
Drawghostlevel1 ENDP

Drawghostlevel12 PROC

    ; Save old position
    mov dl, xgPoslevel1
    mov oldX, dl
    mov dh, ygPoslevel1
    mov oldY, dh

    ; Save the character at the current position
    call GetCharAtPos
    mov oldChar, al

    ; Check if the ghost should move left or right
    mov cl, boolright1
    cmp cl, 1
    je moveleft

    ; Increment xgPos
    inc xgPoslevel1
    jmp drawGhost

moveleft:
    ; Decrement xgPos
    dec xgPoslevel1

drawGhost:
    ; Draw ghost at the current position
    mov eax, white + (red * 16)
    call SetTextColor
    mov dl, xgPoslevel1
    mov dh, ygPoslevel1
    call Gotoxy
    mov al, "O"
    call WriteChar

    ; Restore text color
    push eax
    cmp level,3
    je nextcolor
    mov eax, brown
    jmp givecolor
    nextcolor:
    mov eax, magenta
    givecolor:
    call SetTextColor
    pop eax

    ; Restore old position
    mov dl, oldX
    mov dh, oldY
    call Gotoxy
    mov al, oldChar
    call WriteChar

    ; Check if the column is 116 to reverse direction
    cmp xgPoslevel1, 116
    jne checkright

    ; Change direction when column is 116
    mov cl, boolright1
    xor cl, 1  ; Reverse the direction
    mov boolright1, cl

    jmp exitp

    checkright:
    cmp xgPoslevel1,3
    jne exitp

    ; Change direction when column is 116
    mov cl, boolright1
    xor cl, 1  ; Reverse the direction
    mov boolright1, cl

exitp:
    ret
Drawghostlevel12 ENDP

Drawghostlevel2 PROC

   ; Save old position
    mov dl, xgPos
    mov oldX, dl
    mov dh, ygPos
    mov oldY, dh

    ; Save the character at the current position
    call GetCharAtPos
    mov oldChar, al

    ; Check if the ghost should move left or right
    mov cl, boolright
    cmp cl, 1
    je moveleft

    ; Increment xgPos
    inc xgPos
    jmp drawGhost

moveleft:
    ; Decrement xgPos
    dec xgPos

drawGhost:
    ; Draw ghost at the current position
    mov eax, white + (red * 16)
    call SetTextColor
    mov dl, xgPos
    mov dh, ygPos
    call Gotoxy
    mov al, "O"
    call WriteChar

    ; Restore text color
    push eax
    mov eax, cyan
    call SetTextColor
    pop eax

    ; Restore old position
    mov dl, oldX
    mov dh, oldY
    call Gotoxy
    mov al, oldChar
    call WriteChar

    ; Check if the column is 116 to reverse direction
    cmp xgPos, 116
    jne checkright

    ; Change direction when column is 116
    mov cl, boolright
    xor cl, 1  ; Reverse the direction
    mov boolright, cl

    jmp exitp

    checkright:
    cmp xgPos,3
    jne exitp

    ; Change direction when column is 116
    mov cl, boolright
    xor cl, 1  ; Reverse the direction
    mov boolright, cl

exitp:
    ret
Drawghostlevel2 ENDP

Drawghostlevel21 Proc

    ; Save old position
    mov dl, xgPos1
    mov oldX, dl
    mov dh, ygPos1
    mov oldY, dh

    ; Save the character at the current position
    call GetCharAtPos
    mov oldChar, al

   ;Check if the ghost should move left or right
    mov cl, boolup
    cmp cl, 1
    je moveup

    ; Increment xgPos1
    inc ygPos1
    jmp drawGhost

moveup:
    ; Decrement xgPos1
    dec ygPos1

drawGhost:
    ; Draw ghost at the current position
    mov eax, white + (red * 16)
    call SetTextColor
    mov dl, xgPos1
    mov dh, ygPos1
    call Gotoxy
    mov al, "O"
    call WriteChar

    ; Restore text color
    push eax
    mov eax, cyan
    call SetTextColor
    pop eax

    ; Restore old position
    mov dl, oldX
    mov dh, oldY
    call Gotoxy
    mov al, oldChar
    call WriteChar

    ; Check if the column is 116 to reverse direction
    cmp ygPos1, 27
    jne checkup

    ; Change direction when column is 116
    mov cl, boolup
    xor cl, 1  ; Reverse the direction
    mov boolup, cl

    jmp exitp

    checkup:
    cmp ygPos1,11
    jne exitp

    ; Change direction when column is 116
    mov cl, boolup
    xor cl, 1  ; Reverse the direction
    mov boolup, cl

exitp:
    ret
Drawghostlevel21 ENDP

Drawghostlevel22 Proc
    ; Save old position
    mov dl, xgPos2
    mov oldX, dl
    mov dh, ygPos2
    mov oldY, dh

    ; Save the character at the current position
    call GetCharAtPos
    mov oldChar, al

   ; Check if the ghost should move left or right
    mov cl, boolup1
    cmp cl, 1
    je moveup

    ; Increment xgPos2
    inc ygPos2
    jmp drawGhost

moveup:
    ; Decrement xgPos1
    dec ygPos2

drawGhost:
    ; Draw ghost at the current position
    mov eax, white + (red * 16)
    call SetTextColor
    mov dl, xgPos2
    mov dh, ygPos2
    call Gotoxy
    mov al, "O"
    call WriteChar

    ; Restore text color
    push eax
    mov eax, cyan
    call SetTextColor
    pop eax

    ; Restore old position
    mov dl, oldX
    mov dh, oldY
    call Gotoxy
    mov al, oldChar
    call WriteChar

    ; Check if the column is 116 to reverse direction
    cmp ygPos2, 27
    jne checkup

    ; Change direction when column is 116
    mov cl, boolup1
    xor cl, 1  ; Reverse the direction
    mov boolup1, cl

    jmp exitp

    checkup:
    cmp ygPos2,11
    jne exitp

    ; Change direction when column is 116
    mov cl, boolup1
    xor cl, 1  ; Reverse the direction
    mov boolup1, cl

exitp:
    ret
Drawghostlevel22 ENDP


Drawghostlevel3 proc
 
    ; Save old position
    mov dl, xgPos4
    mov oldX, dl
    mov dh, ygPos4
    mov oldY, dh

    ; Save the character at the current position
    call GetCharAtPos
    mov oldChar, al

    mov al,xgPos4
    mov ah,ygPos4


    cmp al,40
    jne checknext
    cmp ah,21
    jl movedown

    checknext:

    cmp al,77
    je checknext1
    cmp ah,21
    je moveright

    checknext1:
       
      cmp ah,11
      je checknext2
      cmp ah,21
      jle moveup
    
    checknext2:
     
      cmp al,77
      jg drawghost
      cmp ah,11
      je moveleft

    movedown:
      inc ygPos4
      jmp drawghost

    moveright:
      inc xgPos4
      jmp drawghost

    moveup:
      dec ygPos4
      jmp drawghost

    moveleft:
      dec xgPos4
      jmp drawghost

drawGhost:
    ; Draw ghost at the current position
    mov eax, white + (red * 16)
    call SetTextColor
    mov dl, xgPos4
    mov dh, ygPos4
    call Gotoxy
    mov al, "O"
    call WriteChar

    ; Restore text color
    push eax
    mov eax, magenta
    call SetTextColor
    pop eax

    ; Restore old position
    mov dl, oldX
    mov dh, oldY
    call Gotoxy
    mov al, oldChar
    call WriteChar


ret
Drawghostlevel3 ENDP

Drawghostlevel31 PROC

   ; Save old position
    mov dl, xgPos3
    mov oldX, dl
    mov dh, ygPos3
    mov oldY, dh

    ; Save the character at the current position
    call GetCharAtPos
    mov oldChar, al

    mov al,xgPos3
    mov ah,ygPos3

    cmp al,14
    jne checknext
    cmp ah,12
    jl movedown

    checknext:

    cmp al,112
    je checknext1
    cmp ah,12
    je moveright

    checknext1:
       
      cmp ah,5
      je checknext2
      cmp ah,12
      jle moveup
    
    checknext2:
     
      cmp al,118
      jg drawghost
      cmp ah,5
      je moveleft

    movedown:
      inc ygPos3
      jmp drawghost

    moveright:
      inc xgPos3
      jmp drawghost

    moveup:
      dec ygPos3
      jmp drawghost

    moveleft:
      dec xgPos3
      jmp drawghost

drawGhost:
    ; Draw ghost at the current position
    mov eax, white + (red * 16)
    call SetTextColor
    mov dl, xgPos3
    mov dh, ygPos3
    call Gotoxy
    mov al, "O"
    call WriteChar

    ; Restore text color
    push eax
    mov eax, magenta
    call SetTextColor
    pop eax

    ; Restore old position
    mov dl, oldX
    mov dh, oldY
    call Gotoxy
    mov al, oldChar
    call WriteChar
ret
Drawghostlevel31 ENDP

UpdatePlayer PROC
    mov eax,black
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP

DrawCoin PROC
    mov eax,red+(white*16)
    call SetTextColor
    mov dl,xCoinPos
    mov dh,yCoinPos
    call Gotoxy
    mov al,"@"
    call WriteChar
    ret
DrawCoin ENDP

CreateRandomCoin PROC
    coin_loop:
        ;Generate random x position between 5 and 117
         mov eax, 112      ; (117 - 5 + 1)
         call RandomRange
         add eax, 3
         mov xCoinPos, al

        ;Generate random y position between 5 and 27
         mov eax, 22 ; (27 - 5 + 1)
         call RandomRange
         add eax, 4
         mov yCoinPos, al

        ; Check character on position
        call checkcharonposcoin

        cmp al, '#'
        je coin_loop
        cmp al, '-'
        je coin_loop
        cmp al, '|'
        je coin_loop
       
    ret
CreateRandomCoin ENDP


exitGame:

   call drawscore

           mov ecx,27
           mov esi,offset endscreen
           mov dl,1
           mov dh,1
         outerlevelloop:
             push ecx
             mov dl,1
             inc dh
             call gotoxy
             mov ecx,117
          levelloop:
               mov  eax,Red
               call SetTextColor
               mov eax,0
               mov eax,[esi]
               call writechar
               inc esi
           loop levelloop
                 inc esi
                 pop ecx
           loop outerlevelloop

           mgotoxy 33,15
           mov edx,offset namestr
           call writestring

           mgotoxy 80,15
           mov eax,0
           mov ax, score
           call writedec

        ;==========================buffer update=====================

            mov eax, fileHandle
            mov edx, OFFSET namestr
            mov ecx, lengthof namestr
            call WriteToFile

            mov esi, OFFSET scorestring+8  ;Start at the end of the buffer (before null terminator)

            mov eax,0
            mov ax, score
            mov ebx, 10                 ;Divisor (10)
           
           call convertloop

            ; Write the buffer to the output file.
            mov eax, fileHandle
            mov edx, OFFSET spaces
            mov ecx, lengthof spaces
            call WriteToFile

           ; Write the buffer to the output file.
            mov eax, fileHandle
            mov edx, OFFSET scorestring
            mov ecx, lengthof scorestring
            call WriteToFile


           mov esi, OFFSET levelstring+8 ; Start at the end of the buffer (before null terminator)

           mov eax,0
           mov al, level
           mov ebx, 10                 ; Divisor (10)

           call convertloop
          
           ; Write the buffer to the output file.
            mov eax, fileHandle
            mov edx, OFFSET spaces
            mov ecx, lengthof spaces
            call WriteToFile

           ; Write the buffer to the output file.
            mov eax, fileHandle
            mov edx, OFFSET levelstring
            mov ecx, lengthof levelstring
            call WriteToFile

            mov eax, fileHandle
            mov edx, 0ah
            mov ecx, 1
            call WriteToFile

        ;====================WRITING TO FILE=========================

         ;  mov edx, OFFSET filename
         ;  call createoutputfile
         ;
         ;  mov  eax, fileHandle
         ;  mov  edx, OFFSET buffer
         ;  mov  ecx, BUFFER_SIZE
         ;  CALL WriteToFile

         

           call waitingentertobepressed
           exit
END main
