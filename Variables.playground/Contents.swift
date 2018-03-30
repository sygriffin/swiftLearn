//: Playground - noun: a place where people can play

import Cocoa

/** 第二章：类型，常量与变量
 *  难度：简单
 *  主要内容：类型推断，let,var,\()占位符
 */
//Swift用类型推断来确定变量的类型 -> 类型检查

var numberOfStoplights = "Four"

//numberOfStoplights += 2 //报错，类型不匹配

//:代表 ...是...类型
var numberOfStoplights1 : Int = 4
numberOfStoplights1 += 2
//对必须变化的实例用变量，其他的都用常量
let testA = 3
//赋值
var population :Int
population = 5544
//替换值、插值
let townDeswcription = "This town has \(numberOfStoplights1) stoplights with \(population) population."
//占位符\() -> 相当于OC中%...




