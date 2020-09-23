import UIKit
enum RecordType {
    case bool(Bool)
    case number(Int)
    case text(String)
}

let record11 : [String: RecordType] = [
    "uid": .number(11),
    "exp": .number(100),
    "favourite": .bool(false),
    "title": .text("Dict basic")
]

record11["uid"]
//访问不存在的键值时是optional

record11.count
record11.isEmpty
record11.keys

record11.keys.forEach{
    print($0)
}

record11.values

//字典的赋值也是copy的
var record10 = record11
record10["favourite"] = .bool(true)

record11["favourite"]
record10["favourite"]

record10.updateValue(.bool(false), forKey: "favourite")
record10

record10["watchlater"] = .bool(false)
record10


record10["watchlater"] = nil

record10

//遍历
record10.forEach{
    print("\($0) -- \($1)")
}

//字典是无序的集合 -- 若想遍历出有序的，则要先进行排序

record11.keys.sorted().forEach {
    print("\($0) -- \(record11[$0] ?? .text("nil"))")
}


//常用的字典Extension
let defaultRecord : [String: RecordType] = [
    "uid": .number(0),
    "exp": .number(100),
    "favourite": .bool(false),
    "title": .text("")
]

var template = defaultRecord

//差异内容
let record11Patch: [String: RecordType] = [
    "uid": .number(11),
    "title": .text("Common Extension")
]

//template.merge(record11Patch, uniquingKeysWith: <#(RecordType, RecordType) throws -> RecordType#>)

extension Dictionary {
    //dictionary -- struct类型，并且要修改merge，s所以使用mutating
    mutating func merge<S:Sequence>(_ sequence: S)
        where S.Iterator.Element == (key: Key, value:Value) {
            sequence.forEach{self[$0] = $1}
    }
    
    init<S:Sequence>(_ sequence: S)
        where S.Iterator.Element == (key: Key, value:Value) {
            
            self = [:]
            self.merge(sequence)
    }
    
    func mapValue<T>(_ trasform: (Value) -> T) -> [Key: T] {
        return Dictionary<Key, T>(map {($0, trasform($1))})
    }
}

template.merge(record11Patch)

template

let record10Patch:[(key: String, value:RecordType)] = [
    
    (key: "uid", value: .number(10)),
    (key: "title", value: .text("Common dict ext"))

]

var template1 = defaultRecord
template1.merge(record10Patch)
template1

let record11PatchDict = Dictionary(record11Patch)
//print(record11PatchDict)
print("+++++++++++++++++++++++")
//print(record11PatchDict.map{$1})

//全部都转成String
let record111 = record11PatchDict.mapValue{ record -> String in
    
    switch record {
    case .text(let title):
        return title
    case .number(let exp):
        return String(exp)
    case .bool(let favourite):
        return String(favourite)
    }
    
}

print(record111)

//为自定义类型实现Hashable，Key

struct Account {
    var type : Int
    var alias : String
    var createdAt : Date
    
    let INT_BIT = (Int)(CHAR_BIT) * MemoryLayout<Int>.size
    
    func bitWiseRotate(value: Int, bits: Int) -> Int {
        return (value << bits) | (value >> (INT_BIT - bits))
    }
    
}

extension Account: Hashable,Equatable {
    var hashValue: Int {
        
        
        
        return bitWiseRotate(value: type.hashValue, bits: 10)  ^ alias.hashValue ^ createdAt.hashValue
    }
    
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.type == rhs.type &&
               lhs.alias == rhs.alias &&
               lhs.createdAt == rhs.createdAt
    }
    
}

var data :[Account : Int]?

///Key不要使用引用类型 -- 不必要的麻烦


