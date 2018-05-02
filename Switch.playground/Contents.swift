//: Playground - noun: a place where people can play

import Cocoa

//Switch

var statusCode : Int = 404
var statusString : String = "The request failed:"

switch statusCode {
//case 400:
//    statusString = "Bad Request"
//case 401:
//    statusString = "Unauthorized"
//case 404:
//    statusString = "Not Found"
//default:
//    statusString = "NONE"
    
case 400,401,402,404:
    statusString = "something wrong with request"
    fallthrough
default:
    statusString += "TRY AGAIN"
}
//fallthrough 状态转移语句：修改控制流中代码的执行顺序

//区间
var statusCode1 : Int = 200
var statusString1 : String = "The request failed with the error:"

//switch statusCode1 {
//case 100,101:
//    statusString1 += "1xx"
//case 300...307:
//    statusString1 += "redirection 3xx"
//case 500...505:
//    statusString1 += "server error 5xxx"
//default:
//    statusString1 = "Unknow try again"
//}

//300...307 区间匹配

//值绑定（类似于OC中的%@，%p...）

///用default屏蔽所有不可能存在的情况

///用where去创建筛选条件（只要不使用fallthrough找到匹配分支执行完匹配代码就停止了）

switch statusCode1 {
case 100,101:
    statusString1 += "1xx,\(statusCode1)"
case 300...307:
    statusString1 += "redirection , \(statusCode1)"
case 500...505:
    statusString1 += "server error \(statusCode1)"
case let unknowCode where (unknowCode >= 200 && unknowCode < 300):
    statusString1 = "\(unknowCode) is not a known code"
default :
    statusString1 = "UnExpected ERROR!!!"
}

///元组和模式匹配 --> 元组是开发者认为具有逻辑关联的两个或者多个值的有限新组合

let error = (code:statusCode1, error:statusString1)
error.code
error.error

///模式匹配--> 利用元组去进行模式匹配

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode,secondErrorCode)

switch errorCodes {
case (404,404) :
    print("No items found!!!")
case (404, _) :
    print("First item not found!!!")
case (_, 404) :
    print("Second item not found!!!")
default:
    print("All items found!!!")
}













