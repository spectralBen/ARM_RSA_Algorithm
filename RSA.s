	.file	"RSA.c"
	.text
	.comm	e,4,4
	.comm	d,4,4
	.comm	n,4,4
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L2
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L4
.L2:
	movl	-24(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L4
.L5:
	movl	-16(%rbp), %eax
	cltd
	idivl	-12(%rbp)
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	imull	-12(%rbp), %eax
	movl	-16(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
.L4:
	cmpl	$0, -12(%rbp)
	jg	.L5
	movl	-16(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	gcd, .-gcd
	.globl	primarity
	.type	primarity, @function
primarity:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	-40(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L8
.L9:
	addl	$1, -16(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%rbp)
.L8:
	movl	-20(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L9
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-40(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	-36(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	findT
	movl	%eax, -8(%rbp)
	cmpl	$1, -8(%rbp)
	je	.L10
	movl	-40(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jne	.L11
.L10:
	movl	$1, %eax
	jmp	.L12
.L11:
	movl	$0, -12(%rbp)
	jmp	.L13
.L16:
	movl	-40(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	$2, %esi
	movl	%eax, %edi
	call	findT
	movl	%eax, -8(%rbp)
	cmpl	$1, -8(%rbp)
	jne	.L14
	movl	$0, %eax
	jmp	.L12
.L14:
	movl	-40(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jne	.L15
	movl	$1, %eax
	jmp	.L12
.L15:
	addl	$1, -12(%rbp)
.L13:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L16
	movl	$0, %eax
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	primarity, .-primarity
	.globl	findT
	.type	findT, @function
findT:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, -16(%rbp)
	jmp	.L18
.L19:
	movl	-24(%rbp), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, -12(%rbp)
	leaq	-20(%rbp), %rcx
	leaq	-16(%rbp), %rdx
	movl	-28(%rbp), %esi
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	exp_f
	movl	-24(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -24(%rbp)
.L18:
	cmpl	$0, -24(%rbp)
	jg	.L19
	movl	-16(%rbp), %eax
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	findT, .-findT
	.globl	exp_f
	.type	exp_f, @function
exp_f:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L23
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	imull	%edx, %eax
	cltd
	idivl	-8(%rbp)
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
.L23:
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	imull	%edx, %eax
	cltd
	idivl	-8(%rbp)
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	exp_f, .-exp_f
	.globl	inverse
	.type	inverse, @function
inverse:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$1, -16(%rbp)
	jmp	.L26
.L27:
	movl	-28(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	imull	-24(%rbp), %eax
	movl	-28(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -8(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-12(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	-20(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -16(%rbp)
.L26:
	cmpl	$0, -24(%rbp)
	jg	.L27
	cmpl	$1, -28(%rbp)
	jne	.L28
	movl	-20(%rbp), %eax
	movl	%eax, -32(%rbp)
.L28:
	cmpl	$0, -32(%rbp)
	jns	.L29
	movl	-36(%rbp), %eax
	addl	%eax, -32(%rbp)
.L29:
	movl	-32(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	inverse, .-inverse
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	encrypt
	.type	encrypt, @function
encrypt:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	n(%rip), %edx
	movl	e(%rip), %ecx
	movl	-20(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	findT
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %edx
	movq	-32(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	encrypt, .-encrypt
	.globl	decrypt
	.type	decrypt, @function
decrypt:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	n(%rip), %edx
	movl	d(%rip), %ecx
	movl	-20(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	findT
	movl	%eax, -4(%rbp)
	movq	-32(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	decrypt, .-decrypt
	.globl	generateKeys
	.type	generateKeys, @function
generateKeys:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
.L36:
	call	rand@PLT
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L36
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movl	$2, %edi
	call	primarity
	testl	%eax, %eax
	je	.L36
.L37:
	call	rand@PLT
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L37
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$2, %edi
	call	primarity
	testl	%eax, %eax
	je	.L37
	movl	-12(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, n(%rip)
	movl	-12(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-8(%rbp), %eax
	subl	$1, %eax
	imull	%edx, %eax
	movl	%eax, -4(%rbp)
.L38:
	call	rand@PLT
	movl	-4(%rbp), %edx
	leal	-2(%rdx), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	$2, %eax
	movl	%eax, e(%rip)
	movl	e(%rip), %eax
	movl	-4(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	gcd
	cmpl	$1, %eax
	jne	.L38
	movl	e(%rip), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	inverse
	movl	%eax, d(%rip)
	movl	d(%rip), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	generateKeys, .-generateKeys
	.section	.rodata
.LC1:
	.string	"w+"
.LC2:
	.string	"cipher.txt"
.LC3:
	.string	"decipher.txt"
.LC4:
	.string	"r+"
.LC5:
	.string	"plain.txt"
.LC6:
	.string	"r"
.LC7:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
	call	generateKeys
	leaq	.LC4(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L41
	movl	$1, %edi
	call	exit@PLT
.L41:
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L42
	movl	$1, %edi
	call	exit@PLT
.L42:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	getc@PLT
	movb	%al, -33(%rbp)
	cmpb	$-1, -33(%rbp)
	je	.L52
	movsbl	-33(%rbp), %eax
	andl	$127, %eax
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rdx
	movl	-28(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	encrypt
	jmp	.L42
.L52:
	nop
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC6(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L45
	movl	$1, %edi
	call	exit@PLT
.L45:
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L46
	movl	$1, %edi
	call	exit@PLT
.L46:
	leaq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$-1, %eax
	jne	.L47
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L49
	jmp	.L51
.L47:
	movl	-32(%rbp), %eax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	decrypt
	jmp	.L46
.L51:
	call	__stack_chk_fail@PLT
.L49:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
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
