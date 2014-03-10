# 目的：展示函数如何工作
#       本程序将计算
#       2^3 + 5^2
#
# 主程序中的所有内容都存储在寄存器中，
# 程序数据段中不含内容
#
#

.section .data

.section .text

.globl _start
_start:
	pushl	$3              #压入第二个参数
	pushl	$2              #压入第一个参数
	call 	power
	addl	$8, %esp
	pushl	%eax            #调用下一个函数之前保存第一个答案

	pushl	$2
	pushl	$5
	call	power
	addl 	$8, %esp

	popl %ebx               #第二个答案已经在%eax中。
                                #我们之前已经将第一个答案存储到栈中
				#现在可以将其弹出到%ebx

	addl	%eax, %ebx

	movl	$1, %eax
	int	$0x80

# 目的：本函数用于计算一个数的幂
#
# 输入：第一个参数：底数
#       第二个参数：底数的指数
#
# 输出：以返回值的形式给出结果
#
# 注意：指数必须大于1
#
# 变量：
#       %ebx - 保存底数
#       %ecx - 保存指数
#
#       -4(%ebp) -保存当前结果
#
#       %eax用于暂时存储
#

.type power, @function
power:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	
	movl	%ebx, -4(%ebp)

power_loop_start:
	cmpl	$1, %ecx
	je	end_power
	movl	-4(%ebp), %eax
	imull	%ebx, %eax
	movl	%eax, -4(%ebp)

	decl	%ecx
	jmp	power_loop_start

end_power:
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
