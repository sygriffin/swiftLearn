//
//  Zombie.swift
//  MonsterTown
//
//  Created by songyang on 2018/6/28.
//  Copyright © 2018年 SY. All rights reserved.
//

import Foundation
//类的主要特性 -- 继承
class Zombie: Monster {
    
    override class var spookyNoise : String {
        return "Brains..."
    }
    
//    var walksWithLimp = true
    var walksWithLimp: Bool
//    private var isFallingApart = false
//    private(set) var isFallingApart = false
    private(set) var isFallingApart: Bool
    init(limp: Bool, fallingApart: Bool, town:Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    //便捷初始化
    convenience init(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee")
        }
    }
    
    required init(town: Town?, monsterName: String) {
        walksWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    //反初始化 类的实例没用之后将其清除内存的过程
    deinit {
        print("Zombie named\(name) is no longer with us")
    }
    
    //禁止重写 -- final
    final override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(by: -10)
        }
        super.terrorizeTown()
    }
    //类的类型方法要用class关键字标记
    //不想被子类重写就用static
    //利用final也可以代替
    /*static&final*/ class func makeSpookeyNoise() -> String {
        return "Brains..."
    }
    
}

//子类可以重写父类方法
class GiantZombie : Zombie {
    override class func makeSpookeyNoise () -> String {
        return "ROAR!!!"
    }
}
//不想让子类继承某个类方法 -- 用static 见上
