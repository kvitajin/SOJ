    bits 64

    section .data
;str_form db "asm faktorial %ld", 10,0
str_form db "asm task2 %ld", 10,0
;***************************************************************************

    section .text
    extern printf
    ;rdi, rsi, rdx, rcx, r8, r9
    global faktorial
faktorial:
    enter 8,0
    or rdi, rdi
    mov rax, 1
    jz .done

    mov [rbp-8], rdi
    dec rdi
    call faktorial

    imul qword [rbp-8]   ;factorial (t_num-1)*t_num
.done:
    mov [ rbp - 8 ], rax
    mov rdi, str_form
    mov rsi, rax
    mov al, 0           ; bo ABI
    call printf         ; printf(str_form, ret)

    mov rax, [rbp-8]

    leave
    ret

    global taskfff
taskfff:
    enter 40, 0
    push rbx
    xor rax, rax
    mov r10, rbp
    sub r10, 40
    mov ebx, -1

    cmp edi, ebx
    je .done
    add rax, rdi

    cmp esi, ebx
    je .done
    add rax, rsi

    cmp ecx, ebx
    je .done
    add rax, rcx

    cmp r8d, ebx
    je .done
    add rax, r8

    cmp r9d, ebx
    je .done
    add rax, r9
    mov ecx, 40
;.back:
;    mov r11, [r10+ecx]
;    cmp r11, rbx
;    je .done
;    add rax, r11

;    loop .back

.done:
    pop rbx
    leave
    ret


    global task2
task2:
	enter 8,0

	or rsi, rsi
	mov rax, 1
	jz .done

	mov [rbp - 8], rdi
	mov [rbp - 16], rsi

	dec rsi
	call task2

	imul qword [rbp - 8]
.done:
	mov [rbp - 8], rax

	mov rdi, str_form
	mov rsi, rax
	mov al, 0
	call printf						;printf(str_form, ret)

	mov rax, [rbp - 8]

	leave
	ret

    global task3
task3:
    or rdi, rdi
    jz .done


.done:
    ret


