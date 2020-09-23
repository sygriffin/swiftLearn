//: Playground - noun: a place where people can play

var myFirstInt : Int = 0
var mySecInt = 1111
mySecInt = 2222

for _ in 1...5 {
    myFirstInt += 1
    myFirstInt
    print(myFirstInt)
}

///用where代替if在for循环内的判断
for i in 1...100 where i%13 == 0 {
    print(i)
}

myFirstInt = 1;

///while循环 --> 先判断再循环
var i = 1;
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}

///repeat-while 循环 --> 先循环再判断

///重提控制转移语句
///1.使用continue使循环语句就地停止并从头开始循环
///2.使用break退出循环








