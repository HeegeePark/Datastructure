import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var answer = n - lost.count
    
    // 체육복 빌려주는 천사 ㅎ
    for angel in reserve {
        // 천사도 도난 당했을 경우 -> 못 빌려주고 체육복 입을 수 있으니 answer++
        if lost.contains(angel) {
            answer += 1
            continue
        } else {
            // 천사가 도움을 줄 수 있는 친구가 있을 때
            if lost.contains(angel - 1) || lost.contains(angel + 1) {
                answer += 1
            }
        }
    }
    return answer
}
