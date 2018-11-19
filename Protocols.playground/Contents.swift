import Cocoa

//protocols

//复习的点：函数中使用_：在参数名前使用_会使得函数被调用时省去外部命名。由于这个参数是跟在函数名后面，在调用的时候没有理由用这个名字

func printTable(_ data: [[String]]) {
    for row in data {
        var out = "|"
        for item in row {
            out += "\(item)|"
        }
        print(out)
    }
}

let data = [["Joe","30","6"],["Krane","40","12"],["Fred","50","17"]];

printTable(data)

