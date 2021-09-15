import Foundation

func solution(_ clothes:[[String]]) -> Int {
    // clothes -> dictionary
    var clothesDict = [String: [String]]()
    
    for c in clothes {
         if clothesDict[c[1]] != nil {
             clothesDict[c[1]]!.append(c[0])
         } else {
            clothesDict[c[1]] = [c[0]]
         }
    }
    
    // 의상 종류별 갯수 세기
    let count = clothesDict.mapValues { $0.count }.values
    // +1 : 안 입는 경우의 수 추가
    // -1 : 아무 것도 안 입는 경우 제거
    let answer = count.reduce(1) { $0 * ($1 + 1)} - 1
    
    return answer
}
