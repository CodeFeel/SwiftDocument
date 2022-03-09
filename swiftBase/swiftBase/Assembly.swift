//
//  Assembly.swift
//  swiftBase
//
//  Created by ios on 2022/2/17.
//

import Foundation
/*
 汇编
 
 1.寄存器：rbp栈指针    rsp栈顶指针   rax函数返回值   rdi、rsi函数默认传输寄存器
 2.全局变量，静态变量通过rip相对索引进行访问
 3.new出来的对象是在heap上；临时对象是在stack，用ebp索引
 4.调用函数的地方call,后面的地址是函数地址
 5.lea是用来传地址的指令
 
 leaq   0xd(%rip)  %rax
 
 leaq是将rip + 0xd的地址值给rax
 
 movq   0xd(%rip)  %rax
  
 movq是将rip + 0xd的地址取出8个字节给rax
 
 */
