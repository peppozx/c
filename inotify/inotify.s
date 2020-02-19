	.file	"inotify.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"monitor.conf"
	.align 8
.LC2:
	.string	"unable to open the config file; giving up!"
.LC3:
	.string	"cannot stat %s, ignored\n"
.LC4:
	.string	"error adding watch for %s\n"
	.align 8
.LC5:
	.string	"added %s to watch list on descriptor %d\n"
	.align 8
.LC6:
	.string	"%s is not a refular file, ignored\n"
.LC7:
	.string	"a"
.LC8:
	.string	"monitor.out"
.LC9:
	.string	"%s was modified\n"
.LC10:
	.string	"%s was deleted\n"
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
	leaq	-53248(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$3856, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	inotify_init@PLT
	movl	%eax, -57100(%rbp)
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -57080(%rbp)
	cmpq	$0, -57080(%rbp)
	jne	.L3
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L7:
	leaq	-31312(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subq	$1, %rax
	movb	$0, -31312(%rbp,%rax)
	leaq	-57056(%rbp), %rdx
	leaq	-31312(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stat@PLT
	testl	%eax, %eax
	jns	.L4
	leaq	-31312(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L4:
	movl	-57032(%rbp), %eax
	andl	$61440, %eax
	cmpl	$32768, %eax
	jne	.L5
	leaq	-31312(%rbp), %rcx
	movl	-57100(%rbp), %eax
	movl	$1026, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	inotify_add_watch@PLT
	movl	%eax, -57092(%rbp)
	cmpl	$0, -57092(%rbp)
	jns	.L6
	leaq	-31312(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L6:
	movl	-57092(%rbp), %edx
	leaq	-31312(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-56912(%rbp), %rax
	movl	-57092(%rbp), %edx
	movslq	%edx, %rdx
	salq	$8, %rdx
	addq	%rax, %rdx
	leaq	-31312(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	jmp	.L3
.L5:
	leaq	-31312(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:
	movq	-57080(%rbp), %rdx
	leaq	-31312(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L7
	leaq	.LC7(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -57072(%rbp)
.L12:
	leaq	-27216(%rbp), %rcx
	movl	-57100(%rbp), %eax
	movl	$27200, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	movl	$0, %eax
	call	read@PLT
	movl	%eax, -57096(%rbp)
	leaq	-27216(%rbp), %rax
	movq	%rax, -57088(%rbp)
	jmp	.L8
.L11:
	movq	-57088(%rbp), %rax
	movq	%rax, -57064(%rbp)
	movq	-57064(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, %eax
	addq	$16, %rax
	addq	%rax, -57088(%rbp)
	movq	-57064(%rbp), %rax
	movl	4(%rax), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L9
	movq	-57064(%rbp), %rax
	movl	(%rax), %edx
	leaq	-56912(%rbp), %rax
	movslq	%edx, %rdx
	salq	$8, %rdx
	addq	%rax, %rdx
	movq	-57072(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L9:
	movq	-57064(%rbp), %rax
	movl	4(%rax), %eax
	andl	$1024, %eax
	testl	%eax, %eax
	je	.L10
	movq	-57064(%rbp), %rax
	movl	(%rax), %edx
	leaq	-56912(%rbp), %rax
	movslq	%edx, %rdx
	salq	$8, %rdx
	addq	%rax, %rdx
	movq	-57072(%rbp), %rax
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L10:
	movq	-57072(%rbp), %rax
	movq	%rax, %rdi
	call	fflush@PLT
.L8:
	movl	-57096(%rbp), %eax
	cltq
	leaq	-27216(%rbp), %rdx
	addq	%rdx, %rax
	cmpq	%rax, -57088(%rbp)
	jb	.L11
	jmp	.L12
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
