	.file	"argdemo.c"
	.text
	.section	.rodata
.LC0:
	.string	"invalid option: -%c\n"
.LC1:
	.string	"abn:t:"
.LC2:
	.string	"Option a is set"
.LC3:
	.string	"Option b is set"
.LC4:
	.string	"Numeric option value is %d\n"
	.align 8
.LC5:
	.string	"Text        option value is %s\n"
.LC6:
	.string	"arg: %s\n"
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
	subq	$240, %rsp
	movl	%edi, -228(%rbp)
	movq	%rsi, -240(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -224(%rbp)
	movl	$0, -220(%rbp)
	movl	$0, -216(%rbp)
	movabsq	$32770348699510116, %rax
	movl	$0, %edx
	movq	%rax, -208(%rbp)
	movq	%rdx, -200(%rbp)
	movq	$0, -192(%rbp)
	movq	$0, -184(%rbp)
	movq	$0, -176(%rbp)
	movq	$0, -168(%rbp)
	movq	$0, -160(%rbp)
	movq	$0, -152(%rbp)
	movq	$0, -144(%rbp)
	movq	$0, -136(%rbp)
	movq	$0, -128(%rbp)
	movq	$0, -120(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	movl	$0, opterr(%rip)
	jmp	.L2
.L7:
	cmpl	$116, -212(%rbp)
	je	.L3
	cmpl	$116, -212(%rbp)
	jg	.L2
	cmpl	$110, -212(%rbp)
	je	.L4
	cmpl	$110, -212(%rbp)
	jg	.L2
	cmpl	$98, -212(%rbp)
	je	.L5
	cmpl	$98, -212(%rbp)
	jg	.L2
	cmpl	$63, -212(%rbp)
	je	.L6
	cmpl	$97, -212(%rbp)
	jne	.L2
	movl	$1, -224(%rbp)
	jmp	.L2
.L5:
	movl	$1, -220(%rbp)
	jmp	.L2
.L4:
	movq	optarg(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	atoi@PLT
	movl	%eax, -216(%rbp)
	jmp	.L2
.L3:
	movq	optarg(%rip), %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	jmp	.L2
.L6:
	movl	optopt(%rip), %edx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L2:
	movq	-240(%rbp), %rcx
	movl	-228(%rbp), %eax
	leaq	.LC1(%rip), %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	getopt@PLT
	movl	%eax, -212(%rbp)
	cmpl	$-1, -212(%rbp)
	jne	.L7
	cmpl	$0, -224(%rbp)
	je	.L8
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L8:
	cmpl	$0, -220(%rbp)
	je	.L9
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
.L9:
	movl	-216(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-208(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	optind(%rip), %eax
	cltq
	salq	$3, %rax
	addq	%rax, -240(%rbp)
	movl	optind(%rip), %eax
	subl	%eax, -228(%rbp)
	jmp	.L10
.L11:
	movq	-240(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -240(%rbp)
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L10:
	movl	-228(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -228(%rbp)
	testl	%eax, %eax
	jne	.L11
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
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
