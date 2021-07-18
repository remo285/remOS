;;print hex values

;;ASCII '0-9' = 0x30 - 0x39
;;ASCII 'A - F' = 0x41 - 0x46
;;ASCII 'a - f' = 0x61 - 0x66


print_hex: 
    pusha
    mov cx, 0           ;set register counter to 0 for the loop

hex_loop: 
    cmp cx, 4           ;compares counter to 4 to check if we are at the end of the string
    je hex_end          ;if it is 4, go to end 

    ;;actual loop
    mov ax, dx          ;assuming we were called using the dx register, we move those values to ax register
    and ax, 0x000F      ;convert first 3 hex values to 0 and keep last one to convert
                        ;0x12AB = 0x000B
    add al, 0x30        ;we add 30 to the al register to compare
                        ;since we moved the dx value to the ax register, and since the value is hex
                        ;and all hex values are 4bits, that would make the whole hex value 16bit
                        ;this would mean that our first 2 values of the hex would be in the ah register
                        ;and the last 2 in the al register, since we want to compare the last digit, we add 0x30 to the al register
    cmp al, 0x39        ;we compare the value of the al register, if it is equal or lower than 0x39
                        ;then it's a number, if it's higher then its an alphabetic character
    jle mov_toBX        ;if it's less or equal jump to
    add al, 0x07        ;we add 0x07 to get ascii A - F, 

mov_toBX: 
    mov bx, hexString + 5       ;move base address + length of the string
    sub bx, cx                  ;substract loop counter
    mov [bx], al
    ror dx, 4                   ;rotate right by 4 bits to get next value
                                ;0x12AB -> 0xB12A -> 0xAB12 -> 0x2AB1 -> 0x12AB
    add cx, 1                     ;increment counter
    jmp hex_loop                ;jump to the loop to get the next value of dx register

hex_end: 
    mov bx, hexString           ;move the hexadecimal string into the bx register for print_string
    call print_string           ;prints the hexadecimal string

    popa                        ;restore registers from the stack
    ret                         ;return to caller

hexString: db '0x0000', 0