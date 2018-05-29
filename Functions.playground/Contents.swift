//: Playground - noun: a place where people can play

import Cocoa

func printGreeting() {
    print("Hello, playground")
}

printGreeting()

///@param



func printUserGreeting(to name : String) {
    print("Hello \(name), welcome to your playground")
}

printUserGreeting(to: "Matt")

///做一个除法
func divisionFunction(dividend : Double, divisor : Double) {
    print("Final result is \(dividend/divisor)")
}

divisionFunction(dividend: 9, divisor: 3)

///变长参数 -- 接受0个或者多个参数



