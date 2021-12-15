//: [Previous](@previous)

// 프로그래머스 없는 숫자 더하기
import Foundation

func solution(_ numbers:[Int]) -> Int {
    var sum = 45    // 0~9의 합
    
    numbers.forEach {
        sum -= $0
    }
    
    return sum
}

//: [Next](@next)
