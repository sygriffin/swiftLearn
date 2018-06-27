//
//  Town.swift
//  MonsterTown
//
//  Created by SY on 2018/6/27.
//  Copyright © 2018年 SY. All rights reserved.
//

import Foundation

struct Town {
    var population = 5_422
    var numberOfStopLights = 4
    
    func printDescription() {
        print("Population :\(population); number of stopLights:\(numberOfStopLights)")
    }
    //修改 -- mutating
    mutating func changePopulation(by amount:Int) {
        population += amount
    }
}
