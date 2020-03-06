	.file	"exit-status-demo.c"
	.text
	.section	.rodata
.LC0:
	.string	"parent waiting for child ..."
	.align 8
.LC1:
	.string	"child ended normally, exit status = %d\n"
	.align 8
.LC2:
	.string	"child terminated by signal %d\n"
.LC3:
	.string	"child running -- PID is %d\n"
	.align 8
.LC4:
	.string	"parent (child) waiting for child child ..."
	.align 8
.LC5:
	.string	"child child ended normally, exit status = %d\n"
	.align 8
.LC6:
	.string	"child child running -- PID is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	fork@PLT
	testl	%eax, %eax
	je	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	wait@PLT
	movl	-12(%rbp), %eax
	andl	$127, %eax
	testl	%eax, %eax
	jne	.L3
	movl	-12(%rbp), %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:
	movl	-12(%rbp), %eax
	andl	$127, %eax
	addl	$1, %eax
	sarb	%al
	testb	%al, %al
	jle	.L4
	movl	-12(%rbp), %eax
	andl	$127, %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L4
.L2:
	movl	$0, %eax
	call	getpid@PLT
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	call	fork@PLT
	testl	%eax, %eax
	je	.L5
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	wait@PLT
	movl	-12(%rbp), %eax
	andl	$127, %eax
	testl	%eax, %eax
	jne	.L6
	movl	-12(%rbp), %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L6:
	movl	-12(%rbp), %eax
	andl	$127, %eax
	addl	$1, %eax
	sarb	%al
	testb	%al, %al
	jle	.L7
	movl	-12(%rbp), %eax
	andl	$127, %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L7
.L5:
	movl	$0, %eax
	call	getpid@PLT
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movl	$42, (%rax)
	movl	$10, %edi
	movl	$0, %eax
	call	sleep@PLT
	movl	$3, %edi
	call	exit@PLT
.L7:
	movl	$5, %edi
	movl	$0, %eax
	call	sleep@PLT
	movl	$3, %edi
	call	exit@PLT
.L4:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
