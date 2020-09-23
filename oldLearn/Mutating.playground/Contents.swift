//: Playground - noun: a place where people can play

import Cocoa

//思考：为什么修改结构体和枚举时需要mutating

func greet(name:String, withGreeting greeting:String) -> String {
    return "(\(greeting)\(name)"
}

let personalGreeting = greet(name: "Matt", withGreeting: "Hello")

func greeting(forName name:String) -> (String) -> String {
    func greeting(_ greeting:String) -> String {
        return "\(greeting)\(name)"
    }
    return greeting
}

let greetMattWith = greeting(forName: "Matt")
let mattGreeting = greetMattWith("hello,")
print(mattGreeting)

//更紧凑的函数 -- 运用函数闭包
func greeting1(_ greeting:String) -> (String) -> String {
    return { (name:String) -> String in
        return "\(greeting)\(name)"
    }
}
let friendlyGreetingFor = greeting1("Hello,")
let mattGreeting1 = friendlyGreetingFor("Matt")
print(mattGreeting1)

struct Person {
    var firstName = "Matt"
    var lastName = "Mathis"
    
    mutating func changeTo(firstName:String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var p = Person()
//let changName = Person.changeTo
//let changNameTo = changName(&p)
//changNameTo("John","Lennon")
p.firstName
p.changeTo(firstName: "yang", lastName: "song")
p.firstName



