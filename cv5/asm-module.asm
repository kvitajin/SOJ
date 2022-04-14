 bits 32

    section .data


;***************************************************************************
    section .text


otoc:
    enter eax, 0
    push ebx
    mov edx, [ebp+8]
    mov ecx, eax
.tocback:
    mov ebx, [edx + ecx * 4 - 4]
   ; mov [], ebx
    loop .tocback
.end:
    pop ebx

   global task3
task3:
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

    global task4
task4:
    enter 40,0
    push ebx
    mov ecx, [ebp+12]
    mov eax, [ebp+8]
    mov edx, ebp
    sub edx, 40
.back:
    xor ebx, ebx
    mov bl, [eax + ecx * 4 - 4]
    sub bl, byte '0'
    inc byte [edx + ebx]
    loop .back
.find_max:
    mov ecx, [ebp+12]               ;ecx=t_len
    mov edx, ebp                    ;pole v lokalu
    sub edx, 40
    mov eax, [edx]                  ;max=t_array[0]
.back2:
    cmp eax, [edx + ecx * 4 - 4]    ;if (max>t_array[ecx])
    jg .skip
    mov eax, [edx + ecx * 4 - 4]    ;max= t_array[ecx]
.skip:
    loop .back2

    pop ebx
    leave
    ret




    extern printf
    global print_bin
print_bin:
    enter 36, 0

    mov edx, ebp
    sub edx, 36
    mov [edx+33], byte 0    ;\0
    mov [edx+32], byte 10    ;\n
    mov eax, [ebp+8]        ; t_num
    mov ecx, 32
.back:
    mov [edx+ecx-1], byte '0'
    shr eax, 1
    adc [edx+ecx-1], byte 0
    loop .back
    push edx
    call printf
    pop ecx

    leave
    ret




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