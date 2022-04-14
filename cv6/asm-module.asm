    bits 64

    section .data

;***************************************************************************

    section .text
    ;rdi, rsi, rdx, rcx, r8, r9

    global to_lo_up
to_lo_up:
    push rbx
    mov rbx, 'A'
    mov rdx, 'Z'
    mov rax, 'a'
    mov rcx, 'z'

    cmp rsi, byte 0
    cmove rbx, rax
    cmove rdx, rcx
.back:
    test [rdi], byte -1
    jz .end
    mov rax, 0
    mov rcx, 0
    mov rax, [rdi]
    mov rcx, [rdi]
    xor rcx, byte ('a' - 'A')

    cmp [rdi], byte bl
    cmovb rcx, rax
    cmp [rdi], byte dl
    cmova rcx, rax
    mov [rdi], byte cl
    inc rdi
    jmp .back

.end:
    pop rbx
    ret

    global palindrome
palindrome:
	mov rcx, 0
	mov rax, 0
.back:
    cmp rcx, 16
    jae .end
	mov rdx, 1
	and rdx,rdi
	shr rdi,1
	shl rax,1
	or rax,rdx
    inc rcx;
    jmp .back
.end:
    xor rax,rdi
    cmp rax, 0
    je .bye
    mov rax,1
.bye:
    ret



    global min_max
min_max:
    push r15
    push r14
    mov r15, rcx
    mov r14, rdx
    mov rax, rdi
    mov rcx, rsi
    mov r10, [rax]      ;min
    mov r11, [rax]      ;max
.back:
    mov rax, [rdi+(rcx-1)*4]
    cmp rax, r10
    cmovg r10, rax
    cmp rax, r11
    cmovl r11, rax
    loop .back
.end:
    mov rdx, r14
    mov rcx, r15
    mov [rdx], r10
    mov [rcx], r11
    pop r14
    pop r15
    ret


global sum_reg
sum_reg:
    movsx rcx, esi
    mov r10, 0
    mov r11, 10
.back:
    mov rax, [ rdi + (rcx-1) * 8 ]

    cqo
    idiv r11
    add r10, rdx
    loop .back

    mov rax, r10
    ret









    global to_lower
to_lower:
    mov rax, rdi    ;backup *t_str
.back:
    cmp [rdi], byte 0   ;if (*t_str)?
    je .done

    cmp [rdi], byte 'A'
    jb .skip
    cmp [rdi], byte 'Z'
    ja .skip
    or [rdi], byte ('a'-'A')

.skip:
    inc rdi
    jmp .back    ;t_str++
.done:
    ret

    global sum64
sum64:
    mov rax, rdi    ; ret =t_a
    add rax, rsi    ; ret+=t_b
    ret

    global average_int
average_int:
    movsx rcx, esi
    mov rax, 0
.back:
    movsx rdx, dword [rdi + rcx*4-4]
    add rax, rdx
    loop .back

    cqo
    movsx rsi, esi
    idiv rsi

    ret

    global average_long
average_long:

    movsx rcx, esi          ; t_len
    mov rax, 0              ; sum=0
.back:
    add rax, [rdi+rcx*8-8]
    loop .back

    cqo
    movsx rsi, esi          ; t_len
    idiv rsi                ; deleni
    ret


    ; functions

    ;global some_asm_function
    ;extern some_c_function

;some_asm_function:
    ;ret

