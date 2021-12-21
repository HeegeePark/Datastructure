//: [Previous](@previous)

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer: [Int] = []
    
    // 1. 서로 다른 인덱스 두 개의 수 합 더하기
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            answer += [numbers[i] + numbers[j]]
        }
    }
    // 2. "arr -> set -> arr"과정을 통한 중복되는 수 제거 및 오름차순 정렬
    answer = Array(Set(answer)).sorted(by: <)
    
    return answer
}

//: [Next](@next)
