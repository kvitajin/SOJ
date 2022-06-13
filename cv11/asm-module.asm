    bits 32

    section .data

;***************************************************************************

    section .text

    global mul_fix
mul_fix:
    enter 0,0
    mov eax, [ebp+8]        ;t_a
    imul dword [ebp+12]     ; t_b
    ;(eax/edx)>>t_z
    mov ecx, [ebp+16]       ;t_d
    shrd eax, edx, cl

    leave
    ret

    global div_fix
div_fix:
    enter 0,0
    mov ecx, [ebp+16]   ;t_d
    mov eax, [ebp+8]    ;t_a
    cdq
    shld edx, eax, cl
    shl eax, cl
    idiv dword [ebp+12] ;/=t_b

    leave
    ret


    global mul_fix10
mul_fix10:
    enter 0,0
    mov eax, [ebp+8]        ;t_a
    imul dword [ebp+12]     ; t_b

    idiv dword [ebp+16]
    ;mov ecx, 20
    ;idiv ecx

    leave
    ret

    global div_fix10
div_fix10:
    enter 0,0
    mov eax, [ebp+8]    ;t_a
    mov ecx, [ebp+16]
    imul ecx
    idiv dword [ebp+12] ;/=t_b

    leave
    ret




