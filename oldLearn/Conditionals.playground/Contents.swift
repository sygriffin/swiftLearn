//: Playground - noun: a place where people can play

import Cocoa

/** 第三章：条件语句
 *  难度：简单
 *  主要内容：
 */

var populations : Int = 5500

var message :String

if populations < 10000 {
    message = "\(populations) is small"
} else {
    message = "\(populations) is big"
}

print(message)

//特殊计算符：=== 计算两个实例是否指向同一个引用；!== 计算两个实例是否不指向同一个引用

//bool，boolean布尔类型
var hasPostOffice : Bool = true

if !hasPostOffice {
    print("Where has a post office?")
}

message = populations < 10000 ? "\(populations) is small" : "\(populations) is big"
//视情况而定，有时候简洁有时候麻烦，也并不是最优雅的写法

//嵌套if 与 else if 也是视情况而定，在需要用的时候采用相应的类型就可以了

if 1000 < populations {
    
} else if populations < 10000{
    
} else {
    
}

//不能连写？？？ 100 < populations < 10000,只可以用逻辑运算符



