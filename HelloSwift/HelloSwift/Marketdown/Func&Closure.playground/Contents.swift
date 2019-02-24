import UIKit

//使用func和closure加工数据

//复习了一下函数
//func printName() {
//    print("My name is 111")
//}
//
//printName()
//
//func mul (_ m : Int,_ n : Int = 1) {
//    print(m * n)
//}
//
//mul(2, 3)
//
//mul(2)
//
//func mul1 (result: inout Int, _ numbers: Int ...) {
//    result = numbers.reduce(1, *)
//    print(numbers.reduce(1, *))
//}
//
//var result = 0
//
//mul1(result: &result, 1,2,3,4,5)
//
//func mul2 (_ numbers: Int ...) -> Int {
//
//    print(numbers.reduce(1, *))
//
//    return numbers.reduce(1, *)
//}
//
//var result2 = mul2(1,2,3,4,5)
//print(result2)

func mul(m: Int, n:Int) -> Int {
    
    return m * n
}

let fnMul = mul

//fnMul(m: 2, n: 3) -- 编译会报错

fnMul(2,3)

print(type(of: mul))
print(type(of: fnMul))

///参数签名 不包含在 类型里，（参数名）函数签名已经不再是函数的一部分

func div (a: Int, b:Int) -> Int {
    return a/b
}

// -- swift2 中是不会报错的 本来是除法变成了 乘法
//var fndiv: (a: Int,b: Int) -> Int = div
//
//fndiv = mul
//
//fndiv(2,3)

func calc<T> (_ first: T, _ second:T, _ fn:(T, T) -> T) -> T {
    return fn(first,second)
}

calc(2, 3, mul)

//重载mul

func mul(_ a: Int) -> (Int) -> Int {
    func innerMul(_ b: Int) -> Int {
        return a * b
    }
    return innerMul
}

let mul2By = mul(2)
mul2By(3)

mul(2)(3) //->直接串联内嵌函数参数

///closure --> 强化



