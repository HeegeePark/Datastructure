import Foundation

func solution(_ N: Int, _ number: Int) -> Int {
    if N == number { return 1 }
    let DP : [Set<Int>] = [[], [N], [linkedNumber(N, link: 2), N+N, N*N, 1]]
    return step(DP, N, 2, number)
}

func step(_ state: [Set<Int>], _ N: Int, _ count: Int, _ number: Int) -> Int{
    if count > 8 { return -1 }
    if let last = state.last, last.contains(number) { return count }
    
    var newState: Set<Int> = [linkedNumber(N, link: count + 1)]
    newState.filter { return $0 <= 32000 }
    
    for i in 1..<count+1 {
        state[i].forEach { op1 in
            state[count + 1 - i].forEach { op2 in
                var newValue = [op1 + op2, op1 - op2, op1 * op2]
                if op2 != 0 { newValue.append(op1 / op2) }
                
                newValue.forEach { new in
                    guard 0 < new && new <= 32000 else { return }
                    newState.insert(new)
                }
            }
        }
    }
    return step(state + [newState], N, count + 1, number)
}

// 연속 숫자 만드는 함수
func linkedNumber(_ N: Int, link: Int) -> Int {
    return Int(String(repeating: String(N), count: link))!
}
