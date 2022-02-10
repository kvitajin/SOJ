 bits 32

    section .data
    ;extern g_int_x
    ;extern g_char_z
    ;extern g_int_arr
    ;extern g_char_str
    ;--------------
    extern g_int_Y
    extern g_int_X
    extern g_char_arr
    extern g_char_num
    ; variables

    ;global g_some_asm_var
    ;extern g_some_c_var

;g_some_asm_var dd ?

;***************************************************************************
    section .text
    global task1
task1:
    mov[g_int_X], dword 123456
    mov[g_int_Y], dword 0x30313233
    ret

    global task2
task2:
    mov ah, byte [g_int_Y]
    mov[g_char_arr+0*4], ah
    mov ah, byte [g_int_Y+1]
    mov[g_char_arr+1], ah
    mov ah, byte [g_int_Y+2]
    mov[g_char_arr+2], ah
    mov ah, byte [g_int_Y+3]
    mov[g_char_arr+3], ah
    ret

    global task3
task3:
    mov eax, [g_int_X]
    mov ecx, [g_int_Y]
    mov [g_int_X], ecx
    mov [g_int_Y], eax
    ret

    global task4
task4:
    movsx eax, byte [g_char_num+0]
    mov [g_int_X], eax
    movsx eax, byte [g_char_num+1]
    mov [g_int_Y], eax
    ret

    global task5
task5:
    mov[g_int_X], dword 0x01020304
    mov ah, [g_int_X+0]
    mov al, [g_int_X+1]
    mov ch, [g_int_X+2]
    mov cl, [g_int_X+3]

    mov[g_int_X+3], ah
    mov[g_int_X+2], al
    mov[g_int_X+1], ch
    mov[g_int_X+0], cl

    ret

;    global set_puma
;set_puma:
;    mov[g_char_str+0], byte 'T'
;    mov[g_char_str+1], byte 'y'
;    mov[g_char_str+2], byte 'g'
;    mov[g_char_str+3], byte 'r'
;    ret

;    global move_z2x
;move_z2x:
;    movsx eax, byte [g_char_z]
;    mov [g_int_x], eax
;    ret

;    global set_x
;set_x:
;    mov[g_int_x], dword 654321
;    ret

;    global set_arr
;set_arr:
;    mov[g_int_arr+0*4], dword 1000
;    mov[g_int_arr+1*4], dword 1000000
;    mov[g_int_arr+2*4], dword 1000000000
;    ret



    ; functions

    ;global some_asm_function
    ;extern some_c_function

;some_asm_function:
    ;ret
