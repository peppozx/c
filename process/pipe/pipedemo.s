	.file	"pipedemo.c"
	.text
	.section	.rodata
.LC0:
	.string	"ls"
.LC1:
	.string	"-r"
.LC2:
	.string	"sort"
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
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	pipe@PLT
	call	fork@PLT
	testl	%eax, %eax
	jne	.L2
	movl	-12(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	dup2@PLT
	movl	-16(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	execlp@PLT
	jmp	.L5
.L2:
	movl	-16(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	dup2@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %ecx
	leaq	.LC1(%rip), %rdx
	leaq	.LC2(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	execlp@PLT
.L5:
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
