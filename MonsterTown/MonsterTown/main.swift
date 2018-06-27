//
//  main.swift
//  MonsterTown
//
//  Created by SY on 2018/6/26.
//  Copyright © 2018年 SY. All rights reserved.
//

import Foundation

print("Hello swift")

var myTown = Town()
print("The population is \(myTown.population)")
///直接调用就会报错，在创建类调用也会报错 （值不能摆在那，你必须要用？）
//修改 -- mutating
myTown.changePopulation(by: 500)
myTown.printDescription()

let genericMonster = Monster()
genericMonster.town = myTown
genericMonster.terrorizeTown()



