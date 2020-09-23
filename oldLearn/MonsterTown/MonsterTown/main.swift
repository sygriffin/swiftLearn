//
//  main.swift
//  MonsterTown
//
//  Created by SY on 2018/6/26.
//  Copyright © 2018年 SY. All rights reserved.
//

import Foundation

print("Hello swift")

///17章节--初始化
//此时是空初始化
//var myTown = Town(region: "West", population: 10000, stoplights: 6)

var myTown = Town(population: 0, stoplights: 6)
//使用成员初始化
//下面这个写法会报错
//var myTown = Town(population: 10_000, numberOfStopLights:6)
//var myTown = Town(population: 10_000, numberOfStopLights: <#T##Int#>, townSize: <#T##Town.Size?#>)

print("The population is \(myTown?.population)")
print("The region is \(myTown?.region)")

///直接调用就会报错，在创建类调用也会报错 （值不能摆在那，你必须要用？）
//修改 -- mutating
myTown?.changePopulation(by: 500)
//myTown.printDescription()
//
//let genericMonster = Monster()
//genericMonster.town = myTown
//genericMonster.terrorizeTown()

//let fredTheZombie = Zombie()
var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town:myTown, monsterName:"Fred")
//fredTheZombie.town = myTown
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()


//便捷初始化
var convenientZombie = Zombie(limp: true, fallingApart: false)



///深入学习--类型方法-->对定义类型本身调用的方法
//1.对于值类型，要声明类型方法需要使用static关键字
struct Square {
    static func numberOfSides() -> Int {
        return 4
    }
}
//2.类的类型方法要用class关键字标记
//详见Zombie.swift
//直接调用类方法
let spookeyNoise = Zombie.makeSpookeyNoise()
print("\(Zombie.spookyNoise)")
//3.不想让子类继承某个类方法
//详见Zombie.swift

//类方法既不能调用实例方法，也不能使用实例属性

///深入学习 -- mutating方法

///新开始--第16章：属性
let myTownSize = myTown?.townSize
print(myTownSize)
myTown?.changePopulation(by: 1_000_000)
let myTownSize1 = myTown?.townSize
//即使改变了population，size也不会改变了
print(myTownSize1)

//使用victimPool
print("Victim Pool : \(String(describing: fredTheZombie?.victimPool))")
fredTheZombie?.victimPool = 500
print("Victim Pool : \(String(describing: fredTheZombie?.victimPool))")



if Zombie.isTerrifing {
    print("run away!!!")
}

fredTheZombie = nil

///访问控制
//open - public - internal(默认) - fileprivate - private









