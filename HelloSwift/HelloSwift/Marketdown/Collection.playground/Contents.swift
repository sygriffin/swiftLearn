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

