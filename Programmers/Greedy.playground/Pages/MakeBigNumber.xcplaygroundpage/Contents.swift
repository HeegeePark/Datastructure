//: [Previous](@previous)

// 프로그래머스 큰 수 만들기
import Foundation

func makeBigNumber(_ number: [String], _ k: Int) -> String{
    var stack = [String]()
    var deletedCnt = 0
    
    for i in 0..<number.count {
        while deletedCnt < k && !stack.isEmpty && stack.last! < number[i] {
            stack.removeLast()
            deletedCnt += 1
        }
        
        if deletedCnt >= k {
            stack += number[i...]
            break
        } else {
            stack.append(number[i])
        }
    }
    
    return stack[0..<number.count-k].joined()
}

func solution(_ number:String, _ k:Int) -> String {
    let numberArr = number.map { String($0) }
    
    return makeBigNumber(numberArr, k)
}

//: [Next](@next)
