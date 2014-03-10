# 目的：计算一个数字的阶乘
#       如：3！= 3x2x1
#
# 本程序主要展示了一个递归调用

.section .data

# 本程序无全局数据

.section .text

.globl _start
.globl factorial

_start:
	pushl	$4                  #这里我们以求4的阶乘为例
	call	factorial
	addl	$4, %esp
	movl	%eax, %ebx
	movl	$1, %eax
	int	$0x80

# 实际函数的定义

.type factorial, @function
factorial:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	cmpl	$1, %eax
	je	end_factorial
	decl	%eax
	pushl	%eax
	call	factorial
	movl	8(%ebp), %ebx
	imull	%ebx, %eax
	
end_factorial:
	movl	%ebp, %esp
	popl	%ebp

	ret

