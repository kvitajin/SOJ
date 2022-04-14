 bits 32

    section .data


;***************************************************************************
    section .text

    global bit_mirror
bit_mirror:
    enter 0,0
    xor eax, eax
    mov edx, [ebp+8]
    mov ecx, 32
.back:
    shl eax, 1
    shr edx, 1
    jnc .skip
    inc eax
.skip:
     loop .back
     leave
     ret


    global task2
task2:
    enter 0,0
    push ebx
    mov ecx, [ebp+12]               ;ecx=t_len
    mov edx, [ebp+8]                ;*t_array
    mov eax, 0x80000000                  ;max=t_array[0]
.back:
    xor ebx, ebx
    cmp ebx, [edx+(ecx-1)*4]
    jg .under
    loop .back
    jmp .done
.under:
    cmp eax, [edx+(ecx-1)*4]
    jg .skip
    mov eax, [edx+(ecx-1)*4]       ;
.skip:
    loop .back
.done:
    pop ebx
    leave
    ret


    global set_bits
set_bits:
    enter 0,0
    mov ecx, [ebp+12]               ;ecx=t_len
    mov edx, [ebp+8]                ;*t_pole
    push ebx
    xor eax, eax
.back:
    mov  ebx, [edx+(ecx-1)*4]
    bts eax, ebx
    loop .back
    pop ebx
    leave
    ret

    global num_ones
num_ones:
    enter 0,0
    mov eax, 0
    mov edx, [ebp+8]
    mov ecx, 32
.back:
    shr edx, 1
    jnc .skip
    inc eax
.skip:
    loop .back
    leave
    ret


    global str_upper
str_upper:
    enter 0,0
    mov ecx, [ebp+8]               ;t_str

.back:
    cmp [ecx], byte 0           ;while(*t_str)
    je .done

    ;if (*t_str > 'a' || *t_str <'z')
    cmp [ecx], byte 'a'
    jb .skip
    cmp [ecx], byte 'z'
    ja .skip

    sub [ecx], byte ( 'a'- 'A')
.skip:
    inc ecx
    jmp .back
.done:
    leave
    ret

    global search_max
search_max:
    enter 0,0
    mov ecx, [ebp+12]               ;ecx=t_len
    mov edx, [ebp+8]                ;*t_array
    mov eax, [edx]                  ;max=t_array[0]
.back:
    cmp eax, [edx + ecx * 4 - 4]        ;if (max>t_array[ecx])
    jg .skip
    mov eax, [edx + ecx * 4 - 4]        ;max= t_array[ecx]
.skip:
    loop .back
    leave
    ret