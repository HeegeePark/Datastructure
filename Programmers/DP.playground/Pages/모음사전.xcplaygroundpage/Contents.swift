//: [Previous](@previous)

// 프로그래머스 위클리 챌린지 5주차 모음사전
import Foundation

func solution(_ word:String) -> Int {
    let vowelDict = ["A": 0, "E": 1, "I": 2, "O": 3, "U": 4]
    // 자릿수가 바뀔 때마다 (*5 + 1)만큼 바뀜
    var diff = (((1 * 5 + 1) * 5 + 1) * 5 + 1) * 5 + 1      // 781
    var answer = word.count
    
    for w in word {
        answer += diff * vowelDict[String(w)]!
        diff = (diff - 1) / 5   // 다음 자릿수 만큼 차이 줄이기 (규칙의 역계산)
    }
    return answer
}

//: [Next](@next)
