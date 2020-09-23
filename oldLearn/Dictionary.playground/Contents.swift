//: Playground - noun: a place where people can play

import Cocoa

///创建字典
var dict1 : Dictionary <String, Double> = [:]
var dict2 = Dictionary <String, Double>()
var dict3 : [String : Double] = [:]
var dict4 = [String : Double]()
//均为Key为str Value为double

var movieRatings = ["Donnie Darko":4, "Chungking Express":5, "Dark City":6]
movieRatings.count
movieRatings["Dark City"]
movieRatings["Dark City"] = 7 ///直接修改值
let braveRating = movieRatings["Brave Heart"]
movieRatings.updateValue(8, forKey: "Dark City")
movieRatings["Dark City"]
///给一个不存在的键赋值就是添加
movieRatings["Brave Heart"] = 4
movieRatings.removeValue(forKey: "Dark City")
///置为nil也是将值删除的一种
movieRatings["Chungking Express"] = nil

for (key, value) in movieRatings {
    print("The movie named \(key) was rated\(value)")
}

///只访问Key
for (movie) in movieRatings.keys {
    print("User has rated movie \(movie)")
}

///不可变字典
let album = ["Diet":230]

///将字典转换为数组
let watches = Array(movieRatings.keys)





