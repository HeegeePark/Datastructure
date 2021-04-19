// 프로그래머스 단어 변환(DFS)
import Foundation

var answer = 0
var wordsCopy = [String]()      // words를 복사할 배열

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    // words 복사
    wordsCopy = words
    
    return changeWord(begin, target)
}

// begin 바꾸는 함수
func changeWord(_ begin: String, _ target: String) -> Int {
    // 바꿀때 마다 answer++
    answer += 1
    
    // begin과 target의 한 글자만 다를 경우
    if isJustOneDifferent(begin, target) {
        // wordsCopy에 taget있는지 확인
        if wordsCopy.contains(target) {
            return answer
        }
    }
    
    // wordsCopy 순환
    for (index, word) in wordsCopy.enumerated() {
        // begin과 words에 있는 단어와 한 글자만 다를 경우
        if isJustOneDifferent(begin, word) {
            // 해당 word 삭제
            wordsCopy.remove(at: index)
            // word와 target이 똑같을 시
            if word == target {
                // answer 반환
                return answer
            } else {
                // begin을 word로 바꿔서 재귀
                return changeWord(word, target)
            }
        }
    }
    return 0
}

// 한 글자만 다른지 체크하는 함수
func isJustOneDifferent(_ word1: String, _ word2: String) -> Bool {
    // 몇 글자가 다른지 셀 변수
    var differentCount = 0
    
    // 한 글자씩 word 쪼개기
    let word1Map = word1.map { String($0) }
    let word2Map = word2.map { String($0) }
    
    for i in 0..<word1.count {
        // i번째 글자 다를 시
        if word1Map[i] != word2Map[i] {
            differentCount += 1
        }
    }
    
    return differentCount == 1 ? true : false
}
