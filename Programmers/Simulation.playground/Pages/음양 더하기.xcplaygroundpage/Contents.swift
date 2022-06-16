//: [Previous](@previous)

// 프로그래머스 음양 더하기
import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    let numbers = zip(absolutes, signs).map { (abs, sign) in
        return sign ? abs: -abs
    }
    
    return numbers.reduce(0, +)
}
//: [Next](@next)
