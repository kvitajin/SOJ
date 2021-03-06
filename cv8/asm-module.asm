    bits 32

    section .data

;***************************************************************************

    section .text
    global div_intN_int32
div_intN_int32:
    enter 0,0
    push esi
    mov ecx, [ebp+12] ;t_len
    mov esi, [ebp+8] ;t_intN

    mov edx, 0

.back:
    mov eax, [esi+ecx*4-4]
    div dword [ebp+16]      ;t_delitel
    mov [esi+ecx*4-4], eax

    loop .back

    mov eax, edx        ; return reminder
    pop esi
    leave
    ret

    global add_intN_int32
add_intN_int32:
    enter 0,0
    push edi
    push esi

    ;mov edx, 0 ; netreba, bo cdq
    mov ecx, [ebp+12]   ;t_len
    mov esi, [ebp+8]    ; t_intN
    mov edi, 1          ; i

    mov eax, [ebp+16]
    cdq
    dec ecx
    mov eax, [esi]      ; t_intN[0]
    add eax, dword [ebp+16] ; t_add
    mov [esi], eax
.back:
    ; if ( CF ) break
    adc [esi+edi*4], edx
    inc edi
    loop .back

    mov eax, 0
    setc al

    pop esi
    pop edi

    leave
    ret

    global mul_intN_int32
mul_intN_int32:
    enter 0,0
    push ebx
    push edi
    push esi

    mov ecx, [ebp+12]   ;t_len
    mov esi, [ebp+8]    ;t_intN
    mov edi, 0          ; i
    mov ebx, 0          ; ulozeni edx

.back:
    mov eax, [esi+edi*4]
    mul dword [ebp+16]  ; *t_cinitel
    add eax, ebx
    mov [esi+edi*4], eax
    adc edx, 0
    mov ebx, edx
    inc edi


    loop .back
    mov eax, edx    ; preteceni

    pop esi
    pop edi
    pop ebx

    leave
    ret
