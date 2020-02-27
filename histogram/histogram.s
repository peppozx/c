	.file	"histogram.c"
	.text
	.comm	modtimehist,96,32
	.globl	rflag
	.bss
	.align 4
	.type	rflag, @object
	.size	rflag, 4
rflag:
	.zero	4
	.globl	aflag
	.align 4
	.type	aflag, @object
	.size	aflag, 4
aflag:
	.zero	4
	.section	.rodata
.LC0:
	.string	"processing file %s\n"
	.text
	.globl	processfile
	.type	processfile, @function
processfile:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-184(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-160(%rbp), %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stat@PLT
	testl	%eax, %eax
	jns	.L2
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$2, %edi
	call	exit@PLT
.L2:
	leaq	-160(%rbp), %rax
	addq	$88, %rax
	movq	%rax, %rdi
	call	localtime@PLT
	movq	%rax, -168(%rbp)
	movq	-168(%rbp), %rax
	movl	8(%rax), %eax
	movslq	%eax, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	modtimehist(%rip), %rdx
	movl	(%rcx,%rdx), %edx
	leal	1(%rdx), %ecx
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	modtimehist(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	processfile, .-processfile
	.section	.rodata
.LC1:
	.string	"processing directory %s\n"
.LC2:
	.string	"."
.LC3:
	.string	".."
	.text
	.globl	processdir
	.type	processdir, @function
processdir:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$192, %rsp
	movq	%rdi, -4280(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-4280(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-4280(%rbp), %rax
	movq	%rax, %rdi
	call	opendir@PLT
	movq	%rax, -4272(%rbp)
	cmpq	$0, -4272(%rbp)
	jne	.L6
	movq	-4280(%rbp), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L9:
	movq	-4264(%rbp), %rax
	movzbl	19(%rax), %eax
	cmpb	$46, %al
	jne	.L7
	movl	aflag(%rip), %eax
	testl	%eax, %eax
	jne	.L7
	jmp	.L6
.L7:
	movq	-4280(%rbp), %rdx
	leaq	-4112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-4112(%rbp), %rax
	movq	$-1, %rcx
	movq	%rax, %rdx
	movl	$0, %eax
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-4112(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
	movq	-4264(%rbp), %rax
	leaq	19(%rax), %rdx
	leaq	-4112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	leaq	-4256(%rbp), %rdx
	leaq	-4112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stat@PLT
	movq	-4264(%rbp), %rax
	addq	$19, %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L8
	movq	-4264(%rbp), %rax
	addq	$19, %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L8
	movl	rflag(%rip), %eax
	testl	%eax, %eax
	je	.L8
	movl	-4232(%rbp), %eax
	andl	$61440, %eax
	cmpl	$16384, %eax
	jne	.L8
	leaq	-4112(%rbp), %rax
	movq	%rax, %rdi
	call	processdir
	jmp	.L6
.L8:
	leaq	-4112(%rbp), %rax
	movq	%rax, %rdi
	call	processfile
.L6:
	movq	-4272(%rbp), %rax
	movq	%rax, %rdi
	call	readdir@PLT
	movq	%rax, -4264(%rbp)
	cmpq	$0, -4264(%rbp)
	jne	.L9
	movq	-4272(%rbp), %rax
	movq	%rax, %rdi
	call	closedir@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	processdir, .-processdir
	.section	.rodata
.LC4:
	.string	"invalid option: -%c\n"
.LC5:
	.string	"ar"
	.align 8
.LC6:
	.string	"usage: modtimehist [-a] [-r] dirname\n"
.LC7:
	.string	"/"
.LC8:
	.string	"hour %2d: count = %6d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$48, %rsp
	movl	%edi, -4132(%rbp)
	movq	%rsi, -4144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -4120(%rbp)
	jmp	.L12
.L13:
	movl	-4120(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	modtimehist(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -4120(%rbp)
.L12:
	cmpl	$23, -4120(%rbp)
	jle	.L13
	movl	$0, opterr(%rip)
	jmp	.L14
.L17:
	cmpl	$114, -4116(%rbp)
	je	.L15
	cmpl	$114, -4116(%rbp)
	jg	.L14
	cmpl	$63, -4116(%rbp)
	je	.L16
	cmpl	$97, -4116(%rbp)
	jne	.L14
	movl	$1, aflag(%rip)
	jmp	.L14
.L15:
	movl	$1, rflag(%rip)
	jmp	.L14
.L16:
	movl	optopt(%rip), %edx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L14:
	movq	-4144(%rbp), %rcx
	movl	-4132(%rbp), %eax
	leaq	.LC5(%rip), %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	getopt@PLT
	movl	%eax, -4116(%rbp)
	cmpl	$-1, -4116(%rbp)
	jne	.L17
	movl	optind(%rip), %eax
	cltq
	salq	$3, %rax
	addq	%rax, -4144(%rbp)
	movl	optind(%rip), %eax
	subl	%eax, -4132(%rbp)
	cmpl	$1, -4132(%rbp)
	je	.L18
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L18:
	movq	-4144(%rbp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L19
	movq	-4144(%rbp), %rax
	movq	(%rax), %rcx
	leaq	-4112(%rbp), %rax
	movl	$4096, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	jmp	.L20
.L19:
	leaq	-4112(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	getcwd@PLT
	leaq	-4112(%rbp), %rax
	movq	$-1, %rcx
	movq	%rax, %rdx
	movl	$0, %eax
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-4112(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
	movq	-4144(%rbp), %rax
	movq	(%rax), %rdx
	leaq	-4112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
.L20:
	leaq	-4112(%rbp), %rax
	movq	%rax, %rdi
	call	processdir
	movl	$0, -4120(%rbp)
	jmp	.L21
.L22:
	movl	-4120(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	modtimehist(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-4120(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4120(%rbp)
.L21:
	cmpl	$23, -4120(%rbp)
	jle	.L22
	movl	$0, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
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
