//: [Previous](@previous)

import Foundation

func solution(_ enter:[Int], _ leave:[Int]) -> [Int] {
    var room = Set<Int>()
    var answer = [Int](repeating: 0, count: enter.count)
    
    var idx = 0 // enter 위치를 가리키는 포인터 역할
    for l in leave {
        // 퇴실하려는 사람이 회의실에 없다면, 먼저 들어온 사람들과 타겟 회의실에 넣기
        while !room.contains(l) {
            room.insert(enter[idx])
            idx += 1
        }
        // 퇴실했으니까 회의실에서 제거
        room.remove(l)
        // 현재 남은 사람들 ++
        for meet in room {
            answer[meet - 1] += 1
        }
        // room에서 만난 사람들 ++
        answer[l - 1] += room.count
    }
    return answer
}
//: [Next](@next)
