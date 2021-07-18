[org 0x7c00]                     ;start at address 0x7c00, in wich the bootsector is located

    ;;change color maybe? edit: yes it changes
    mov ah, 0x0B                
    mov bh, 0x00                
    mov bl, 0x05                ;change color to pink (0x05 = pink)       
    int 0x10

    ;;print message
    mov bx, message
    call print_string 

    mov dx, 0x12AB
    call print_hex

    ;end
    jmp $

    ;include files
    %include "print_string.asm"
    %include "print_hex.asm"

message: db 'mensaje xd',0x0A, 0x0D, 0

;;magic number
times 510-($-$$) db 0
dw 0xaa55