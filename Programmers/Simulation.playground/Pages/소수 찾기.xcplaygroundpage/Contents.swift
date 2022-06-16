//: [Previous](@previous)

// 프로그래머스 소수 찾기
import Foundation

var primeNums = [Int]()

func isPrimeNum(_ x: Int) -> Bool {
    for p in primeNums {
        if p > Int((sqrt(Double(x)))) + 1 { break }
        if x % p == 0 && x != p {
            return false
        }
    }
    return true
}

func solution(_ n:Int) -> Int {
    if n == 2 { return 1 }
    primeNums.append(2)
    
    for i in 3...n {
        if isPrimeNum(i) {
            primeNums.append(i)
        }
    }
    
    return primeNums.count
}

//: [Next](@next)
