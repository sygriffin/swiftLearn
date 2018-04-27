//: Playground - noun: a place where people can play

import Cocoa

//写代码时看到的一句话：生活不是你能过成什么样子，而是你想要过成什么样子

///对应有符号
Int.max
Int.min
Int32.max
Int32.min
///对应无符号
UInt.max
UInt.min
UInt8.max
UInt8.max
UInt16.max
UInt16.min
//etc.

//UInt的最大值是Int的最大最小值的绝对值之和，因为有符号的需要把一半可能的值留给负数使用

let numberOfpages : Int = 10
let numberOfChapter = 10

let numberOfPeople : UInt = 40
let volumeAdjust : Int32 = -1000

//let firstBadValue : Int8 = 200 --> 类型不匹配，此时不够保存的，溢出了！！！

//加减乘除运算，仍然遵循正常的规则

///注意·问题

//整数除法
print(11/3)
//结果不一样
let a : Float = 11
let b : Float = 3
print(a/b)
//同理求余也是如此
print(11%3)
print(-11%3)

var x = 10
x += 10

///执行中断，trapped
//溢出操作符&+
let y : Int8 = 120
let z = y &+ 10
//此时进行的是位运算，高位取反 ，得出循环值
//swift以安全为准，计算溢出会触发安全陷阱而不是继续高位取反运算下去
//特定业务下运算溢出折回也是有用的


//类型转换
let c : Int8 = 20
let d : Int16 = 200

let e = Int16(c)+d
//类型默认不转换，不匹配是不能进行任何操作的，类型转换是由程序员控制而不是由编译器默认推断
//类型转换有时容易丢失精度

//浮点数 32Float 64Double
//记住浮点数天生就是不精确的，绝对不能用于金额的计算！！！扩展：浮点数背后令人头疼的细节


























