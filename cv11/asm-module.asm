    bits 64

    section .data

;***************************************************************************

    section .text

    global f2f, d2d
f2f:
d2d:
    ret

    global f2d
f2d:
    cvtss2sd xmm0, xmm0
    ret

    global d2f
d2f:
    cvtsd2ss xmm0, xmm0
    ret

    global fadd
fadd:
    addss xmm0, xmm1
    ret

    global aver
aver:
    movsx rcx, esi            ; t_len
    mov eax,0
    cvtsi2sd xmm0, eax        ;xmm0=0, suma
.back:
    addsd xmm0, [rdi+rcx*8-8] ;suma += t_array[i]
    loop .back
    cvtsi2sd xmm1, esi
    divsd xmm0, xmm1
    ret

    global task2
task2:
    movsd xmm4, xmm0
    movsd xmm5, xmm1
    movsd xmm6, xmm2
    addsd xmm4, xmm5
    comisd xmm6, xmm4
    ja .failEnd

    movsd xmm4, xmm0
    movsd xmm5, xmm1
    movsd xmm6, xmm2
    addsd xmm5, xmm6
    comisd xmm4, xmm5
    ja .failEnd

    movsd xmm4, xmm0
    movsd xmm5, xmm1
    movsd xmm6, xmm2
    addsd xmm6, xmm4
    comisd xmm5, xmm6
    ja .failEnd

    jmp .succEnd

.succEnd:
    mov eax, 1
    jmp .end
.failEnd:
    mov eax, 0
.end:
    ret


    global minmax
minmax:
    mov rcx, rsi
    movsd xmm0, [rdi]   ;max
    movsd xmm1, [rdi]   ;min
.back:
    minsd xmm1, [ rdi + rcx * 8 -8 ]
    maxsd xmm0, [ rdi + rcx * 8 -8 ]
    loop .back

    movsd [rdx+0], xmm1
    movsd [rdx+8], xmm0
    ret

    global rozloz
rozloz:
    movss xmm0, [rdi]
    ;s=1, e=11, m=52 double
    ;s=1, e=8, m=23 float

