//
//  Town.swift
//  MonsterTown
//
//  Created by SY on 2018/6/27.
//  Copyright © 2018年 SY. All rights reserved.
//

import Foundation

struct Town {
    
    //属性观察者
    var population = 5_422 {
        didSet (oldPopulation) {
            print("Changed!!! to \(population) from \(oldPopulation)")
        }
    }
    var numberOfStopLights = 4
    
    
    
    func printDescription() {
        print("Population :\(population); number of stopLights:\(numberOfStopLights)")
    }
    //修改 -- mutating
    mutating func changePopulation(by amount:Int) {
        population += amount
    }
    ///新开始--第16章：属性
    ///属性章节新增
    let region = "South"
    //嵌套类型
    enum Size {
        case small
        case medium
        case large
    }
    lazy var townSize : Size = {
        switch self.population {
            case 0...10000 :
                return Size.small
            case 10001...100_000 :
                return Size.medium
            default:
                return Size.large
        }
    }()
    
    var townSize1 : Size {
        get {
            switch self.population {
            case 0...10000 :
                return Size.small
            case 10001...100_000 :
                return Size.medium
            default:
                return Size.large
            }
        }
    }
    
    
}





