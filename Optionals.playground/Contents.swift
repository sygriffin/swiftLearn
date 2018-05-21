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



