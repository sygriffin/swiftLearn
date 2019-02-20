import UIKit

///各种循环和控制语句

//if ... else if ... else && switch

var light = "red"

var action = ""

//尽量用switch去匹配多种情况，更安全，更好表意

switch light {
case "red":
    action = "stop"
default:
    action = "invalid"
}


//for ... in

for number  in 1...10 {
    if (number % 2 != 0) { continue }
    print(number)
}

var i = 0
while i < 10 {
    i += 1
}

repeat {
    
    print(i)
    i -= 1
} while i > 0

//了解swift各种条件匹配方式

let origin = (x:0, y:0)
let pt1 = (x:0, y:0)

//对比两个tuple

//非常规比较方法

if case(0,0) = pt1 {
    print("@origin")
}

switch pt1 {
case (0,0):
    print("@origin")
case (_,0):
    print("@x")
default:
    break
}

let array1 = [1,1,2,2,2]

for case 2 in array1 {
    print("2")
}

enum Direction {
    case north, south, east, west(abbr:String)
}

let west = Direction.west(abbr: "W")
if case .west(let direction) = west {
    print(direction)
}

let skills: [String?] = ["Swift", nil, "PHP", "JavaScript", nil]

for case let skill? in skills {
    print(skill)
}

let smoeValues: [Any] = [1, 1.0, "One"]

for value in smoeValues {
    switch value {
    case let v as Int:
        print("Integer \(v)")
    case is String:
        print("String")
    
    default:
        print("Invalid Value")
    }
}

//高级的样式匹配方式

for i in 1...10 where i%2 == 0 {
    
    print(i)

}

//switch同样适用 where

enum Power {
    case fullyCharged
    case normal(percentage: Double)
    case outOfPower
}

let battery = Power.normal(percentage: 0.1)

switch battery {
case .normal(let percentage) where percentage <= 0.1:
    print("Almost out of power")
case .normal(let percentage) where percentage >= 0.8:
    print("Almost fully charged")
case .fullyCharged, .outOfPower:
    print("Fully charged or out of power")
default:
    print("Normal battery status")
}

if case .normal(let percentage) = battery, case 0.1...1 = percentage { //未实现Equaltable 实现了range约等于value 但却没有反过来实现
    print("Almost out of power")
}

//简化&&
let username = "aaaaa"
let password = "bbbbb"

if case ("aaaaa","bbbbb") = (username, password) {
    
    print("Correct")
    
}

//为什么比较时放在左边 --- 关于swift样式匹配规则及实现

//
func ~=<T>(value: T, pattern: ClosedRange<T>) -> Bool {
    return pattern.contains(value)
}

if case .normal(let percentage) = battery, case percentage = 0.1...1 { //未实现Equaltable 实现了range约等于value 但却没有反过来实现
    print("Almost out of power")
}

