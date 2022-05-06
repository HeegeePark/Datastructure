//: [Previous](@previous)

// 2018 카카오 공채 비밀지도
func decode(_ decimalNum: Int, _ n: Int) -> String {
    var binaryNum = String(decimalNum, radix: 2)
    binaryNum = binaryNum.count < n ? String(repeating: "0", count: n - binaryNum.count) + binaryNum: binaryNum
    return binaryNum
}

func getMap(_ map1: [String], _ map2: [String]) -> [String] {
    var answer = [String]()
    
    zip(map1, map2).forEach {
        answer += [zip($0.0, $0.1).map { c1, c2 in
            Int(String(c1))! + Int(String(c2))! > 0 ? "#": " "
        }.joined()]
    }
    return answer
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var map1 = [String]()
    var map2 = [String]()
    
    map1 = arr1.map { decode($0, n) }
    map2 = arr2.map { decode($0, n) }
    
    return getMap(map1, map2)
}

//: [Next](@next)
