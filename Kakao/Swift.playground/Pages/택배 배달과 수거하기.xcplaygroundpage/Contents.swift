import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var answer = 0 // 최소 이동 거리
    
    var idps: [(i: Int, d: Int, p: Int)] = zip(deliveries, pickups).enumerated().map {  // (집 번호, 배달 건수, 수거 건수)
        return ($0.0 + 1, $0.1.0, $0.1.1)
    }
    
    var delivery = 0
    var pickup = 0
    while !idps.isEmpty {
        let (i, d, p) = idps.removeLast()
        delivery += d
        pickup += p
        
        while delivery > 0 || pickup > 0 {
            delivery -= cap
            pickup -= cap
            answer += 2 * i
        }
    }
    
    return Int64(answer)
}
