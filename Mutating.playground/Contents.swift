//: Playground - noun: a place where people can play

import Cocoa

//思考：为什么修改结构体和枚举时需要mutating

func greet(name:String, withGreeting greeting:String) -> String {
    return "(\(greeting)\(name)"
}

let personalGreeting = greet(name: "Matt", withGreeting: "Hello")




