	.file	"thread.c"
	.text
	.comm	tid,16,16
	.section	.rodata
.LC0:
	.string	"\n First thread processing"
.LC1:
	.string	"thread 1: %d\n"
.LC2:
	.string	"\n Second thread processing"
.LC3:
	.string	"thread 2: %d\n"
	.text
	.globl	doSomeThing
	.type	doSomeThing, @function
doSomeThing:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	$0, -16(%rbp)
	call	pthread_self@PLT
	movq	%rax, -8(%rbp)
	movq	tid(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	pthread_equal@PLT
	testl	%eax, %eax
	je	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, -24(%rbp)
	jmp	.L3
.L4:
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -24(%rbp)
.L3:
	cmpl	$599, -24(%rbp)
	jle	.L4
	jmp	.L5
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, -20(%rbp)
	jmp	.L6
.L7:
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -20(%rbp)
.L6:
	cmpl	$599, -20(%rbp)
	jle	.L7
.L5:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	doSomeThing, .-doSomeThing
	.section	.rodata
.LC4:
	.string	"\ncan't create thread :[%s]"
.LC5:
	.string	"\n Thread created successfully"
.LC6:
	.string	"original thread: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -12(%rbp)
	jmp	.L10
.L13:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	tid(%rip), %rax
	addq	%rdx, %rax
	movl	$0, %ecx
	leaq	doSomeThing(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L11
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L12
.L11:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
.L12:
	addl	$1, -12(%rbp)
.L10:
	cmpl	$1, -12(%rbp)
	jle	.L13
	movl	$0, -8(%rbp)
	jmp	.L14
.L15:
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -8(%rbp)
.L14:
	cmpl	$599, -8(%rbp)
	jle	.L15
	movl	$5, %edi
	call	sleep@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
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
