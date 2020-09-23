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
let volunteerSorted = volunteerCounts.sorted{$0 < $1}

///作为函数的返回值
//func makeTownGrand() -> (Int, Int) -> Int {
//    func buildRoads(byAddingLights lights : Int, toExistingLights existingLights : Int) -> Int {
//        return lights + existingLights
//    }
//    return buildRoads
//}
//
//var stoplights = 4
//let townPlanByAddingLightsToExistingLights = makeTownGrand()
//stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)

///作为函数参数
func makeTownGrand(withBudget budget : Int, condition :(Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(byAddingLights lights : Int, toExistingLights existingLights : Int) -> Int {
            return lights + existingLights
        }
        return buildRoads
    } else {
        return nil
    }
}

func evaluate(budget:Int) -> Bool {
    return budget > 10_000
}

var stoplights = 4
if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 10_500, condition: evaluate) {
    stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
}

///闭包能捕获变量
func makePopulationTracker(forInitialPopulation population : Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    return populationTracker
}

var currentPopulation = 5_422

let growthBy = makePopulationTracker(forInitialPopulation: currentPopulation)
growthBy(500)
growthBy(500)
currentPopulation = growthBy(500)

///闭包是引用类型 -> 这意味着当你把函数赋值给常量或者变量时，实际上是在让这个常量或者变量指向这个函数

let anotherGrowthBy = growthBy
anotherGrowthBy(500)
//此时growthBy与anotherGrowthBy指向同一个函数，会继续增加
//注意，此时currentPopulation没有变！！！

//记录另一个城市的人口
var bigCityPopulation = 4_098_961
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(10_000)
currentPopulation
//新的人口增长函数与原来独立的，互不影响。所以 currentPopulation 并没有变

///函数式编程
///swift中的高阶函数
///以下全部应用了尾部闭包语法
//1.map(_:) --> 把数组的内容从一个值变换成另一个值
let precinctPopulations = [1244,2020,2157]
let projectedPopulations = precinctPopulations.map {
    (population : Int) -> Int in
    return population * 2
}
projectedPopulations

//2.filter(_:) --> 基于某条件过滤数组
let bigProjections = projectedPopulations.filter{
    (projection : Int) -> Bool in
    return projection > 4000
}
bigProjections

//3.reduce(_:_:) --> 把一组数据约简成一个值并返回
let totalProjection = projectedPopulations.reduce(0) {
    (accumulatedProjection : Int, precinctProjection : Int) -> Int in
    return accumulatedProjection + precinctProjection
}
totalProjection

//此处留有一个疑问，如何更简洁更高效表达一行代码，闭包的高级学习










