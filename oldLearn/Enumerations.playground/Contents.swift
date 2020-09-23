//: Playground - noun: a place where people can play

import Cocoa

enum TextAligment {
    case left
    case right
    case center
    case justify
}

var aligment: TextAligment = TextAligment.left
var aligment1 = TextAligment.left
aligment = .right
if aligment == .right {
    print("we should right-align the text")
}

switch aligment {
case .left:
    print("left-aligned")
case .right:
    print("right-aligned")
default:
    print("default")
}

///原始值enum --> 类似C/C++的枚举
enum TextAligment1 :Int {
    case left       = 20
    case right      = 30
    case center     = 40
    case justify    = 50
}

//把原始值转化为枚举类型
let myRawValue = 20
let myAligment = TextAligment1(rawValue: myRawValue)
if let myAligment = TextAligment1(rawValue: myRawValue) {
    print("successfully converted \(myRawValue)")
} else {
    print("no Response")
}

enum TextAligment2 :String {
    case Swift
    case right      = "Objective-C"
    case center     = "C++"
    case justify    = "Java"
}

///方法 --> 方法可以和枚举关联
enum Lightbulb {
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature amnient:Double) -> Double {
        switch self {
        case .on:
            return amnient + 150.0
        case .off:
            return amnient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var bulb = Lightbulb.on
let ambientTemperature = 77.0
var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)

bulb.toggle()
bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)

///关联值 --> 带关联值的枚举
enum ShapeDimensions {
    case point
    case square(side : Double)
    case rectangle(width: Double, height: Double)
    ///利用关联值计算面积
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width:w , height:h):
            return w*h
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.point

squareShape.area()
rectShape.area()
pointShape.area()

///递归枚举

//尝试定义族谱树
//无限递归问题
//enum FamilyTree {
//    case noKnownParents
//    case oneKnownParent (name:String,ancestors:FamilyTree)
//    case twoKnownParents (fatherName:String,fatherAncestors:FamilyTree,motherName:String,motherAncestors:FamilyTree)
//}

/*indirect*/
enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParent (name:String,ancestors:FamilyTree)
    indirect case twoKnownParents (fatherName:String,fatherAncestors:FamilyTree,motherName:String,motherAncestors:FamilyTree)
}

///Fred族谱树形结构递归模型
let fredAncestors = FamilyTree.twoKnownParents(fatherName:"Fred Sr.", fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents), motherName: "Marsha", motherAncestors: .noKnownParents)




