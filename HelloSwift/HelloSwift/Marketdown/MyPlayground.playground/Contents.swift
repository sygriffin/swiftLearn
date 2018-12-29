import UIKit

//: # Heading1

/*:
 * title1
 * title2
 */


let cafe = "Caf\u{00e9}"

let cafe1 = "Caf\u{0065}\u{0301}"



cafe.count
cafe1.count

//In swift4 -- no characters

cafe.utf8.count
cafe1.utf8.count

//和UTF8相比，声调符号和Caf\u{00e9}的utf16编码1位表示就够了
cafe.utf16.count
cafe1.utf16.count

cafe == cafe1

let nsCafe = NSString(characters: [0x43,0x61,0x66,0xe9], length: 4)
let nsCafe1 = NSString(characters: [0x43,0x61,0x66,0x65,0x0301], length: 5)

nsCafe.length
nsCafe1.length

nsCafe == nsCafe1

//这样比较
let result = nsCafe.compare(nsCafe1 as String)
result == .orderedSame

let circleCafee = cafe + "\u{20dd}"
circleCafee.count

//extension String: Collection {
//
//}

var swift = "Swift is fun"
swift.dropFirst(9)

//Swift 已经进行优化
cafe1.dropFirst(4)
cafe1.dropLast()

cafe1.unicodeScalars.forEach{ print($0)}
cafe1.utf8.forEach{ print($0)}
cafe1.utf16.forEach{ print($0)}

//问题位置 -- 用String包起来
String(cafe1.unicodeScalars.dropLast())
String(cafe1.utf8.dropLast())
String(cafe1.utf16.dropLast())


cafe1.startIndex.encodedOffset
cafe1.endIndex.encodedOffset

let index = cafe1.index(cafe1.startIndex, offsetBy: 3, limitedBy: cafe1.endIndex)

cafe1[index!]

extension String {
    subscript(index: Int) -> Character {
        guard let index = self.index(startIndex, offsetBy: index, limitedBy: endIndex) else {
            fatalError("Out of range")
        }
        return self[index]
    }
}

cafe1[3]

//不像以上实现 -> O(n^2)的时间复杂度，l开销太大

let beg = cafe1.startIndex
let end = cafe1.index(beg, offsetBy: 3)
cafe1[beg ..< end]
cafe1.prefix(3)

var mixStr = "Swift很有趣"
for (index, value) in mixStr.enumerated() {
    print("\(index)\(value)")
}

if let index = mixStr.index(of: "很") {
    mixStr.insert(contentsOf: " 3.0", at: index)
}
if let cnIndex = mixStr.index(of: "很") {
    mixStr.replaceSubrange(cnIndex ..< mixStr.endIndex, with: " is interesting!")
}
mixStr.suffix(12).dropLast()

mixStr.split(separator: " ").map(String.init)

var i = 0

mixStr.split{ _ in
    if i > 0 {
        i = 0
        return true
    }
    else {
        i += 1
        return false
    }
}.map(String.init)









