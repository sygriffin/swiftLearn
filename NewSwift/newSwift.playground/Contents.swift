import Cocoa

//Swift

let fifteen16 = 0xF
let fifteen8 = 0o17
let fifteen2 = 0b1111

let million = 1_000_000
type(of: million)

// 1/3
var oneThirdInFloat: Float = 1/3
var oneThirdInDouble: Double = 1/3

var P_I = 314e-2
var three = 3

type(of: three)

P_I = 3+0.14

//Int和Double类型的的变量相加（要强转类型）

let success = (200, "HTTP_OK") // (Int, String)
let fileNotFound = (404, "HTTP_NOT_FOUND")
success.0
success.1

var (successCode, successMsg) = success

successCode
successMsg

let (_, errMsg) = fileNotFound
errMsg

let redirect:(Int,String) = (302,"11111")

//tuple比较 -- 最多允许包含6个元素的tuple 大小决定于二者第一个不同的元素

let aSign = 20
var bSign = 10

let mod = aSign%bSign

//注意 -- 不允许对浮点数直接%取余，会导致编译错误

8.truncatingRemainder(dividingBy: 2.5)













