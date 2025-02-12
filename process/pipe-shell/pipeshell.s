	.file	"pipeshell.c"
	.text
	.section	.rodata
.LC0:
	.string	"> "
.LC1:
	.string	"  \t"
.LC2:
	.string	" | "
	.text
	.globl	prompt_and_parse
	.type	prompt_and_parse, @function
prompt_and_parse:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$0, (%rax)
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	line.3011(%rip), %rdi
	movl	$0, %eax
	call	gets@PLT
	testl	%eax, %eax
	jne	.L2
	movl	$-1, %eax
	jmp	.L3
.L2:
	movq	-24(%rbp), %rbx
	leaq	8(%rbx), %rax
	movq	%rax, -24(%rbp)
	leaq	.LC1(%rip), %rsi
	leaq	line.3011(%rip), %rdi
	call	strtok@PLT
	movq	%rax, (%rbx)
	jmp	.L4
.L7:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L5
	movq	-24(%rbp), %rax
	movq	$0, (%rax)
	nop
.L6:
	movq	-32(%rbp), %rbx
	leaq	8(%rbx), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC1(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, (%rbx)
	movq	(%rbx), %rax
	testq	%rax, %rax
	jne	.L6
	movl	$1, %eax
	jmp	.L3
.L5:
	addq	$8, -24(%rbp)
.L4:
	leaq	.LC1(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L7
	movl	$1, %eax
.L3:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	prompt_and_parse, .-prompt_and_parse
	.section	.rodata
.LC3:
	.string	"upstream: %s\n"
.LC4:
	.string	"downstream: %s\n"
.LC5:
	.string	"oaskdpasdkopsad"
.LC6:
	.string	"%s: not found\n"
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
	subq	$352, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	jmp	.L9
.L14:
	movq	-336(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-176(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-176(%rbp), %rax
	testq	%rax, %rax
	jne	.L10
	call	fork@PLT
	testl	%eax, %eax
	jne	.L11
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-336(%rbp), %rax
	leaq	-336(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	movq	-336(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L11:
	movl	$0, %edi
	movl	$0, %eax
	call	wait@PLT
	jmp	.L9
.L10:
	leaq	-344(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	pipe@PLT
	call	fork@PLT
	testl	%eax, %eax
	jne	.L12
	movl	-340(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	dup2@PLT
	movl	-344(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	close@PLT
	movq	-336(%rbp), %rax
	leaq	-336(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	movq	-336(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L12:
	call	fork@PLT
	testl	%eax, %eax
	jne	.L13
	movl	-344(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	dup2@PLT
	movl	-340(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	close@PLT
	movq	-176(%rbp), %rax
	leaq	-176(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	movq	-176(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L13:
	movl	-344(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	close@PLT
	movl	-340(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	close@PLT
	movl	$0, %edi
	movl	$0, %eax
	call	wait@PLT
	movl	$0, %edi
	movl	$0, %eax
	call	wait@PLT
.L9:
	leaq	-176(%rbp), %rdx
	leaq	-336(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	prompt_and_parse
	testl	%eax, %eax
	jg	.L14
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.local	line.3011
	.comm	line.3011,100,32
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
