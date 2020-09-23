import Cocoa

//协议支持类型的一个相关特性：关联类型
struct StackIterator<T>: IteratorProtocol {
//    typealias Element = T
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
    
}

struct Stack <Element>: Sequence {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
    
    func map<U>(_ f:(Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
    
    mutating func pushAll<S: Sequence>(_ sequence: S)
                  where S.Iterator.Element == Element {
        for item in sequence {
            self.push(item)
        }
    }
    
//    mutating func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element] {
//        var items : [Element]()
//
//    }
}



//特化
var intStack = Stack<Int>()

intStack.push(1)
intStack.push(2)

var doubledStack = intStack.map{2*$0}
doubledStack.pop()

//把Stack变成泛型 -- 可以存任何类型

var stringStack = Stack<String>()
stringStack.push("A")
stringStack.push("B")

//泛型函数和方法
//数组中的map(_:)方法 -- 变换所有内容

func myMap<T,U>(_ items:[T], _ f:(T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one","two","three"]
let stringLengths = myMap(strings){$0.count}

print(stringLengths)

//关于闭包的温故
/**
 *  编译器知道函数接受一个闭包，而闭包本身接受两个参数，而且类型也是相同的。这个时候就可以用$0引用第一个参数值（需要一个参数，就一个；多个依次向后排）
 *  简化代码：尾随闭包，会让方法更简洁
 */

//由于默认的泛型使用时对具体类型是一无所知的，所以无法检查两个泛型是否相等 ==> 很难描述两个闭包相等这种概念，因为swift也不允许这种比较进行
//为了解决这种问题，Swift提供了类型约束

//类型约束
func checkIfEqual<T:Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second;
}

checkIfEqual(1, 1)



func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

checkIfDescriptionsMatch(Int(1), Int(1))


//关联类型协议
//重点：协议是不可以泛型的！！！
var myStack = Stack<Int> ()
myStack.push(10)
myStack.push(20)

var myStackIterator = StackIterator(stack: myStack)
while let value = myStackIterator.next() {
    print("go \(value)")
}
for value in myStack {
    print("for-in loop got \(value)")
}

//如果协议有关联类型，那么这个协议就不能用作具体类型
//有关联类型的协议对于在泛型声明中使用where子句至关重要

//mutating 为了在方法中修改Struct或者Enum

var myOtherStack = Stack<Int>()
myOtherStack.pushAll([1,2,3])
myStack.pushAll(myOtherStack)

