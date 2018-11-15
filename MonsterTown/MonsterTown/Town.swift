//
//  Town.swift
//  MonsterTown
//
//  Created by SY on 2018/6/27.
//  Copyright © 2018年 SY. All rights reserved.
//

import Foundation

/** 属性类型
 *  存储类型（不可变类型）static
 *  计算类型（可变类型）class
 */

struct Town {
    
    //属性观察者
    var population :Int {
        didSet (oldPopulation) {
            print("Changed!!! to \(population) from \(oldPopulation)")
        }
    }
    var numberOfStopLights : Int
    
    
    

    //修改 -- mutating
    mutating func changePopulation(by amount:Int) {
        population += amount
    }
    ///新开始--第16章：属性
    ///属性章节新增
    ///region改为存储类型属性 +static
    let region : String
    
    func printDescription() {
        print("Population :\(population); number of stopLights:\(numberOfStopLights); region:\(region)")
    }
    
    
    //添加成员初始化方法 init?可空类型初始化，只在必要情况下才使用可空类型
    init?(region: String, population: Int, stoplights: Int) {
        
        guard population > 0 else {
            return nil
        }
        self.region = region
        self.population = population
        numberOfStopLights = stoplights
    }
    
    //委托初始化
    init?(population: Int, stoplights: Int) {
        self.init(region: "N/A", population: population, stoplights: stoplights)
    }
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
    //计算属性
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





