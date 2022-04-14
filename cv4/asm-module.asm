 bits 32

    section .data


;***************************************************************************
    section .text
    global soucet_char

    global task2
task2:
    enter 0,0
    push edi

    mov al, ' '
    mov edi, [ebp+8]; t_str
    mov cx, ds
    mov es, cx
    ;cld

    mov ecx, -1         ; ecx*
    repe scasb

    mov eax, edi
    sub eax, [ebp+8]
    dec eax

    pop edi
    leave
    ret

    global task3
task3:
    enter 0,0
    push edi
    push esi
    push dword [ebp+12]    ;t_str1
    call mystrlen
    pop ecx                 ;clean

    mov ecx, eax
    mov esi, [ebp+12]       ; t_str1
    mov edi, [ebp+8]        ; t_str2
    mov ax, ds
    mov es, ax
    rep cmpsb
    jb .first
    ja .second
    jmp .equal
.first:
    mov eax, -1
    jmp .bye

.second:
    mov eax, 1
    jmp .bye
.equal:
    mov eax, 0
    jmp .bye
.bye:
    pop esi
    pop edi
    leave
    ret

    global task4
task4:
   enter 0,0
       push edi
       mov al, 0           ;'\0'
       mov edi, [ebp+8]    ;t_str
       mov cx, ds
       mov es, cx

       mov ecx, -1         ;ecx*
       repnz scasb

       mov eax, edi
       sub eax, [ebp+8]
       dec eax             ;odecitam posledni znak, protoze je to ta 0 za tim

       pop edi
       leave
       ret

global to_lower
to_lower:
    enter 0,0
    push edi
    push esi

    mov esi, [ ebp + 8 ]
    mov edi, esi
    mov ax, ds
    mov es, ax
    ;cld

.back:
    lodsb
    cmp al, 0
    je .done

    cmp al, 'A'
    jb .taknic
    cmp al, 'Z'
    ja .taknic

    or al, ( 'a' - 'A' )

.taknic:
    stosb

    jmp .back
.done:
    mov eax, [ ebp + 8 ]
    pop esi
    pop edi
    leave
    ret


    global mystrcpy
mystrcpy:
    enter 0,0
    push edi
    push esi
    push dword [ebp+12]    ;t_src
    call mystrlen
    pop ecx                 ;clean

    mov ecx, eax            ; strlen
    inc ecx                 ;vcetne '\0'
    mov esi, [ebp+12]       ; t_src
    mov edi, [ebp+8]        ; t_dest
    mov ax, ds
    mov es, ax
    ;cld

    rep movsb
    pop esi
    pop edi

    leave
    ret






    global mystrlen
mystrlen:
    enter 0,0
    push edi
    mov al, 0           ;'\0'
    mov edi, [ebp+8]    ;t_str
    mov cx, ds
    mov es, cx

    mov ecx, -1         ;ecx*
    repnz scasb

    mov eax, edi
    sub eax, [ebp+8]
    dec eax             ;udecitam posledni znak, protoze je to ta 0 za tim

    pop edi
    leave
    ret
