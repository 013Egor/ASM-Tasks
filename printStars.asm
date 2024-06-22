%include "stud_io.inc"
global _start

section .data
    minNumber db '1'
    maxNumber db '9'
section .text
_start: xor     eax, eax
        GETCHAR
        cmp     al, byte [minNumber]
        jl      done
        cmp     al, byte [maxNumber]
        jg      done
        xor     ecx, ecx
        mov     cl, al
        sub     ecx, '0'
lp:     PRINT   '*'
        loop lp
done:   FINISH
