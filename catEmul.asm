%include "stud_io.inc"
global _start

section .text
_start: xor     eax, eax
tChar:  GETCHAR
        cmp     al, $0ff
        jz      done
        PUTCHAR al
        cmp     al, $0ff
        jnz     tChar
done:   FINISH
