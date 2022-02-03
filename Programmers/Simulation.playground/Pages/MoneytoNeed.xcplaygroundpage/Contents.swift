//: [Previous](@previous)

// 프로그래머스 부족한 금액 계산하기
import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var fee = 0
    
    for i in 1...count {
        fee += price * i
    }
    var answer = fee > money ? fee - money: 0
    
    return Int64(answer)
}

//: [Next](@next)
