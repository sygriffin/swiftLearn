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

switch statusCode1 {
case 100,101:
    statusString1 += "1xx,\(statusCode1)"
case 300...307:
    statusString1 += "redirection , \(statusCode1)"
case 500...505:
    statusString1 += "server error \(statusCode1)"
case let unknowCode :
    statusString1 = "\(unknowCode) is not a known code"
}

///用default屏蔽所有不可能存在的情况











