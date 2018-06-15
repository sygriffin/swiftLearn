//: Playground - noun: a place where people can play

import Cocoa

///closures 闭包

let volunteerCounts = [1,3,40,32,2,53,77,13]

//func sortAscending(_ i : Int, _ j : Int) -> Bool {
//    return i < j
//}

//let volunteerSorted = volunteerCounts.sorted()

//let volunteerSorted2 = volunteerCounts.sorted(by: sortAscending)

///闭包表达式的语法一般为：
/**
 {(parameters) -> return type in
 
 }
 *
 */

//故，以上代码可以替换为 -- 稍微优雅一些 （利用内联闭包）
//let volunteerSorted = volunteerCounts.sorted(by: {
//    (i : Int,j : Int) -> Bool in
//    return i < j
//})

//利用类型推断进一步优化代码
//let volunteerSorted = volunteerCounts.sorted(by: {i,j in i<j})
//利用参数的快捷语法
//let volunteerSorted = volunteerCounts.sorted(by:{$0 < $1})
//还可以更简洁 -- 作为函数最后一个参数的内联闭包
//let volunteerSorted = volunteerCounts.sorted{$0 < $1}








