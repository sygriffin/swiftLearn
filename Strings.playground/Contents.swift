//: Playground - noun: a place where people can play

let playground = "Hello Playground"
var mutablePlayground = "Hello mutablePlayground"
mutablePlayground += "!"

///swift 字符串都是Character类型，表示Unicode字符

//mutablePlayground.characters --> .characters API已经废弃！！！直接使用变量声明名称即可

for _:Character in mutablePlayground {
    
}

let oneUnicode = "\u{1F60E}"

let 你好 = "111"
你好

var 👌 = "5465复合肥黑胡椒粉"
///均用Unicode完成， 所以都是唯一

///标准等价：两个Unicode序列在语言学上是否等价

let Acute = "\u{00E1}"
let Bcute = "\u{0061}\u{0301}"

let real = (Acute == Bcute)

///字符串内的计算，虽然是类似数组，但不可以用下标直接访问
///都要在这个索引中去寻找，利用下边每次遍历全部开销巨大
 
let start  = playground.startIndex
let end = playground.index(start, offsetBy: 4)
let fifthChar = playground[end]

let range = start...end
let firstFifthChar = playground[range]








