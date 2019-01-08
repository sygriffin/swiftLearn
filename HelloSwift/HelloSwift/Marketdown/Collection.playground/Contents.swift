import UIKit

//Swift集合类型

//Swift 初始化数组

var array1: Array<Int> = Array<Int>()

var array2: [Int] = []

var array3 = array2

var threeInt = [Int](repeating: 3, count: 3)

var sixInt = threeInt + threeInt

var fiveCount = [1,2,3,4,5]
fiveCount[2]

//不推荐使用索引 -- 自己负责区间安全

fiveCount[0...2]

type(of: fiveCount[0..<2])

for value in fiveCount {
    print(value)
}

for (index, value) in fiveCount.enumerated() {
    print("\(index) -- \(value) ")
}

fiveCount.forEach{print($0)}

//修改数组
array1.append(1)
array1 += [2,3,4]
array1.insert(0, at: array1.startIndex)

array1.endIndex

array1.remove(at: 4)

array1.removeLast()//不能remove一个空的

//swift数组
var a = [1,2,3]
let copyA = a

//是copyOnWrite,即copy不会创建新的，只有对其中一个written了一些内容，就copy出来


//泛型 -- 代表数组中的元素
func getBufferAddress<T>(array: [T]) -> String{
    return array.withUnsafeBufferPointer {
        return String(describing: $0)
    }
}
getBufferAddress(array: a)
getBufferAddress(array: copyA)
a.append(4)
getBufferAddress(array: a)
getBufferAddress(array: copyA)

//数组是否可以被修改，是由关键字确定的

//NSArray

//是否可修改 -- 定义不同
//objc -- 引用类型

let b = NSMutableArray(array: [1,2,3])
let copyB: NSArray = b //此时指向同一个引用，修改会伴随发生
let deepCopyB = b.copy() as! NSArray

b.insert(0, at: 0)
copyB
deepCopyB

//用Swift方式使用Array

a.forEach {
    print($0)
}

for (index, value) in a.enumerated() {
    print("\(index) == \(value)")
}

let oneIndex = a.index{ $0 == 1 }
oneIndex

a.filter{ $0 % 2 == 0 }

a.first
a.last
type(of: a.last) //可选类型 -- 可空

a.removeLast()
type(of: a.removeLast()) //Int类型 -- 删除时必须有值
type(of: a.popLast()) //Swift对数组类型理解的是栈数据结构
a.isEmpty

//closure参数化
//objc老式遍历以及取下标操作都不是理想的选择

var fibonacci = [0,1,1,2,3,5]
//var squares = [Int]()
//
//for value in fibonacci {
//    squares.append(value * value)
//}

let constSquares = fibonacci.map{$0 * $0}
constSquares

//自己实现一个map（map 这个概念其实很常用）
extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var tmp: [T] = []
        tmp.reserveCapacity(count)
        
        for value in self {
            tmp.append(transform(value))
        }
        
        return tmp
    }
}


print(fibonacci.myMap{$0 * $0})

fibonacci.min()
fibonacci.max()

fibonacci.filter{
    $0 % 2 == 0
}

fibonacci.elementsEqual([0,1,2], by:{$0 == $1})
fibonacci.starts(with: [0,1,1], by:{$0 == $1})

fibonacci.forEach{
    print($0)
}

fibonacci.sorted(by: >)

let pivot = fibonacci.partition(by: {$0 < 1})

fibonacci[0..<pivot]//满足条件的
fibonacci[pivot..<fibonacci.endIndex]//不满足条件

pivot

fibonacci.reduce(0, +)

var sum = 0
let constSquares2 = fibonacci.map{(fib: Int) -> Int in
    sum += fib
    return fib*fib
}

sum

fibonacci

extension Array {
    func accumulate<T>(_ initial: T, _ nextAccumulate:(T, Element) -> T) -> [T] {
        var sum = initial
        
        return map{
            sum = nextAccumulate(sum, $0)
            return sum
        }
    }
}

fibonacci.accumulate(0, +)

fibonacci = []
fibonacci = [0,1,1,2,3,5]

//filter方法
extension Array {
    func myFilter(_ predicate: (Element) -> Bool) -> [Element] {
        var tmp: [Element] = []
        
        for value in self where predicate(value) {
            tmp.append(value)
        }
        
        return tmp
    }
    
    //不符合条件的
    func reject(_ predicate: (Element) -> Bool) -> [Element] {
        return filter {!predicate($0)}
    }
    
    //可以在这个基础上去定义自己想要的任何特定方法
    
    
}

print(fibonacci.myMap{$0 % 2 == 0})

fibonacci = [0,1,1,2,3,5]
print(fibonacci.myFilter{$0 % 2 == 0})




//reduce


//flatMap

