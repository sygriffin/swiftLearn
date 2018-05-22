//: Playground - noun: a place where people can play

import Cocoa

//optional可空类型 -- 特性

//任何类型都可以用可空类型来说明一个实例可能是nil

///Swift 可能是nil -- OC 只允许是nil

//可空实例绑定 --> 检查某个可空实例是否为nil并在有值的情况下使用其值
//可空链式调用 --> 查询一连串可空的值

var errorCodeStr :String?

errorCodeStr = "404"

print(errorCodeStr)

if errorCodeStr != nil {
    let theError = errorCodeStr!//!强制展开 -->  访问可空实例封装的值
    print(theError)
}

//谨慎使用强制展开--有危险，为nil就会触发陷阱

///可空实例绑定

//if let theError = errorCodeStr {
//    if let errorCodeInteger = Int(theError) {
//        print("\(theError):\(errorCodeInteger)")
//    }
//}

//变得比上面的写法更优雅

if let theError = errorCodeStr,let errorCodeInteger = Int(theError) , errorCodeInteger == 404 //额外检查条件
{
    print("\(theError):\(errorCodeInteger)")
}

//extension --> 隐式展开可空类型
var errorCodeStr1 : String! = nil//!-->隐式展开可空类型
///建议 --> 只要是某个实例有可能是nil，就别用隐式展开可空类型，
//let anotherErrorCodeStr : String = errorCodeStr1  //崩溃 --> 触发陷阱 --> 显式声明，不可能是可空实例
let yetAnotherErrorCodeStr = errorCodeStr1  //可以工作 --> 尽可能推断安全类型
//如果想要yetAnotherErrorCodeStr是隐式展开可空类型，那就要进行显式声明
//（个人理解：显式声明即是将变量的具体类型指定给出，而隐式声明则是不给出，而让swift类型推断自己去判断什么类型）

//主要应用场景 --> 类初始化

///可空链式调用 --> 将多个查询串联为一个可空实例的值，整个过程都不为空查询链会返回期望类型的可空实例，否则任意一个为nil整个链式调用都会返回nil








