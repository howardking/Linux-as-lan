# 目的：这个程序用于说明如何调用printf函数
#

.section .data
# 这个字符串称为格式字符串，是第一个参数
# printf用这个参数来确定给定了多少个参数
# 以及它们分别是什么类型

firststring:
	.ascii "Hello! %s is a %s who loves the number %d\n\0"

name:
	.ascii "HowardKing\0"
personstring:
	.ascii "persion\0"

numberloved:
	.long 3

.section .text
.globl _start
_start:
	pushl	$numberloved
	pushl	$personstring
	pushl	$name
	pushl	$firststring
	call 	printf
	push	$0
	call	exit
