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
    var walksWithLimp = true
    //禁止重写 -- final
    final override func terrorizeTown() {
        town?.changePopulation(by: -10)
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
