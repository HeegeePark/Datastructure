//: [Previous](@previous)

// 2022 카카오 공채 양궁대회
import Foundation

var N = 0
var apeach = [Int]()
var needs = [Int]()  // 점수 별 획득하기 위한 최소 화살 개수
var scores = [Int: [Int]]()   // [점수 차: 라이언 과녁 정보]

// 라이언과 어피치 점수 차 return
func getScores(_ ryan: [Int]) -> Int {
    var scores = [0, 0] // [라이언 점수, 어피치 점수]
    
    for i in 0...10 {
        if ryan[i] > apeach[i] {
            scores[0] += (10 - i)
        } else {
            scores[1] += apeach[i] > 0 ? 10 - i: 0
        }
    }
    return scores[0] - scores[1]
}


func dfs(_ curr: Int, _ count: Int, _ comb: [Int]) {
    if count == N {
        if getScores(comb) > 0 {
            scores[getScores(comb)] = comb
            return
        } else { return }
    }
    if curr >= 10 { return }
    
    for i in curr + 1...10 {
        if count + needs[i] <= N {
            var newComb = comb
            newComb[i] = needs[i]
            dfs(i, count + needs[i], newComb)
        }
    }
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    if n == 1 { return [-1] }
    N = n
    apeach = info
    info.forEach {
        needs.append($0 + 1)
    }
    
    // dfs로 라이언이 이길 수 화살 조합 찾기
    for i in 0...10 {
        let comb = [Int](repeating: 0, count: 11)
        dfs(i, needs[i], comb)
    }
    
    return scores.isEmpty ? [-1]: scores.max { $0.key < $1.key }!.value
}

solution(5, [2,1,1,1,0,0,0,0,0,0,0])

//: [Next](@next)
