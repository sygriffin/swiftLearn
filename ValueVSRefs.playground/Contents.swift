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
pantheon.cheifGod.name

let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.cheifGod.name

//强烈建议在大部分情况下都不要在值类型内使用引用类型

let athena = GreekGod(name: "Athena");
let gods = [athena,hecate,zeus]
let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy
//此时状态就是浅复制，浅复制不会创建实例的不同副本，只是复制这个实例的引用
//swift并没有提供深复制的方法，需要的话必须自己编写

//引用类型需要检查两个常量的同一性 --> 用===判断是否指向同一引用
athena === hecate

///关于是用结构体还是用类的讨论
/**
 *  如果类型需要传值，那就用结构体
 *  类型不支持子类继承，那就用结构体
 *  表达行为直观并且包含一些简单值，优先考虑使用结构体
 *  其余都是类
 */

//深入研究 -- 写时复制 copy on write -- swift容器已经支持写时复制，不需要自己去实现了
fileprivate class IntArrayBuffer {
    var sortage: [Int]
    
    init() {
        sortage = []
    }
    init(buffer: IntArrayBuffer) {
        sortage = buffer.sortage
    }
}

struct IntArray {
    private var buffer : IntArrayBuffer
    
    init() {
        buffer = IntArrayBuffer()
    }
    
    func describe() {
        print(buffer.sortage)
    }
    
    private mutating func copyIfNeeded() {
        if !isKnownUniquelyReferenced(&buffer) {
            print("making a copy of \(buffer.sortage)")
            buffer = IntArrayBuffer(buffer: buffer)
        }
    }
    
    mutating func insert(_ value: Int, at index: Int) {
        copyIfNeeded()
        buffer.sortage.insert(value, at: index)
    }
    
    mutating func append(_ value: Int) {
        copyIfNeeded()
        buffer.sortage.append(value)
    }
    
    mutating func remove(at index: Int) {
        copyIfNeeded()
        buffer.sortage.remove(at:index)
    }

    
}


var integers = IntArray()
integers.append(1)
integers.append(2)
integers.append(4)
integers.describe()

var ints = integers
ints.insert(3, at: 2)
integers.describe()
ints.describe()





