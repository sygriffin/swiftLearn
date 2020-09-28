

import Foundation

var str = "Hello, playground"

/* 支持嵌套
 /*  */
 
 //: markup语法
 #
 ##
 ###
 -
 -
 [](link)
 与markdown类似
 仅仅支持playground中支持
 > This is a note
 
 */

//下一页
//: [Next](@next)

let a : Int
//编译时 不确定这个值

//值类型 与 引用类型
//无论是结构体 还是常量 编译器都是进行过优化的
//结构体 可扩展性也是很强的

let intMax = Int.max
//浮点数十进制写法 e2 e-2


//巧用tuple - 元组

//控制流程语句 - 包含汇编分析

//for循环 - 支持区间运算符

// 区间的范围类型
// ClosedRange
// Range
// PartialRangeThrough

let range : ClosedRange = "cc"..."ff"
print(range)
//默认都是字符串

//stride - 带间隔的

for _ in stride(from: 4, to: 10, by: 2) {
    print(1)
}

//switch - 默认可以不写break 不会贯穿

//fallthrough - 贯穿 继续下一个case

//case 复合条件 switch->string、character类型也可以

//区间匹配 元组匹配

//模式匹配范畴

//值绑定 => 尾部加where条件 遍历的过程也可以用类似于continue

//标签语句 -> 跳出外部循环

/// function

// 隐式返回





