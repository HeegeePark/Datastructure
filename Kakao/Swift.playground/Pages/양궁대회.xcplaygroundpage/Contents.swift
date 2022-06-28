//: [Previous](@previous)

// 2022 카카오 공채 양궁대회
import Foundation

var N = 0
var apeach = [Int]()
var needs = [Int](repeating:0, count: 11)  // 점수 별 획득하기 위한 최소 화살 개수
var scores = [[Int]: Int]()   // [라이언 과녁 정보: 최종점수 차]

// 라이언과 어피치 점수 차 return
func getScores(_ ryan: [Int]) -> Int {
    var scores = [0, 0] // [라이언 최종점수, 어피치 최종점수]
    
    for i in 0..<10 {   // 과녁 밖(10번째)는 득점이 없으니 돌지 않음
        if ryan[i] > apeach[i] {
            scores[0] += 10 - i
        } else {
            scores[1] += apeach[i] > 0 ? 10 - i: 0
        }
    }
    return scores[0] - scores[1]
}

func dfs(_ curr: Int, _ count: Int, _ comb: [Int]) {
    if getScores(comb) > 0 {
        // 화살을 다 쏘지 않아도, 어피치를 이긴다면 남은 화살은 0점 과녁으로
        if count < N {
            var newComb = comb
            newComb[10] = N - count
            scores[newComb] = getScores(comb)
        } else {
            scores[comb] = getScores(comb)
            return
        }
    }
    if curr >= 10 || count > N { return }
    
    for i in curr + 1..<needs.count {
        if count + needs[i] <= N {
            var newComb = comb
            newComb[i] = needs[i]
            dfs(i, count + needs[i], newComb)
        }
    }
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    if n == 1  && info[0] == 1 { return [-1] }
    N = n
    apeach = info
    info.enumerated().forEach {
        needs[$0.0] = $0.1 + 1
    }
    for i in 0..<10 {
        needs[i] = info[i] + 1
    }
    
    // dfs로 라이언이 이길 수 화살 조합 찾기
    for i in 0...10 {
        var comb = [Int](repeating: 0, count: 11)
        comb[i] = needs[i]
        dfs(i, needs[i], comb)
    }
    
    guard !scores.isEmpty else { return [-1] }
    return scores.sorted() {
        if $0.value == $1.value {   // 점수 차가 같을 경우, 가장 낮은 점수 비중이 많은 과녁 정보 return
            let n1 = Int($0.key.reversed().map { String($0) }.joined())!
            let n2 = Int($1.key.reversed().map { String($0) }.joined())!
            return n1 <= n2
        } else {
            return $0.value < $1.value
        }
    }.last!.key
}

solution(5, [2,1,1,1,0,0,0,0,0,0,0])
//solution(1, [1,0,0,0,0,0,0,0,0,0,0])
//solution(9, [0,0,1,2,0,1,1,1,1,1,1])
//solution(10, [0,0,0,0,0,0,0,0,3,4,3])

//: [Next](@next)
