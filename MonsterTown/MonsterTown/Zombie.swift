//
//  Zombie.swift
//  MonsterTown
//
//  Created by songyang on 2018/6/28.
//  Copyright © 2018年 SY. All rights reserved.
//

import Foundation

class Zombie: Monster {
    var walksWithLimp = true
    //禁止重写 -- final
    final override func terrorizeTown() {
        town?.changePopulation(by: -10)
        super.terrorizeTown()
    }
    
}
