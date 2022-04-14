 bits 32

    section .data


;***************************************************************************
    section .text
    global task1
task1:
    enter 0,0
    mov ecx, [ebp+12] ;ecx
    mov edx, [ebp+8]            ;*l_pole
.back:
    xor eax, eax
    sub eax, [edx+(ecx-1)*4]        ;10 -10-10; -10 -(-10)-(-10)
    mov [edx+(ecx-1)*4], eax
    loop .back
    leave
    ret


    global task2
task2:
    enter 0,0
    mov ecx, [ebp+12]           ;ecx
    mov edx, [ebp+8]            ;*l_pole
.back:
    xor eax, eax
    mov eax, [edx+(ecx-1)*4]
    or eax, 1
    mov [edx+(ecx-1)*4], eax
    loop .back
    leave
    ret

    global task3
task3:
    enter 0,0
    push ebx
    mov ecx, [ebp+12]           ;ecx
    mov edx, [ebp+8]            ;*l_pole
    xor eax, eax
.back:
    xor ebx, ebx
    mov ebx, [edx+(ecx-1)*4]
    and ebx, 1
    jnz .inc
    jcxz .done

    loop .back
.inc:
   inc eax
   loop .back

.done:
    pop ebx
    leave
    ret

    global task4
task4:
    enter 0,0
    mov ecx, [ebp+12]
    mov edx, [ebp + 8]
.back:
    xor eax, eax
    mov  eax, [edx+(ecx-1)*4]
    xor eax, -1
    mov [edx+(ecx-1)*4], eax
    loop .back

    leave
    ret

    global mystrlen
mystrlen:
    enter 0,0
    mov eax, [ebp + 8]   ;*t_str
    xor ecx, ecx        ;ecx=0
.back:                  ;while(*t_str !='\0')
    mov cl, [eax]       ;c;= *t_str
    jcxz .done
    inc eax             ;t_str++
    jmp .back
.done:
    sub eax, [ebp+8]    ;t_str-=t_str_org
    leave
    ret

    global sum
sum:
    enter 0,0
    mov eax, [ebp+8] ;a
    add eax, [ebp +12] ; a+-b
    leave
    ret

    global sum_pole
sum_pole:
    enter 0,0
    mov ecx, [ebp+12] ;ecx
    mov edx, [ebp+8] ;*l_pole
    mov eax, 0
.back:
    add  eax, [edx+(ecx-1)*4] ; dum += t_pole [ecx-1]
    ;add  eax, [edx+ecx*4-4] ;  <- to same, co nad tim
    loop .back

    leave
    ret