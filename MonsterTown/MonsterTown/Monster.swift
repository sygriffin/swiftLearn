//
//  Monster.swift
//  MonsterTown
//
//  Created by SY on 2018/6/27.
//  Copyright © 2018年 SY. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
    var name = "Monster"
    ///读取方法和写入方法
    var victimPool : Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town")
        } else {
            print("\(name) hasn't found a town")
        }
    }
}
