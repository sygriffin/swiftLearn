import UIKit

var vowel: Set<Character> = ["a","e","i","o"]

vowel.count
vowel.isEmpty

vowel.contains("i")

vowel.insert("u")

for character in vowel.sorted() {
    print(character)
}

vowel.forEach{ print($0) }

var setA: Set = [1,2,3,4,5,6]
var setB: Set = [4,5,6,7,8,9]

//交集
let interSectAB = setA.intersection(setB)
//并集
let unionSectAB = setA.union(setB)

//集合对称差
let symmetricDiffAB = setA.symmetricDifference(setB)

//集合A-集合B
let aSubstractB = setA.subtracting(setB)

setA.formIntersection(setB)

extension Sequence where Iterator.Element : Hashable {
    func unique() -> [Iterator.Element] {
        var tmp: Set<Iterator.Element> = []
        return filter {
            
            if tmp.contains($0) {
                return false
            } else {
                tmp.insert($0)
                return true
            }
        }
    }
}

[1,1,3,4,5,6,6,6,7,8].unique()

//IndexSet

let oneToSix: IndexSet = [1,2,3,4,6]

//CharacterSet

let hw = "Hello World"

let numbers = CharacterSet(charactersIn: "123456789")
let letters = CharacterSet.letters

hw.rangeOfCharacter(from: letters)


//理解range与collection的关系
1..<5//[1,5)
5..<5//空区间
1..<Int.max

1...5//[1,5]
5...5//包含一个元素5
1...Int.max

//都遵循Comparable & Strideable

for i in 1...5 {
    print(i)
}
///遍历浮点数区间
for i in stride(from: 1.0, to: 5.0, by: 1.0) {
    print(i)
}

///区间类型在不断地改进和优化




