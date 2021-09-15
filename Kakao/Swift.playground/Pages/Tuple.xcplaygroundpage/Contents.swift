import Foundation

func solution(_ s:String) -> [Int] {
    var sArray = s
    
    // 1. 특수문자 필터링
    sArray.removeFirst(2)
    sArray.removeLast(2)
    let elements = sArray.components(separatedBy: "},{").flatMap {
        $0.components(separatedBy: ",").map { Int($0)! }
    }
    
    // 2. 딕셔너리에 숫자에 따른 빈도 수 저장
    let numDict = elements.reduce(into: [:], { $0[$1, default: 0] += 1})
    
    // 3. 빈도수 기준 내림차순하여 키값을 Int로 변환하여 튜플 저장
    let answer = numDict.sorted { $0.value > $1.value }.map { $0.key }
    
    
    return answer
}
solution("{{2},{2,1},{2,1,3},{2,1,3,4}}")
