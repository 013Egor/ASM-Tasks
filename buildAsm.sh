#!/bin/bash

nasm -f elf "$1.asm"
if [ ! -d "./execute" ] 
then
    mkdir execute
    echo "Created directory './execute' with executable files"
fi

ld -m elf_i386 "$1.o" -o execute/$1
execute/$1