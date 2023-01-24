//: [Previous](@previous)

import Foundation

var answer = 0

enum LRU {
    case hit
    case miss
}

func calculateTime(_ lru: LRU) {
    switch lru {
        case .hit:
        answer += 1
        case .miss:
        answer += 5
    }
}

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cacheList = [String]() // max: cacheSize
    
    for city in cities {
        if cacheSize == 0 {
            answer = cities.count * 5
            return answer
        }
        
        let data = city.map { $0.uppercased() }.joined()
        
        if !cacheList.contains(data) {    // 새로운 데이터
            if cacheList.count < cacheSize {
                cacheList.append(data)
            }
            else {
                cacheList.removeFirst()
                cacheList.append(data)
            }
            calculateTime(LRU.miss)
        }
        else {  // 기존 데이터
            cacheList.remove(at: cacheList.firstIndex(of: data)!)
            cacheList.append(data)
            calculateTime(LRU.hit)
        }
    }
    
    return answer
}

//: [Next](@next)
