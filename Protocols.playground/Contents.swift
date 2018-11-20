import Cocoa

//protocols

//复习的点：函数中使用_：在参数名前使用_会使得函数被调用时省去外部命名。由于这个参数是跟在函数名后面，在调用的时候没有理由用这个名字

//func printTable(_ data: [[String]], withColumnLabels columnLabels:String...) {
//
//    var firstRow = "|"
//
//    for columnLabel in columnLabels {
//        let columnHeader = "\(columnLabel)|"
//        firstRow += columnHeader
//    }
//
//    print(firstRow)
//
//    for row in data {
//        var out = "|"
//        for item in row {
//            out += "\(item)|"
//        }
//        print(out)
//    }
//}
//
//let data = [["Joe","30","6"],["Krane","40","12"],["Fred","50","17"]];
//
//printTable(data, withColumnLabels: "EName","Age","YoE")

//为了能够在实例方法中修改属性值，才有了mutating

protocol TabularDataSource {
    var numberOfRows: Int {get} //只是表示这个协议需要让这个属性可读
    var numberOfColumns: Int {get}
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}


struct Person {
    let name: String
    let age: Int
    let yearOfExperience: Int
}

struct Department : TabularDataSource {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
            case 0: return "EN"
            case 1: return "Age"
            case 2: return "YoE"
            default: fatalError("invalid")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearOfExperience)
        default: fatalError("invalid")
        }
    }
}

var department = Department(name: "Engineering")

department.add(Person(name: "A", age: 20, yearOfExperience: 1))
department.add(Person(name: "B", age: 21, yearOfExperience: 2))
department.add(Person(name: "C", age: 22, yearOfExperience: 3))


func printTable(_ dataSource: TabularDataSource) {
    var firstRow = "|"
    var columnWidths = [Int]()
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        let columnHeader = "\(columnLabel)|"
        firstRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        var out = "|"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            out += "\(item)|"
            
        }
        print(out)
    }
    
}

printTable(department)

//符合协议
/**
 *  所有类型都可以符合协议
 *  一个类型也可以符合多个协议，用逗号分隔
 *
 */
