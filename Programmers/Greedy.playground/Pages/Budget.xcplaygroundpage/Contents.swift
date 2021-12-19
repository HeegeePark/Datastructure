//: [Previous](@previous)

// 프로그래머스 예산
import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let sortedD = d.sorted(by: <)
    var support = 0
    var answer = 0
    
    for dep in sortedD {
        support += dep
        if support > budget { break }
        answer += 1
    }
    
    return answer
}
//: [Next](@next)
