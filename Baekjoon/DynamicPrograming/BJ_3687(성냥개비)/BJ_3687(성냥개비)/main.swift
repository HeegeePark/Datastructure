//
//  main.swift
//  BJ_3687(성냥개비)
//
//  Created by 박희지 on 2022/06/19.
//

import Foundation

let N = Int(readLine()!)!
//var inputs = [Int]()
var input = 0

for _ in 0..<N {
//    inputs += [Int(readLine()!)!]
    input = Int(readLine()!)!
    
}

func solution(_ x: Int) {
    var dict: [Int: Int] = [1: 2, 2: 5, 3: 5, 4: 4, 5: 5, 6: 6, 7: 3, 8: 7, 9: 6, 0: 6]
    dict.sorted { $0.value < $1.value }
}

