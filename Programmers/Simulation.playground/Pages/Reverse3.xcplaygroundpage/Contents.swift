//: [Previous](@previous)

// 프로그래머스 3진법 뒤집기
import Foundation

func solution(_ n:Int) -> Int {
    let nTo3 = String(n, radix: 3)
    let reversedN = String(nTo3.reversed())
    
    return Int(reversedN, radix: 3)!
}

//: [Next](@next)
