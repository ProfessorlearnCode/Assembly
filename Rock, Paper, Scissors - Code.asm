.model small
.stack
.data  
    msg1 db "Rock, Paper, Scissors Game !!!", 13, 10, "$"
    msg2 db "1- ROCK", 13, 10, "$"
    msg3 db "2- Paper", 13, 10, "$"
    msg4 db "3- Scissors", 13, 10, "$"  
    
    newline db 13, 10, "$"

    input1 db "Select rock, paper, or scissors Player 1:", 13, 10, "$"  
    input2 db "Select rock, paper, or scissors Player 2:", 13, 10, "$"  

    rock1 db "Player 1 chose ROCK", 13, 10, "$"
    paper1 db "Player 1 chose PAPER", 13, 10, "$"
    scissor1 db "Player 1 chose SCISSORS", 13, 10, "$"     

    rock2 db "Player 2 chose ROCK", 13, 10, "$"
    paper2 db "Player 2 chose PAPER", 13, 10, "$"
    scissor2 db "Player 2 chose SCISSORS", 13, 10, "$"  
    
    invalid db "Invalid option entered", 13, 10, "$"

    point db "Player 1 got +1", 13, 10, "$" 
    pointssame db "Same Object Selected, Points Remain Same", 13, 10, "$"    
    win db "-------Player 1 Wins--------", 13, 10, "$"
    lose db "------Player 2 Wins--------", 13, 10, "$" 
    turn db "turn: $"

    random_number db 0 

.code
main proc 
    
    mov cx, 3
    mov bx, 1
    
loop_g:                      
    
    mov ax, @data
    mov ds, ax                 
    
    lea dx, turn
    mov ah, 9
    int 21h
    
    mov dl, bl
    add dl, '0'
    mov ah, 2 
    int 21h
    
    lea dx, newline
    mov ah, 9
    int 21h
    
    lea dx, msg1
    mov ah, 9
    int 21h
    
    lea dx, msg2 
    mov ah, 9
    int 21h
    
    lea dx, msg3 
    mov ah, 9
    int 21h
    
    lea dx, msg4 
    mov ah, 9
    int 21h 
              
    lea dx, input1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov dl, al
    
    cmp dl, '1'
    je rock_1
    
    cmp dl, '2'
    je paper_1 
    
    cmp dl, '3'
    je scissor_1 
    
    jmp invalid_input
    
    
rock_1:
    lea dx, rock1
    mov ah, 9
    int 21h
    jmp player2_turn
    
paper_1:
    lea dx, paper1
    mov ah, 9
    int 21h  
    jmp player2_turn
    
scissor_1:
    lea dx, scissor1
    mov ah, 9
    int 21h
    jmp player2_turn
                  
player2_turn: 

    lea dx, newline
    mov ah, 9
    int 21h
    
    lea dx, newline
    mov ah, 9
    int 21h

    lea dx, input2
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov dl, al
    
    cmp dl, '1'
    je rock_2
    
    cmp dl, '2'
    je paper_2 
    
    cmp dl, '3'
    je scissor_2
    
    jmp invalid_input 
    
rock_2:
    lea dx, rock2
    mov ah, 9
    int 21h
    jmp gamelogic
    
paper_2:
    lea dx, paper2
    mov ah, 9
    int 21h  
    jmp gamelogic
    
scissor_2:
    lea dx, scissor2
    mov ah, 9
    int 21h  
    jmp gamelogic   
    
gamelogic:
    cmp dl, '1'   
    je rockp1
    
    cmp dl, '2'  
    je paperp1
    
    cmp dl, '3'
    je scissorp1
    
rockp1:
    cmp al, '3'   
    je win_p1
    jmp lose_p1
    
paperp1:
    cmp al, '1'  
    je win_p1
    
scissorp1:
    cmp al, '2'   
 
    jmp lose_p1
    
win_p1:
    
    lea dx, newline
    mov ah, 9
    int 21h
    
    lea dx, win
    mov ah, 9
    int 21h
    jmp exit_program
    
lose_p1:
    
    lea dx, lose
    mov ah, 9
    int 21h 
    
    lea dx, newline
    mov ah, 9
    int 21h
    jmp exit_program 
    
    
invalid_input:    

    lea dx, invalid
    mov ah, 9
    int 21h
   
    
exit_program: 

    inc bl  
    
    loop loop_g
    
    mov ah, 4ch
    int 21h
    
end main
main endp
