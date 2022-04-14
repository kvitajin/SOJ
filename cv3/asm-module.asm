 bits 32

    section .data


;***************************************************************************
    section .text

    global task1
task1:
    enter 0,0
    mov ecx, [ebp+12] ;ecx
    mov edx, [ebp+8] ;*l_pole
    mov eax, 0

.back:
    add  eax, [edx+(ecx-1)*4] ; dum += t_pole [ecx-1]
    loop .back
    cdq
    idiv dword [ebp+12]
    leave
    ret

    global task2
task2:
    enter 0,0
    mov eax, [ebp+8]    ; t_a_l
    sub eax, [ebp+16]   ; t_b_l
    mov edx, [ebp+12]   ;t_a_h
    sbb edx, [ebp+20]   ;t_b_h
    leave
    ret

    global task3
task3:
    enter 0,0
    mov eax, [ebp+8]    ; t_a_l
    mov edx, [ebp+12]   ; t_a_h
    mov ecx, [ebp+16]   ; t_kolik
    shld edx, eax, cl
    shl eax, cl
    leave
    ret

    global task4_l
task4_l:
    enter 0,0
    push ebx
    mov eax, [ebp+8]    ; t_a_l
    mov edx, [ebp+12]   ; t_a_h
    mov ecx, [ebp+16]   ; t_kolik
    shld ebx, edx, cl
    shld edx, eax, cl
    shld eax, ebx, cl
    pop ebx
    leave
    ret

    global task4_r
task4_r:
    enter 0,0
    push ebx
    mov eax, [ebp+8]    ; t_a_l
    mov edx, [ebp+12]   ; t_a_h
    mov ecx, [ebp+16]   ; t_kolik
    xor ebx, ebx
    shrd ebx, eax, cl
    shrd eax, edx, cl
    shrd edx, ebx, cl
    pop ebx
    leave
    ret

   global task4_r_alt
task4_r_alt:
    enter 0,0
    push ebx
    mov eax, [ebp+8]    ; t_a_l
    mov edx, [ebp+12]   ; t_a_h
    mov ecx, [ebp+16]   ; t_kolik
    xor ebx, ebx
    shrd ebx, eax, cl
    shrd eax, edx, cl

    pop ebx
    leave
    ret




    global int_mul, int_mul64
int_mul:
int_mul64:

    enter 0,0
    mov eax, [ebp+8]        ;t_a
    imul dword [ebp +12]    ; t_a*=t_b

    leave
    ret

    global int_div
int_div:
    enter 0,0
    mov eax, [ebp+8]
    cdq         ; eax->edx
    idiv dword [ebp+12] ; t_a/=t_b
    mov ecx, [ebp +16]
    jcxz .null
    mov [ecx], edx
.null:

    leave
    ret

    global int_div64
int_div64:
    enter 0,0
    mov eax, [ebp+8]    ;t_a_l
    mov edx, [ebp+12]   ;t_a_h
    idiv dword [ebp+16] ; t_a/=t_b

   ; mov ecx, [ebp +16]
    ;jcxz .null
    ;mov [ecx], edx
.null:

    leave
    ret


    global int_add64
int_add64:
    enter 0,0
    mov eax, [ebp+8]    ; t_a_l
    add eax, [ebp+16]   ; t_b_l
    mov edx, [ebp+12]   ;t_a_h
    adc edx, [ebp+20]   ;t_b_h
    leave
    ret

    global ll_shr
ll_shr:
    enter 0,0
    mov eax, [ebp+8]    ; t_a_l
    mov edx, [ebp+12]   ; t_a_h
    mov ecx, [ebp+16]   ; t_kolik
    shrd eax, edx, cl
    shr edx, cl
    leave
    ret