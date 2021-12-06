//: [Previous](@previous)

import Foundation

func isNumOfDivisorOdd(_ n: Int) -> Bool {
    var count = 0
    
    for i in 1...n {
        if n % i == 0 { count += 1 }
    }
    return count % 2 != 0 ? true: false
}

func solution(_ left:Int, _ right:Int) -> Int {
    var answer = 0
    
    for i in left...right {
        if isNumOfDivisorOdd(i) {
            answer -= i
        } else {
            answer += i
        }
    }
    return answer
}

//: [Next](@next)
