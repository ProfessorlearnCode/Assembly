print macro p1
    mov dx,offset p1
    mov ah,9
    int 21h
    endm

.model small 
.stack 100h
.data 
project_title db "UNIVERSITY TIMETABLE PORTAL $"
PSWRD1     DB 'studentlgu@gmail.com' ;YOUR CORRECT PASSWORD
BUFF1      DB 20 DUP(?)       ;TO STORE YOUR ENTERED PASSWORD
MSG11      DB 'LOGIN: $'
MSG12      DB 'INCORRECT LOGIN!$'
MSG13      DB 'CORRECT LOGIN!$'               
choice db "ENTER YOUR CHOICE : $" 
PSWRD     DB 'choor123' ;YOUR CORRECT PASSWORD      
BUFF      DB 20 DUP(?)       ;TO STORE YOUR ENTERED PASSWORD 
MSG      DB 'ENTER YOUR GMAIL: $'
MSG1      DB 'ENTER YOUR PASSWORD: $'
MSG2      DB 'WRONG PASSWORD!$'
MSG3      DB 'CORRECT PASSWORD!$'
vc_views db "PRESS 1 VC VIEWS    $"  
teacher_timetable db "PRESS 2 TEACHER TIMETABLE  $"
room_timetable db "PRESS 3 ROOM TIMETABLE $" 
rami db "VC VIEWS $"  
vc_1 db "TODAY VC WORKING $" 
vc_2 db "ATTENDING BIOLOGY SEMINAR AT JINNAH HALL 9.00 AM TO 10.00 AM$"
vc_3 db "ATTENDING HIGH ACHIEVER AWARD CERMONEY AT 12.00 AM TO 1.30 AM$"
t1 db "PRESS 1  COMPUTER SCIENCES$" 
t2 db "PRESS 2  MATHEMATICS $"
t3 db "PRESS 3  COMMERANCE$"
t4 db "PRESS 4  ECONOMICS $"                             
t5 db "PRESS 5  ISLAMIC STUDIES$"
t6 db "PRESS 6  PHYSICS$"
t7 db "PRESS 7  PSYCHOLOGY$"
t8 db "PRESS 8  STATISTICS$"
t9 db "PRESS 9  URDU $"
t10 db "PRESS 10 MASS COMMUNICATION$"

teacher_123 db "TEACHER TIME TABLE $" 
shabi1 db "DR SHOAIB SULTAN$"
shabi2 db "DR URWA WAWRSI$"
shabi3 db "DR AMAN SALEEM$"
shabi4 db "DR SHAZIA MARI$"
shabi5 db "DR PARVEENA $"
shabi6 db "PROF AWAIS$"
shabi7 db "PROF BAZIL NAZR$"
shabi8 db "TA HARAM FATIMA$"
shabi9 db "TA SABA MOHSIN$"
shabi10 db "TA MUNWAR AHMAD$"           

shabi11 db "DR TAYYABA SULTAN$" 
shabi12 db "DR RAFIA SULTAN$"
shabi13 db "DR AMAN AHMAD$"
shabi14 db "DR SHAZIA MARI$"
shabi15 db "DR FARZAN$"
shabi16 db "PROF HABIB$"
shabi17 db "PROF BAZIL NAZR$"
shabi18 db "TA AMNA KOSAR$"
shabi19 db "TA SADIA FAIZI$"
shabi20 db "TA SABA MOHSIN$" 


mmmm db "PRESS 1 GO BACK TO MENU $"
mmmm1 db "PRESS 2 EXIT$"
shabi21 db "DR PARVEEN MERZA$"
shabi22 db "DR ASADSULLAH $"
shabi23 db "DR HIBA AYESHA$"
shabi24 db "DR ABDULLAH MAQSO0D$"
shabi25 db "DR AHAD NAWAZ$"
shabi26 db "PROF HIBULLAH $"
shabi27 db "PROF NAZAR ABBAS$"
shabi28 db "TA ALI HUSSAIN$"
shabi29 db "TA YAHIYA AHMAD$"
shabi30 db "TA YOUSAF AHMAD$" 

shabi31 db "DR SULTAN$" 
shabi32 db "DR RAFA SULTAN$"
shabi33 db "DR AMIN AHMAD$"
shabi34 db "DR MARIA HABIB$"
shabi35 db "DR FAZI AHMAD$"
shabi36 db "PROF JOHN $"
shabi37 db "PROF BAZIL NAZAR$"                      
shabi38 db "TA AWAIS NAZAR$"
shabi39 db "TA RAMION SHAH$"
shabi40 db "TA WALLED SHAH$"

new db "NEW BUILDING LGU$"
old db "OLD BUILDING LGU$" 
ob db "OLD BUILDING $"
ob0 db "21-OB$"
ob1 db "17-OB$"
ob2 db "57-OB$"
ob3 db "30-OB$"
ob4 db "31-OB$"
ob5 db "32-OB$"
ob6 db "33-IB$"
ob7 db "34-0B$"
ob8 db "35-0B$"
ob9 db "36-OB$"
ob10 db "37-0B$"
ob11 db "79 LAB COMPUTER LAB$"
ob12 db "57 DLD LAB$"
ob13 db "74A RESEARCH LAB$"
ob14 db "60-OB$"
ob15 db "61-OB$"
ob16 db "62-OB$"
ob17 db "63-OB$"
ob18 db "64-OB$"

nb db "NEW BUILDING $"
nb0 db "1-NB$"
nb1 db "2-NB$"
nb2 db "3-NB$"
nb3 db "4-NB$"
nb4 db "5-NB$"
nb5 db "6-NB$"
nb6 db "7-NB$"
nb7 db "8-NB$"
nb8 db "9-NB$"
nb9 db "10-NB$"
nb10 db "11-NB$"
nb11 db "12-NB$"
nb12 db "13-NB$"
nb13 db "14-NB$"
nb14 db "15-NB$"
nb15 db "16-NB$"
nb16 db "17-NB$"
nb17 db "18-NB$"
nb18 db "19-NB$"

jjjj db "CALL LAB WITH AMNA KUSAR SECTION H$"
jjjj1 db "PROGRAMMING FUNDAMENTAL WITH DR PROF SHOAIB SULTAN SECTION A$"
jjjj2 db "DATA STRUCTURE AND ALGORITHM WITH DR PROF SHOAIB SULTAN SECTION T$"
jjjj3 db "CALCULAS WITH DR PROF MARIA TARIQ$"
jjjj4 db "PHYSICS WITH TAYYAB SULTAN SECTION B $"
jjjj5 db "PROFESSIONAL PRACTICE WITH HIBA KUSAR SECTION C$"
jjjj6 db "COMMUNICATION SKILLS WITH GAVERIA AHMADSECTION U$"
jjjj7 db "ICT WITH AMNA KUSAR SECTION R$"
jjjj8 db "ICT LAB WITH MUNAWAR AHMAD SECTION D$"

part db "$"                                                 
part1 db "$"
part2 db "$"
part4 db "$"
part3 db "$"
part5 db "$"
part6 db "$"
part7 db "$"
part8 db "$"
part9 db "$"
part10 db "$"
part11 db "$"
part12 db "$"
part13 db "$"
part14 db "$"
part15 db "$"
part16 db "$"
part17 db "$"
part18 db "$"
part19 db "$"
ttttt db "MONDAY$"
ttttt1 db "LECTURE NO : 1 58-OB $"
ttttt2 db "LECTURE NO : 2 FREE $"
ttttt3 db "LECTURE NO : 3 12-NB $"
ttttt4 db "TUESDAY$"
ttttt5 db "LECTURE NO : 1 FREE $"
ttttt6 db "LECTURE NO : 2 91-OB $"
ttttt7 db "LECTURE NO : 3 12-NB $"
ttttt8 db "WEDNESDAY$"
ttttt9 db "LECTURE NO : 1 38-OB $"
ttttt10 db "LECTURE NO : 2 FREE $"
ttttt11 db "LECTURE NO : 3 32-NB $"
ttttt12 db "THURESDAY$"
ttttt13 db "LECTURE NO : 1 5-OB $"
ttttt14 db "LECTURE NO : 2 FREE $"
ttttt15 db "LECTURE NO : 3 19-NB $"
ttttt16 db "FRIDAY$"
ttttt17 db "LECTURE NO : 1 58-OB $"
ttttt18 db "LECTURE NO : 2 FREE $"
ttttt19 db "LECTURE NO : 3 12-NB $"
ttttt20 db "SATURDAY$"
ttttt21 db "ALL SLOT FREE $"
ttttt22 db "SUNDAY$"
ttttt23 db "ALL SLOTS FREE$"


.code
main proc 
    mov ax,@data
    mov ds,ax
    
    print project_title 
    call time 
    
    call time 
    LEA  SI,PSWRD1 ;LOAD OFFSET ON SI
    LEA  DI,BUFF1  ;LOAD OFFSET OF BUFF ON DI
    MOV AH,9
    LEA DX,MSG   ;DISPLAY MESSAGE
    INT 21H
    
    MOV CX,20      ;TOTAL NUMBERS OF CHARS OF YOUR PASSWORD
uuuu: 
    MOV AH,1     ;INPUT FROM KEYWORD WITHOUT ECHO
    INT 21H
    
    MOV [DI],AL   ;STORE AL (INPUT FROM KEYBOARD)IN[DI],BUFF
    INC DI
    
    ;MOV AH,2
;    MOV DL, AL   ;DISPLAY * ON SCREEN TO HIDE PASSWORD
    ;INT 21H
    
    LOOP uuuu       ;LOOP UNTILL CX=0
    
    LEA SI,PSWRD1  ;LOAD OFFSET PASSWORD ON SI AGAIN
    LEA DI,BUFF1  ;LOAD OFFSET OF BUFF ON DI AGAIN
    
    MOV CX,20      ;CX=5.NUMBERS OF CHARS OF PASSWORD
    
    MOV BX,0      ;INITIALIZING FOR OPERATION
    riya:  
    MOV BL,[SI]  ;LOAD[SI] ON BL
    MOV BH,[DI]   ;LOAD[DI] ON BH
    
    INC SI
    INC DI
    
    CMP BL,BH     ;COMPARE BH AND BL TO CHECK EQUALITY
    JNE soo        ;JUMP TO ZZ IF THEY ARE NOT EQUAL 
    LOOP riya       ;LOOP UNTILL CX=0
    call time
    MOV AH,9
    LEA DX,MSG13
    INT 21H
    jmp shoaib
    
soo: MOV AH,9
    LEA DX,MSG12
    INT 21H
    mov ah,4ch
    int 21h  
    shoaib:
    call time 
    LEA  SI,PSWRD ;LOAD OFFSET ON SI
    LEA  DI,BUFF  ;LOAD OFFSET OF BUFF ON DI
    MOV AH,9
    LEA DX,MSG1   ;DISPLAY MESSAGE
    INT 21H
    
    MOV CX,8      ;TOTAL NUMBERS OF CHARS OF YOUR PASSWORD
XX: MOV AH,07     ;INPUT FROM KEYWORD WITHOUT ECHO
    INT 21H
    
    MOV [DI],AL   ;STORE AL (INPUT FROM KEYBOARD)IN[DI],BUFF
    INC DI
    
    MOV AH,2
    MOV DL, '*'   ;DISPLAY * ON SCREEN TO HIDE PASSWORD
    INT 21H
    
    LOOP XX       ;LOOP UNTILL CX=0
    
    LEA SI,PSWRD  ;LOAD OFFSET PASSWORD ON SI AGAIN
    LEA DI,BUFF   ;LOAD OFFSET OF BUFF ON DI AGAIN
    
    MOV CX,8      ;CX=5.NUMBERS OF CHARS OF PASSWORD
    
    MOV BX,0      ;INITIALIZING FOR OPERATION
    YY:  MOV BL,[SI]  ;LOAD[SI] ON BL
    MOV BH,[DI]   ;LOAD[DI] ON BH
    
    INC SI
    INC DI
    
    CMP BL,BH     ;COMPARE BH AND BL TO CHECK EQUALITY
    JNE ZZ        ;JUMP TO ZZ IF THEY ARE NOT EQUAL 
    LOOP YY       ;LOOP UNTILL CX=0
    call time
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    JMP EXIT
ZZ: MOV AH,9
    LEA DX,MSG2
    INT 21H
    mov ah,4ch
    int 21h
    
EXIT:  
    
sss:                 
call time
print vc_views; 1 press
call time
print teacher_timetable ; 2 press
call time
print room_timetable ; 3 press
call time
 ;userinput
print choice 
mov ah,1
int 21h
mov bl,al                                   
call time

  ;now compare
mov al,bl
cmp al,'1'
je VC
cmp al,'2'
je teacher
cmp al,'3'
je room

VC:
print rami
call time
print vc_1 
call time
print vc_2
call time
print vc_3
jmp sss
mov ah,4ch 
int 21h



teacher: 
call time
call time 
    print teacher_123 ;teacher timetable
   
  call time
   print t1
  call time 
  print t2 
  call time
   print t3
  call time 
  print t4
  call time
   
   print t5
  call time 
  print t6 
  call time
  
   print t7
  call time 
  print t8 
  call time
   print t9
  call time 
  print t10 
  call time
  print choice
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
  mov al,bl
  cmp al,'1'
  je ttt
  cmp al,'2'
  je math
  cmp al,'3'
  je  commer 
  cmp al,'4'
  je it
  cmp al,'5'
  je fc 
  cmp al,'6'
  je dep_6
  cmp al,'7'
  je dep_7
  cmp al,'8'
  je  dep_8 
  cmp al,'9'
  je dep_9
        
  
       
   
   ;computer sciences department 
ttt:
call time 
   print shabi1 
   call time
   print shabi2 
   call time 
   print shabi21 
   call time
   print shabi22
   call time 
   print shabi23 
   call time
   print shabi24
   call time 
   print shabi25 
   call time
   print shabi26
    call time
  print choice
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
  mov al,bl
  cmp al,'1'
  je uuuuu
  cmp al,'2'
  je uuuuu
  cmp al,'3'
  je uuuuu
  cmp al,'4'
  je uuuuu
  cmp al,'5'
  je uuuuu
  cmp al,'6'
  je uuuuu
  cmp al,'7'
  je uuuuu
  cmp al,'8'
  je uuuuu
   
   mov ah,4ch
   int 21h
    math:   ; MATH DEP
    call time 
   print shabi3
   call time
   print shabi4 
     call time 
   print shabi31
   call time
   print shabi32
    call time 
     call time 
   print shabi33
   call time
   print shabi34
  print choice
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
  mov al,bl
    cmp al,'1'
  je uuuuu
  cmp al,'2'
  je uuuuu
  cmp al,'3'
  je uuuuu
  cmp al,'4'
  je uuuuu
  cmp al,'5'
  je uuuuu
  cmp al,'6'
  je uuuuu
  cmp al,'7'
  je uuuuu
  cmp al,'8'
  je uuuuu 
    mov ah,4ch
   int 21h
   commer:
   call time 
   print shabi5
   call time          
   print shabi6 
   call time 
   print shabi19
   call time
   print shabi20 
   call time 
   print shabi27
   call time          
   print shabi28 
   call time 
   print shabi29
   call time
   print shabi30 
    call time
  print choice
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
  mov al,bl
   cmp al,'1'
  je uuuuu
  cmp al,'2'
  je uuuuu
  cmp al,'3'
  je uuuuu
  cmp al,'4'
  je uuuuu
  cmp al,'5'
  je uuuuu
  cmp al,'6'
  je uuuuu
  cmp al,'7'
  je uuuuu
  cmp al,'8'
  je uuuuu
   
   
              
    mov ah,4ch
   int 21h
    
   it:       ; IT DEP
   call time 
   print shabi7
   call time
   print shabi8 
    call time 
   print shabi31
   call time
   print shabi32 
    call time 
   print shabi34
   call time
   print shabi35
   
   
      call time
  print choice
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
  mov al,bl
    cmp al,'1'
  je uuuuu
  cmp al,'2'
  je uuuuu
  cmp al,'3'
  je uuuuu
  cmp al,'4'
  je uuuuu
  cmp al,'5'
  je uuuuu
  cmp al,'6'
  je uuuuu
  cmp al,'7'
  je uuuuu
  cmp al,'8'
  je uuuuu
   
   
    mov ah,4ch
   int 21h
   fc:
   call time 
   print shabi9
   call time
   print shabi10  
   call time 
   print shabi36
   call time
   print shabi37  
   call time 
   print shabi38
   call time
   print shabi39     
   call time 
   print shabi40
   call time
  
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
  mov al,bl
    cmp al,'1'
  je uuuuu
  cmp al,'2'
  je uuuuu
  cmp al,'3'
  je uuuuu
  cmp al,'4'
  je uuuuu
  cmp al,'5'
  je uuuuu
  cmp al,'6'
  je uuuuu
  cmp al,'7'
  je uuuuu
  cmp al,'8'
  je uuuuu
   
    mov ah,4ch
   int 21h
   dep_6:
   call time 
   print shabi11
   call time
   print shabi12 
     call time 
   print shabi9
   call time
   print shabi10  
   call time 
   print shabi36
   call time
   print shabi37  
   call time 
   print shabi38
   call time
   
  print choice
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
  mov al,bl
    cmp al,'1'
  je uuuuu
  cmp al,'2'
  je uuuuu
  cmp al,'3'
  je uuuuu
  cmp al,'4'
  je uuuuu
  cmp al,'5'
  je uuuuu
  cmp al,'6'
  je uuuuu
  cmp al,'7'
  je uuuuu
  cmp al,'8'
  je uuuuu
   mov ah,4ch
   int 21h 
   dep_7:
   call time 
   print shabi13
   call time
   print shabi14
    call time 
   print shabi11
   call time
   print shabi12 
     call time 
   print shabi9
   call time
   print shabi10  
   call time 
   print shabi36
 
  
      call time
  print choice
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
   mov al,bl
    cmp al,'1'
  je uuuuu
  cmp al,'2'
  je uuuuu
  cmp al,'3'
  je uuuuu
  cmp al,'4'
  je uuuuu
  cmp al,'5'
  je uuuuu
  cmp al,'6'
  je uuuuu
  cmp al,'7'
  je uuuuu
  cmp al,'8'
  je uuuuu
   mov ah,4ch
   int 21h
   dep_8: 
   call time 
   print shabi15
   call time
   print shabi16 
   call time
   print shabi11
   call time
   print shabi12 
   call time 
   print shabi9
   call time
   print shabi10  
   call time 
   print shabi36
   call time
   print shabi37  
   call time 
   print shabi38
   call time
   call time
   print choice
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
  mov al,bl
   cmp al,'1'
  je uuuuu
  cmp al,'2'
  je uuuuu
  cmp al,'3'
  je uuuuu
  cmp al,'4'
  je uuuuu
  cmp al,'5'
  je uuuuu
  cmp al,'6'
  je uuuuu
  cmp al,'7'
  je uuuuu
  cmp al,'8'
  je uuuuu
   
   
   
   mov ah,4ch
   int 21h
   dep_9: 
   call time 
   print shabi17
   call time
   print shabi18
      call time 
   print shabi7
   call time
   print shabi8 
    call time 
   print shabi31
   call time
   print shabi32 
    call time 
   print shabi34
   call time
   print shabi35 
      call time
  print choice
   mov ah,1
   int 21h
   mov bl,al
 
  ;now compare
   mov al,bl
    cmp al,'1'
  je uuuuu
  cmp al,'2'
  je uuuuu
  cmp al,'3'
  je uuuuu
  cmp al,'4'
  je uuuuu
  cmp al,'5'
  je uuuuu
  cmp al,'6'
  je uuuuu
  cmp al,'7'
  je uuuuu
  cmp al,'8'
  je uuuuu 
    mov ah,4ch
   int 21h 
   room:
   call time
   print old
   call time
   print new
   call time 
   print choice 
   mov ah,1
   int 21h
   mov bl,al                                   
   call time

  ;now compare
    mov al,bl
  cmp al,'1'
  je bb
  cmp al,'2'
  je nn
  ;cmp al,'3'
;  je uuuuu
;  cmp al,'4'
;  je uuuuu
;  cmp al,'5'
;  je uuuuu
;  cmp al,'6'
;  je uuuuu
;  cmp al,'7'
;  je uuuuu
;  cmp al,'8'
;  je uuuuu 
   
   
   bb:
   call time
   print ob
   call time
   print ob0
   call time
   print ob1
   call time
   print ob2
   call time
   print ob3
   call time
   print ob4
   call time
   print ob5
   call time
   print ob6
   call time
   print ob7
   call time
   print ob8
   call time
   print ob9
   call time
   print ob10
   call time
   print ob11
   call time
   print ob12
   call time
   print ob13
   call time
   print ob14
   call time
   print ob15
   call time
   print ob16
   call time
   print ob17
   call time
   print ob18
   call time
   print choice 
   mov ah,1
   int 21h
   mov bl,al                                   
   call time

  ;now compare
   mov al,bl
   cmp al,'1'
   je b1
   cmp al,'2'
   je b2 
    cmp al,'3'
   je b3
   cmp al,'4'
   je b4 
    cmp al,'5'
   je b5
   cmp al,'6'
   je b6 
    cmp al,'7'
   je b7
   cmp al,'8'
   je b8 
    cmp al,'9'
   je b9
   
   mov ah,4ch
   int 21h
   nn:
     call time
   print nb
   call time
   print nb0
   call time
   print nb1
   call time
   print nb2
   call time
   print nb3
   call time
   print nb4
   call time
   print nb5
   call time
   print nb6
   call time
   print nb7
   call time
   print nb8
   call time
   print nb9
   call time
   print nb10
   call time
   print nb11
   call time
   print nb12
   call time
   print nb13
   call time
   print nb14
   call time
   print nb15
   call time
   print nb16
   call time
   print nb17
   call time
   print nb18
   call time
   print choice 
   mov ah,1
   int 21h
   mov bl,al                                   
   call time

  ;now compare
   mov al,bl
   cmp al,'1'
   je n1
   cmp al,'2'
   je n2 
    cmp al,'3'
   je n3
   cmp al,'4'
   je n4 
    cmp al,'5'
   je b5
   cmp al,'6'
   je n6 
    cmp al,'7'
   je n7
   cmp al,'8'
   je n8 
    cmp al,'9'
   je n9
   mov ah,4ch
   int 21h
   
   b1:
   call time
   print jjjj 
   call time
   jmp sss
   mov ah,4ch 
   int 21h
   b2:
   call time
   print jjjj1
   call time   
   jmp sss
   mov ah,4ch 
   int 21h
   b3:
   call time
   print jjjj2
   call time
   jmp sss
   mov ah,4ch 
   int 21h
   b4:    
   call time
   print jjjj3
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   b5:    
   call time
   print jjjj4 
   call time
   jmp sss
   mov ah,4ch 
   int 21h
   b6:    
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   b7:    
   call time
   print jjjj6 
   call time
   jmp sss
   mov ah,4ch 
   int 21h
   b8:    
   call time
   print jjjj7 
   call time
   jmp sss                                                        
   mov ah,4ch 
   int 21h
   b9:    
   call time
   print jjjj8 
   call time
   jmp sss
   mov ah,4ch 
   int 21h
     
   n1:
   call time
   print jjjj 
   call time
   jmp sss
   mov ah,4ch 
   int 21h
   n2:
   call time
   print jjjj1
   call time   
   jmp sss
   mov ah,4ch 
   int 21h
   n3:
   call time
   print jjjj2
   call time
   jmp sss
   mov ah,4ch 
   int 21h
   n4:    
   call time
   print jjjj3
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   n5:    
   call time
   print jjjj4 
   call time
   jmp sss
   mov ah,4ch 
   int 21h
   n6:    
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   n7:    
   call time
   print jjjj6 
   call time
   jmp sss
   mov ah,4ch 
   int 21h
   n8:    
   call time
   print jjjj7 
   call time
   jmp sss
   mov ah,4ch 
   int 21h
   n9:    
   call time
   print jjjj8 
   call time
   jmp sss
   mov ah,4ch 
   int 21h 
   
   uuuuu:
   call time 
   print ttttt
   call time 
   print ttttt1
   call time 
   print ttttt2
   call time 
   print ttttt3
   call time 
   print ttttt4
   call time 
   print ttttt5
   call time 
   print ttttt6
   call time 
   print ttttt7
   call time 
   print ttttt8
   call time 
   print ttttt9
   call time 
   print ttttt10
   call time 
   print ttttt11
   call time 
   print ttttt12
   call time 
   print ttttt13
   call time 
   print ttttt14
   call time 
   print ttttt15
   call time 
   print ttttt16
   call time 
   print ttttt17
   call time 
   print ttttt18
   call time 
   print ttttt19
   call time 
   print ttttt20
   call time 
   print ttttt21
   call time 
   print ttttt22
   call time
   print ttttt23
   call  time
   call time 
   print mmmm
   call time 
   print mmmm1
   call time
   print choice 
   mov ah,1
   int 21h
   mov bl,al                                   
   call time

  ;now compare
   mov al,bl
   cmp al,'1'
   je sss
   cmp al,'2'
   je exit1                    
   mov ah,4ch
   int 21h            
   
   
   
   titi:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi1:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi2:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi3: 
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi4: 
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi5: 
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi6: 
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi7: 
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi8:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi9: 
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi10:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi11:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi12:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi13:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi14:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi15:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi16:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi17:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi18:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h
   titi19:
   call time
   print jjjj5
   call time 
   jmp sss
   mov ah,4ch 
   int 21h   
   exit1:
MOV AH,4CH
    INT 21H
main endp 
time proc
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
    ret
time endp