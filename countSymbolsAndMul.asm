%include "stud_io.inc"
global _start

section     .bss
plusCount   resb    1
minusCount  resb    1

section     .text
_start:     xor     eax, eax
            mov     byte [plusCount], 0
            mov     byte [minusCount], 0
startRead:  GETCHAR
            cmp     al, '+'
            jnz     cmpMinus
            add     byte [plusCount], 1
            ja      startRead
            PRINT   'Too much +'
            PRINT   $0a
            sub     byte [plusCount], 1
            jmp     startRead
cmpMinus:   cmp     al, '-'
            jnz     cmpEnd
            add     byte [minusCount], 1
            ja      startRead
            PRINT   'Too much -'
            PRINT   $0a
            sub     byte [minusCount], 1
            jmp     startRead
cmpEnd:     cmp     al, $0a
            jnz     startRead
done:       mov     ax, 0
            mov     al, byte [plusCount]
            mul     byte [minusCount]
            mov     ecx, 0
            mov     cl, al
lp:         cmp     cx, 0
            jz      endLp
            PRINT   '*'
            loop lp
endLp:      PRINT   $0a
            FINISH