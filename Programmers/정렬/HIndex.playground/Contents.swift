import Foundation

func solution(_ citations:[Int]) -> Int {
    let citationsSorted = citations.sorted(by: >)   // 내림차순 정렬
    let n = citations.count
    for h in (1...n).reversed() {   // n부터 1까지
        if citationsSorted[h-1] >= h { return h }
    }
    return 0
}
