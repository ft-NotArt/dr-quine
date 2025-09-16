section .data
	str: db "section .data%1$c	str: db %2$c%3$s%2$c, 0%1$c	file: db %2$cGrace_kid.s%2$c, 0%1$csection .text%1$c%%define O_CREAT  0o100%1$c%%define O_WRONLY 0o1%1$c%%macro KID 0%1$c	mov rdi, file%1$c	mov rsi, O_CREAT | O_WRONLY%1$c	mov rdx, 0o644%1$c	mov rax, 2%1$c	syscall%1$c	cmp rax, 0%1$c	jl .error%1$c	push rax%1$c	mov rdi, rax%1$c	mov rsi, str%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	mov r8, str%1$c	mov al, 0%1$c	call dprintf%1$c	mov rdi, 0%1$c	call fflush%1$c	pop rdi%1$c	mov rax, 3%1$c	syscall%1$c	mov rax, 0%1$c	ret%1$c	.error:%1$c		mov rax, 1%1$c		ret%1$c%%endmacro%1$cextern dprintf%1$cextern fflush%1$cglobal main%1$c; Comment%1$cmain:%1$c	KID", 0
	file: db "Grace_kid.s", 0
section .text
%define O_CREAT  0o100
%define O_WRONLY 0o1
%macro KID 0
	mov rdi, file
	mov rsi, O_CREAT | O_WRONLY
	mov rdx, 0o644
	mov rax, 2
	syscall
	cmp rax, 0
	jl .error
	push rax
	mov rdi, rax
	mov rsi, str
	mov rdx, 10
	mov rcx, 34
	mov r8, str
	mov al, 0
	call dprintf
	mov rdi, 0
	call fflush
	pop rdi
	mov rax, 3
	syscall
	mov rax, 0
	ret
	.error:
		mov rax, 1
		ret
%endmacro
extern dprintf
extern fflush
global main
; Comment
main:
	KID