// 프로그래머스 다리를 지나는 트럭(스택,큐)

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 0
    var trucks = truck_weights
    var bridge_times: [Int] = []        // 다리 올라간 트럭들 하차할 시간
    var bridge_weights: [Int] = []      // 다리 올라간 트럭들 무게
    var weights_total = 0       // 다리 올라간 트럭들 무게 총합
    
    while !trucks.isEmpty {
        time += 1
        // 다리 건너고 있는 트럭이 나가야 할 시간이면 remove
        if !bridge_times.isEmpty {
            if time == bridge_times.first {
                bridge_times.removeFirst()
                weights_total -= bridge_weights.first!
                bridge_weights.removeFirst()
                
            }
        }
            
        // 다리 건너고 있는 트럭 + 대기 1번 트럭 무게 < bridge_Max 라면 다리 위에 삽입
            if weights_total + trucks.first! <= weight {
                bridge_times.append(time + bridge_length)
                bridge_weights.append(trucks.first!)
                weights_total += trucks.first!
                trucks.removeFirst()
            }
    }
        return bridge_times.last!
}

