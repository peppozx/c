	.file	"dirtotal.c"
	.text
	.section	.rodata
.LC0:
	.string	"."
.LC1:
	.string	"total size = %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -184(%rbp)
	leaq	.LC0(%rip), %rdi
	call	opendir@PLT
	movq	%rax, -176(%rbp)
	jmp	.L2
.L3:
	movq	-168(%rbp), %rax
	leaq	19(%rax), %rdx
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	stat@PLT
	movq	-112(%rbp), %rax
	addq	%rax, -184(%rbp)
.L2:
	movq	-176(%rbp), %rax
	movq	%rax, %rdi
	call	readdir@PLT
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	.L3
	movq	-176(%rbp), %rax
	movq	%rax, %rdi
	call	closedir@PLT
	movq	-184(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
