# 目的：在程序中找出最大的数字
# 
# 变量：寄存器的用途定义
#       %edi - 保存正在检查的数据项索引
#       %ebx - 当前已找到的最大项
#       %eax - 当前数据
#
# 使用以下内存位置：
#       data_items - 包含数据项
#                    0表示结束
#

.section .data

data_items:
.long 3, 68, 12, 37, 198, 10, 1, 4, 26, 255, 11, 22, 33, 44, 0

.section .text

.globl _start

_start:
	movl	$0, %edi                   #将0移入索引寄存器
	movl	data_items(,%edi,4), %eax  #加载数据项的第一个字节
	movl	%eax, %ebx                 #由于是第一项，%eax就是最大值

start_loop:
	cmpl	$0, %eax
	je	loop_exit
	incl 	%edi
	movl	data_items(,%edi,4), %eax
	cmpl	%ebx, %eax
	jle	start_loop

	movl	%eax, %ebx
	jmp	start_loop

loop_exit:
	movl	$1, %eax
#	int	$0x80
