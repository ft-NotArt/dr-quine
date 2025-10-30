section .bss
	buff: resb 250
section .data
	str: db "section .bss%1$c	buff: resb 250%1$csection .data%1$c	str: db %2$c%3$s%2$c, 0%1$c	file: db %2$cSully_%%d.s%2$c, 0%1$c	exec: db %2$cnasm -f elf64 -D CHILD=yes -o Sully_%%1$d.o Sully_%%1$d.s && gcc Sully_%%1$d.o -o Sully_%%1$d -no-pie ; ./Sully_%%1$d ; rm -f Sully_%%1$d.o%2$c, 0%1$c	i: dd %4$d%1$csection .text%1$c%%define O_CREAT  0o100%1$c%%define O_WRONLY 0o1%1$cextern strcmp%1$cextern bzero%1$cextern sprintf%1$cextern dprintf%1$cextern fflush%1$cextern system%1$cglobal main%1$cmain:%1$c	%%ifdef CHILD%1$c		dec dword [i]%1$c	%%endif%1$c	cmp dword [i], 0%1$c	jl .error%1$c	mov rdi, buff%1$c	mov rsi, file%1$c	mov edx, [i]%1$c	sub rsp, 8%1$c	call sprintf%1$c	add rsp, 8%1$c	mov rdi, buff%1$c	mov rsi, O_CREAT | O_WRONLY%1$c	mov rdx, 0o644%1$c	mov rax, 2%1$c	syscall%1$c	cmp rax, 0%1$c	jl .error%1$c	push rax%1$c	mov rdi, rax%1$c	mov rsi, str%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	mov r8, str%1$c	mov r9d, [i]%1$c	mov al, 0%1$c	call dprintf%1$c	mov rdi, 0%1$c	call fflush%1$c	pop rdi%1$c	mov rax, 3%1$c	syscall%1$c	mov rdi, buff%1$c	mov rsi, exec%1$c	mov edx, [i]%1$c	sub rsp, 8%1$c	call sprintf%1$c	add rsp, 8%1$c	mov rdi, buff%1$c	sub rsp, 8%1$c	call system%1$c	add rsp, 8%1$c	mov rax, 0%1$c	ret%1$c	.error:%1$c		mov rax, 1%1$c		ret", 0
	file: db "Sully_%d.s", 0
	exec: db "nasm -f elf64 -D CHILD=yes -o Sully_%1$d.o Sully_%1$d.s && gcc Sully_%1$d.o -o Sully_%1$d -no-pie ; ./Sully_%1$d ; rm -f Sully_%1$d.o", 0
	i: dd 5
section .text
%define O_CREAT  0o100
%define O_WRONLY 0o1
extern strcmp
extern bzero
extern sprintf
extern dprintf
extern fflush
extern system
global main
main:
	%ifdef CHILD
		dec dword [i]
	%endif
	cmp dword [i], 0
	jl .error
	mov rdi, buff
	mov rsi, file
	mov edx, [i]
	sub rsp, 8
	call sprintf
	add rsp, 8
	mov rdi, buff
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
	mov r9d, [i]
	mov al, 0
	call dprintf
	mov rdi, 0
	call fflush
	pop rdi
	mov rax, 3
	syscall
	mov rdi, buff
	mov rsi, exec
	mov edx, [i]
	sub rsp, 8
	call sprintf
	add rsp, 8
	mov rdi, buff
	sub rsp, 8
	call system
	add rsp, 8
	mov rax, 0
	ret
	.error:
		mov rax, 1
		ret