    bits 64

    section .data

;***************************************************************************

    section .text

;    global sub_intN_intN
;sub_intN_intN:
;    enter 0,0
;
;    push edi
;    push esi
;
;    mov edi, [ebp+8]    ;t_intNA
;    mov esi, [ebp+12]    ;t_intNB
;    mov ecx, [ebp+16]    ;t_len
;    mov edx, 0          ; inx
;
;    clc
;.back:
;    mov eax, [esi+edx*4]
;    sbb [edi+edx*4], eax
;    inc edx
;    loop .back
;
;    mov eax, 0
;    setc al         ; overflow?
;
;   pop esi
;    pop edi
;    leave
;    ret


;    global add_intN_intN
;add_intN_intN:
;    enter 0,0
;    push edi
;    push esi
;    mov edi, [ebp+8]    ;t_intNA
;    mov esi, [ebp+12]    ;t_intNB
;    mov ecx, [ebp+16]    ;t_len
;    mov edx, 0          ; inx
;    clc
;.back:
;    mov eax, [esi+edx*4]
;    adc [edi+edx*4], eax
;    inc edx
;    loop .back
;    mov eax, 0
;    setc al
;
;    pop esi
;    pop edi
;    leave
;    ret;

;    global shl_intN
;shl_intN:
;    enter 0,0
;    mov ecx,[ebp+12]    ; t_len
;    mov edx, [ebp+8]    ; t_int N
;    mov eax, 0
;
;    clc
;
;.back:
;    rcl dword [edx +eax*4], 1
;    inc eax
;    loop .back
    ;misto shl roll?
    ;ads dword [edx], 0
;    leave
;    ret

;  global shr_intN
;shr_intN:
;    enter 0,0
;    mov ecx,[ebp+12]    ; t_len
;    mov edx, [ebp+8]    ; t_int N
;    clc

;.back:
;    rcr dword [edx +ecx*4-4], 1
;    loop .back
;    ;misto shr roll?
    ;cf tp nejnizsiho bitu
    ; setc al
    ; ror eax, 1
    ;or t_intN[N-1], eax
;    leave
;    ret

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

