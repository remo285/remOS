#build file with nasm
nasm -f bin boot_sect.asm -o boot_sect.bin

#exec bin file with qemu
qemu-system-x86_64 boot_sect.bin
