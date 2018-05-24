//: Playground - noun: a place where people can play

import Cocoa

///初始化
//var bucketList : Array <String>
//var bucketList : [String] = ["climb MT. Everest"]
var bucketList = ["climb MT. Everest"]

///增加
bucketList.append("Fly hot air ballon to Fill1")
bucketList.append("Fly hot air ballon to Fill2")
bucketList.append("Fly hot air ballon to Fill3")
bucketList.append("Fly hot air ballon to Fill4")

///删除
bucketList.remove(at: 2)
bucketList

///查
bucketList.count
bucketList[0...2]

///改
bucketList[2] += "In State"
bucketList
bucketList[0] = "Climb Mt.Kilimanjaro"
bucketList

///用赋值运算符新增
var newItems = [
    
    "Let us go Maiami",
    "Let us go Alaska"
]
bucketList += newItems
bucketList

///插入
bucketList .insert("Toboggan across Alaska", at: 2)
bucketList

///检查两个数组是否相等
///比较相等时，因为数组是有序的，所以顺序不同，元素一致，也会判定为两个数组不相等
let equal = (bucketList == newItems)

///不可变数组
let lunches = ["pizza","burger","hotdog"]
//--> 不可变，改了就会报错
//lunches .insert("ice", at: 2)

///好好利用文档











