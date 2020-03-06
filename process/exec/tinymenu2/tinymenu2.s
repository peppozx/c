	.file	"tinymenu2.c"
	.text
	.section	.rodata
.LC0:
	.string	"0=ps, 1=ls, 2=date 3=goof : "
.LC1:
	.string	"%d"
.LC2:
	.string	"finished execution"
.LC3:
	.string	"command not found"
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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	call	fork@PLT
	movl	%eax, -16(%rbp)
	movl	$0, -12(%rbp)
	cmpl	$0, -16(%rbp)
	je	.L2
.L3:
	cmpl	$0, -12(%rbp)
	je	.L3
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L4
.L2:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	cmd.2924(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	cmd.2924(%rip), %rax
	movq	(%rdx,%rax), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	execlp@PLT
	movl	$1, -12(%rbp)
.L4:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
.LC4:
	.string	"ps"
.LC5:
	.string	"ls"
.LC6:
	.string	"date"
.LC7:
	.string	"goof"
	.section	.data.rel.local,"aw"
	.align 32
	.type	cmd.2924, @object
	.size	cmd.2924, 32
cmd.2924:
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
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
