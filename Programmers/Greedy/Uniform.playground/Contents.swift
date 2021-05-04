import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var answer = n - lost.count
    // 중복이 없으므로, set으로 변환
    var lostSet = Set(lost)
    var reserveSet = Set(reserve)
    
    // 여별이 있는 학생이 도난 당했을 경우 -> 체육복 하나니까 두 set에서 제거
    for student in reserveSet {
        if lostSet.contains(student) {
            answer += 1
            lostSet.remove(student)
            reserveSet.remove(student)
        }
    }
    
    // 체육복 빌릴 수 있는 친구 탐색하고
    // 다시 빌리는걸 방지하기 위해 빌리면 set에서 제거
    for student in lostSet {
        if reserveSet.contains(student - 1) {
            answer += 1
            reserveSet.remove(student - 1)
            lostSet.remove(student)
            continue
        }
        if reserveSet.contains(student + 1) {
            answer += 1
            reserveSet.remove(student + 1)
            lostSet.remove(student)
        }
    }
    
    return answer
}
