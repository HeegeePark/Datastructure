//: [Previous](@previous)

import Foundation

var primeNums = [2, 3]

func isPrimeNumber(_ n: String) -> Bool {
    guard let num = Int(n) else { return false }
    
    if num < 4 {    // 2, 3이면 return true
        return num != 1
    }
    
    for i in 2...Int(sqrt(Float(num))) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    // n을 k진수로 바꾸기
    let numbers = String(n, radix: k).split(separator: "0").map { String($0) }
    
    return numbers.filter { isPrimeNumber($0) }.count
}

//: [Next](@next)
