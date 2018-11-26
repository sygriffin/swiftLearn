import Cocoa

//符合Equatable
struct Point : Comparable{
    let x : Int
    let y : Int
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x)&&(lhs.y == rhs.y)
    }
    
    static func <(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x < rhs.x)&&(lhs.y < rhs.y)
    }
    
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)

a == b
a != b


let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

c < d

//扩展：自定义运算符

class Person {
    var name: String
    weak var spouse: Person?
    
    init(name: String, spouse: Person?) {
        self.name = name
        self.spouse = spouse
    }
}

let matt = Person(name: "Matt", spouse: nil)
let drew = Person(name: "Drew", spouse: nil)

infix operator +++

func +++(lhs: Person, rhs: Person) {
    lhs.spouse = rhs
    rhs.spouse = lhs
}

matt +++ drew

matt.spouse?.name
drew.spouse?.name





