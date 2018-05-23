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



