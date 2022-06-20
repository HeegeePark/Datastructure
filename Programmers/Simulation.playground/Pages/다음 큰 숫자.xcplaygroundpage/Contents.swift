//: [Previous](@previous)

import Foundation

func getCountOf1(_ n: Int) -> Int {
    return String(n, radix: 2).filter { $0 == "1" }.count
}

func solution(_ n:Int) -> Int {
    let nCnt1 = getCountOf1(n)
    var answer = n + 1
    
    while true {
        if getCountOf1(answer) == nCnt1 {
            break
        }
        answer += 1
    }
    
    return answer
}

//: [Next](@next)
