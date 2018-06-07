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

func printPersonalGreeting(to names: String...) {
    print("Hello \(names), welcome to playgrounds!!")
}

printPersonalGreeting(to:"aaa","bbb")

///默认参数 -- withPunctuation
func divisionFunction1(dividend : Double, divisor : Double, withPunctuation : String = ".") {
    print("Final result is \(dividend/divisor)\(withPunctuation)")
}
//默认为.
divisionFunction1(dividend: 9, divisor: 3)
//改成了！
divisionFunction1(dividend: 9, divisor: 3, withPunctuation: "!")

///in-out 参数
//函数有时需要修改实参的值 in-out参数能让函数影响函数体以外的变量
var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString :inout String) {
    if code == 400 {
        errorString += "bad request"
    }
    if code == 200 {
        error = "request success"
    }
}

appendErrorCode(400, toErrorString: &error)
error

///从函数返回  -> SomeType 函数会返回相应的实例类型
func divisionFunction2(dividend : Double, divisor : Double, withPunctuation : String = ".") -> String {
    return "Final result is \(dividend/divisor)\(withPunctuation)"
}

print(divisionFunction2(dividend: 9, divisor: 3, withPunctuation: "*"))

///嵌套函数和作用域
func areaOfTrailingWith(base:Double, height:Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator/2
    }
    return divide()
}

areaOfTrailingWith(base: 3, height: 5)

///带有多个返回值
func sortedEvenOddNumbers(_ numbers:[Int]) -> (evens :[Int], odds :[Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return(evens,odds)
}

let aBunchOfNum = [10,1,3,4,45,35,86,37,156,211,122]
let theSortedNum = sortedEvenOddNumbers(aBunchOfNum)
theSortedNum.evens
theSortedNum.odds

///函数的可空返回类型
func grabMiddleName(fromFullName name:(String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Matt",nil,"Barens"))
///可空实例绑定值不为真，所以括号内print不会执行
if let theName = middleName {
    print(theName)
} else {
    print("不执行")
}

///提前退出函数

//guard语句 -- 与if/else语句一样，guard语句会根据某个表达式返回bool结果值来执行代码
//            不同之处是如果某些条件没满足，guard语句可以提前退出函数

//guard语句也支持多重条件的
func greetByMiddleName(formFullName name:(first :String,middle:String?,last:String)){
    guard let middleName = name.middle, middleName.count > 4 else {
        print("Hey , there")
        return
    }
    print("Hey,\(middleName)")
}

greetByMiddleName(formFullName:("Matt","Dan","Huges"))

///函数类型 --> 由函数参数和返回值决定 -- 后续继续进行深入的探讨


///关于void






















