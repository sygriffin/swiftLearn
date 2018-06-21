//: Playground - noun: a place where people can play

import Cocoa

enum TextAligment {
    case left
    case right
    case center
    case justify
}

var aligment: TextAligment = TextAligment.left
var aligment1 = TextAligment.left
aligment = .right
if aligment == .right {
    print("we should right-align the text")
}

switch aligment {
case .left:
    print("left-aligned")
case .right:
    print("right-aligned")
default:
    print("default")
}

///原始值enum --> 类似C/C++的枚举
enum TextAligment1 :Int {
    case left       = 20
    case right      = 30
    case center     = 40
    case justify    = 50
}

//把原始值转化为枚举类型
let myRawValue = 20
let myAligment = TextAligment1(rawValue: myRawValue)
if let myAligment = TextAligment1(rawValue: myRawValue) {
    print("successfully converted \(myRawValue)")
} else {
    print("no Response")
}

enum TextAligment2 :String {
    case Swift
    case right      = "Objective-C"
    case center     = "C++"
    case justify    = "Java"
}

///方法 --> 方法可以和枚举关联





