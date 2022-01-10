//: [Previous](@previous)

// 프로그래머스 나머지가 1이 되는 수 찾기
import Foundation

func solution(_ n:Int) -> Int {
    var x = 1
    
    while n % x != 1 {
        x += 1
    }
    
    return x
}

//: [Next](@next)
