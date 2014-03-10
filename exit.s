# 目的：退出Linux内核并返回一个简单的状态码
# 
# 输入：无
#
# 输出：控制台上没有输出，可以用echo $?来查看状态码
#
# 变量：
#       %eax 保存系统调用号
#       %ebx 保存返回状态
#

.section .data
.section .text
.globl  _start

_start:
	movl	$1, %eax       #这是用于退出程序的Linux内核命令号（系统调用）
	movl	$8, %ebx       #这是返回给操作系统的状态码
			       #改变这个数字，则返回到echo $?的值会不同
	int	$0x80          #将内核唤醒，以运行退出命令
