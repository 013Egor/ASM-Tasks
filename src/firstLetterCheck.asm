%include "stud_io.inc"
global _start

section .data
    letter      db 'A'
section .text
_start: GETCHAR
        cmp     al, [letter]
        jnz     done
        PRINT   "Yes"
        FINISH
done:   PRINT   "No"
        FINISH