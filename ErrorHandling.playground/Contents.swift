import Cocoa

enum Token {
    case number(Int)
    case plus
}

//构建分析器
class Lexer {
    
    //与系统类命名相同，用Swift.指定使用标准库k类型，避免编译器认为调用自己
    enum Error : Swift.Error {
        case invalidCharacter(Character)
    }
    
    let input: String
    var position:String.Index
    
    init(input: String) {
        self.input = input
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        //添加断言检查advance只有在还没到达输入终点时调用
        assert(position < input.endIndex, "Cannot advance past endIndex")
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                let digitValue = Int(String(nextCharacter))! //危险慎用！！！强制展开可空实例（返回nil拆包，爆炸）
                value = 10*value+digitValue
                advance()
            default: return value
            }
        }
        
        return value
    }
    
    //assert(_:_:) 第一个参数为检查条件，第二个参数为提供的消息
    //在release发布到App Store版本 Xcode会优化并删除所有assert
    //想在发布版本保留就用precondition
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                let value = getNumber()
                tokens.append(.number(value))
            case "+":
                tokens.append(.plus)
                advance()
            case " ": advance()
            default: throw Lexer.Error.invalidCharacter(nextCharacter)
            }
        }
        return tokens
    }
    

    
    
}

func evaluate(_ input: String) {
    print ("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output :\(tokens)")
    }
    catch Lexer.Error.invalidCharacter(let character){
        print("Input contained an invalid character: \(character)")
    }
    catch {
        print("An error occured: \(error)")
    }
    
}

evaluate("10 + 3 + 5")
//evaluate("1 + 2 + ASDSA")

//解析符号数组






