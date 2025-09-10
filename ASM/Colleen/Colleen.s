section .data
	str: db "section .data%1$c	str: db %2$c%3$s%2$c, 0%1$csection .text%1$cextern printf%1$cextern fflush%1$cglobal _start%1$c_func:%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c	mov rcx, rdi%1$c	mov al, 0%1$c	sub rsp, 8%1$c	call printf%1$c	add rsp, 8%1$c	ret%1$c; A comment%1$c_start:%1$c	; A cool comment%1$c	mov rdi, str%1$c	call _func%1$c	mov rdi, 0%1$c	sub rsp, 8%1$c	call fflush%1$c	add rsp, 8%1$c	mov rax, 60%1$c	mov rdi, 0%1$c	syscall", 0
section .text
extern printf
extern fflush
global main
_func:
	mov rsi, 10
	mov rdx, 34
	mov rcx, rdi
	mov al, 0
	sub rsp, 8
	call printf
	add rsp, 8
	ret
; A comment
main:
	; A cool comment
	mov rdi, str
	sub rsp, 8
	call _func
	add rsp, 8
	mov rdi, 0
	sub rsp, 8
	call fflush
	add rsp, 8
	mov rax, 0
	ret