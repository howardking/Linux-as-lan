# 使用共享库打印hello world程序
#

.section .data
helloworld:
	.ascii "hello world\n\0"
.section .text
.globl _start
_start:
	pushl	$helloworld
	call	printf

	push	$0
	call	exit
