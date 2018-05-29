//: Playground - noun: a place where people can play

import Cocoa

//var groceryBag = Set<String>()
//
//groceryBag.insert("Apples")
//groceryBag.insert("grape")

///直接用显式声明
var groceryBag : Set = ["Apples","oranges","grape"]

for food in groceryBag {
    print(food)
}

//集合中是否包含某个元素
groceryBag.contains("bananas")

///并集 -- 合并集合
let friendsBag : Set = ["milk","banana"]
let commonAllBag  = groceryBag.union(friendsBag)

///仍然可以去重
///交集
let anotherBag = Set(["Apples","pairs","melo"])
let crossBag = commonAllBag.intersection(anotherBag)

///swift编译器缓存？反正有问题

///不相交？ -- 检测集合的交集
///此方法判断是否不相交：不相交true、相交false
let disjoit = groceryBag.isDisjoint(with: friendsBag)














