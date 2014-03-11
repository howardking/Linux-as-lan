# 目的： 对子符进行计数，直到遇到空字符
#
# 输入： 字符串地址
#
# 输出： 将计数值返回到%eax
#
# 过程：
#        用到的寄存器：
#           %ecx - 字符计数
#           %sl  - 当前字符
#           %edx - 当前字符地址

.type count_chars, @function
.globl count_chars

# 这是我么第一个参数在栈上的位置
.equ ST_STRING_START_ADDRESS, 8
count_chars:
	pushl	%ebp
	movl	%esp, %ebp
	
# 计数器从0开始
	movl	$0, %ecx
# 数据的起始地址
	movl	ST_STRING_START_ADDRESS(%ebp), %edx

count_loop_begin:
	
