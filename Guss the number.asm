.model small
.stack 100h

.data 
    input  db 13,10, "Enter a value between 0 to 9 : $" 
    msg0 db 13,10, "Number is  Low.Try again..!$"  
    msg1 db 13,10,"Number is High.Try again..!$" 
    msg2 db 13,10,"Congratulations! You guessed correctly!!$"
    msg3 db 13,10, "  Welcome to the game, GUESS THE NUMBER:$"
    

    
.code
Main Proc

   Mov ax, @data
   Mov ds, ax

   mov dx, offset msg3
   
   mov ah, 9h
   int 21h    
     mov ah, 8h
   int 21h 
      mov cl, al
   
    mov dx ,offset input 
    mov ah,9
    int 21h  
   
    
  
   

Label1:
       MOV DL,10
       MOV AH,2 
       INT 21H 
       MOV DL,13
       MOV AH,2
       INT 21H
       
      
   mov ah, 01h
   int 21h 
   
   


   mov ch, al
   cmp ch, cl 
  
   
    

   jl lesser
   jg greater
   je corect
      
        
Lesser:

   mov dx, offset msg0
   mov ah, 9h
   int 21h  
        
  
                  
                  
   jmp Label1
   
 
   
   
Greater:
   mov dx, offset msg1
   mov ah, 9h
   int 21h
   jmp Label1 
   
 
   
      
corect:
   mov dx, offset msg2
   mov ah, 9h
   int 21h 
   jmp end  
   
  
   
end: 
     
   mov ah, 4ch
   int 21h

Main endp
End main