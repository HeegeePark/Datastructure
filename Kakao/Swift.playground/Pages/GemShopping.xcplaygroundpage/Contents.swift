//: [Previous](@previous)

// 2020 카카오 인턴십 보석 쇼핑
import Foundation

func solution(_ gems:[String]) -> [Int] {
    let n = Set(gems).count    // 보석 종류 수
    var start = 0
    var end = 0
    var gemsDict: [String: Int] = [gems[end]: 1]
    var minRange = 99999
    var isSatisfied: Bool {
        gemsDict.count == n
    }
    var answer = [Int]()
    
    while start < gems.count && end < gems.count {
        if isSatisfied {
            if end - start < minRange {
                minRange = end - start
                answer = [start + 1, end + 1]
            }
            gemsDict[gems[start]]! -= 1
            if gemsDict[gems[start]] == 0 {
                gemsDict.removeValue(forKey: gems[start])
            }
            start += 1
        } else {
            if end + 1 >= gems.count { break }
            end += 1
            gemsDict[gems[end], default: 0] += 1
        }
    }
    
    return answer
}

solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])

//: [Next](@next)
