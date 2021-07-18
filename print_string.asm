print_string:           ;prints a string 
    pusha               ;store the register values into the stack
    mov ah, 0x0e

print_char:                  
    mov al, [bx]
    cmp al, 0
    je end_print
    int 0x10
    add bx, 1
    jmp print_char

end_print:             ;returns to previous address when 0/null is found on string 
    popa               ;restore registers from the stack 
    ret
