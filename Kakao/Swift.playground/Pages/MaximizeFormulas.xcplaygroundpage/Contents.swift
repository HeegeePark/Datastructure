//: [Previous](@previous)

// 2020 카카오인턴십 최대 수식화
import Foundation

let operators = ["*", "+", "-"]
var prioritys = [[String]]()
func calculate(_ op: [String], _ exp: [String]) -> Int64 {
    var expression = exp
    op.forEach {
        while expression.contains($0) {
            let idx = expression.firstIndex(of: $0)!
            let operand = expression.remove(at: idx + 1)
            
            switch $0 {
            case "*":
                expression[idx - 1] = String(Int(expression[idx - 1])! * Int(operand)!)
            case "+":
                expression[idx - 1] = String(Int(expression[idx - 1])! + Int(operand)!)
            default:
                expression[idx - 1] = String(Int(expression[idx - 1])! - Int(operand)!)
            }
            expression.remove(at: idx)
        }
    }
    return abs(Int64(expression.first!)!)
}

func orderOperators(_ order: [String], _ depth: Int, _ checked: [Bool]) {
    if depth == operators.count {
        prioritys += [order]
        return
    }
    
    for i in 0..<operators.count {
        if !checked[i] {
            var newChecked = checked
            newChecked[i] = true
            orderOperators(order + [operators[i]], depth + 1, newChecked)
        }
    }
}

func solution(_ expression:String) -> Int64 {
    var expArr = [String]()
    var temp = ""
    var checked = [Bool](repeating: false, count: 3)
    var answer: Int64 = 0
    
    expression.forEach {
        if !$0.isNumber {
            let op = String($0)
            expArr.append(temp)
            expArr.append(op)
            temp = ""
        } else {
            temp.append($0)
        }
    }
    expArr.append(temp)
                   
    for i in 0..<operators.count {
        checked[i] = true
        orderOperators([operators[i]], 1, checked)
        checked[i] = false
    }
    
    prioritys.forEach {
        let num = calculate($0, expArr)
        answer = num > answer ? num: answer
    }
    
    return answer
}

//: [Next](@next)
