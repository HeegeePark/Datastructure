//: [Previous](@previous)

// 프로그래머스 로또의 최고 순위와 최저 순위
import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var notLost = lottos.filter { $0 != 0 }
    var maxRank = 7
    var minRank = 7
    
    // 최저 순위
    for num in win_nums {
        guard notLost.contains(num) else { continue }
        minRank -= 1
    }
    
    // 최고 순위
    let lostCount = 6 - notLost.count
    maxRank = minRank - lostCount
    
    minRank = minRank == 7 ? 6: minRank
    maxRank = maxRank == 7 ? 6: maxRank
    
    return [maxRank, minRank]
}

//: [Next](@next)
