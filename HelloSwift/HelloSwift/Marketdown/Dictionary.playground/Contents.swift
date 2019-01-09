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
    print("\($0) -- \(record11[$0]!)")
}





