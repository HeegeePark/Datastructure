import Foundation
var maxCourse = 0
var courseComb:[String] = []

func dfs(_ order: [String], _ depth: Int, _ combination: String, _ start: Int) {
    if depth > maxCourse || depth == order.count { return }
    for i in start+1..<order.count {
        courseComb.append(combination + order[i])
        dfs(order, depth + 1, combination + order[i], i)
    }
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    maxCourse = course.max()!
    var answer: [String] = []
    
    // 1. 가능한 코스 조합 만들기 (1~course.max)
    orders.forEach() {
        let order = $0.map { String($0) }.sorted()
        for i in 0..<$0.count {
            dfs(order, 1, String(order[i]), i)
        }
    }
    // 2. course에 해당하는 크기의 코스만 거르기
    courseComb = courseComb.filter { course.contains($0.count) }
    // 3. 중복되는 코스만 거르기
    let courseDict = courseComb.reduce(into: [:], { $0[$1, default: 0] += 1 })
        .filter { $0.value > 1 }
    // 4. 문자열 길이 별로 최대 빈도 요리 코스 return
    course.forEach() {
        let length = $0
        let coursesByLength = courseDict.filter { $0.key.count == length }
        let maxValue = coursesByLength.max { $0.value < $1.value }?.value
        let coursesArr = coursesByLength.filter { $0.value == maxValue }.map { $0.key }
        answer += coursesArr
    }
    return answer.sorted()
}

solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
