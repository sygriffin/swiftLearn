//
//  Monster.swift
//  MonsterTown
//
//  Created by SY on 2018/6/27.
//  Copyright © 2018年 SY. All rights reserved.
//

import Foundation

class Monster {
    static let isTerrifing = true
    class var spookyNoise: String {
        return "Grrr"
    }
    
    var town: Town?
//    var name = "Monster"
    var name: String
    ///读取方法和写入方法
    var victimPool : Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    //必须初始化方法 - 要实现父类的初始化方法，需要在子类的初始化方法实现之前加上required关键字
    required init(town: Town?, monsterName: String) {
        self.town = town
        name = monsterName
    }
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town")
        } else {
            print("\(name) hasn't found a town")
        }
    }
}
