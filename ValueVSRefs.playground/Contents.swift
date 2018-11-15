import Cocoa

var str = "Hello, playground"
var playgroundGreeting = str
playgroundGreeting += " How are u today"
str

//此时str并不会改变，此时和值语义有关，值语义将实例赋给新的常量或者变量都会生成副本，把值类型的实例作为参数传递给函数也是一样的

//swift基本类型都是用结构体实现的，所以都是值类型

//引用语义和值语义行为不同，赋值或者传递时会对底层实例创建新的引用

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate");

let anotherHecate = hecate

anotherHecate.name = "Hecate2"
anotherHecate.name
hecate.name
//两个常量都指向同一个实例

//对比常量
struct Pantheon {
    var cheifGod : GreekGod
}

let pantheon = Pantheon(cheifGod: hecate)
let zeus = GreekGod(name: "Zeus")
//pantheon.cheifGod = zeus //声明为常量的值类型不能改变属性
zeus.name = "Zeus Jr."
zeus.name
//值类型不可以改，但是引用类型就可以

//小心值类型内使用引用类型




