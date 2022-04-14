    bits 64

    section .data

;***************************************************************************

    section .text
    global div_intN_int32



    global div_intN_int32
div_intN_int32:
   	movsx rcx, esi
   	mov esi, edx
    mov edx, 0
.back:
   	movsx rax, dword [rdi + rcx * 4 - 4]
   	div dword esi
   	mov [rdi + rcx * 4 - 4], eax
   	loop .back

   	mov rax, rdx
   	ret

    global add_intN_int32
add_intN_int32:
	movsx rcx, esi
    mov esi, edx
	dec rcx

	mov rdx, 1
    add [rdi], esi
.back:
	jnc .end
	adc [rdi + rdx * 4], dword 0
	inc rdx
	loop .back
.end:
	ret


    global mul_intN_int32
mul_intN_int32:
	movsx rcx, esi
    mov esi, edx
	mov r8, 0
.back:
	movsx rax, dword [rdi]
	mul dword esi

	add rax, r8
	adc rdx, 0
	mov r8, rdx
	mov [rdi], eax
	add rdi, 4
	loop .back

	ret

