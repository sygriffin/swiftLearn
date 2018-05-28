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
var friendsBag : Set = ["milk","banana"]










