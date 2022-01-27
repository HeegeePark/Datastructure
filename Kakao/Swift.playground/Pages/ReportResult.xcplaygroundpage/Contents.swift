//: [Previous](@previous)

// 2022 카카오 공채 신고 결과 받기
import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var idReportedList: [String: Int] = [:] // 신고 당한 유저 id: 신고 횟수
    var idReportingList: [String: [String]] = [:]   // 신고 당한 id: 신고한 유저들의 id
    var answerDict: [String: Int] = [:]    // 유저 id: 결과 처리 횟수
    var answer: [Int] = []
    
    // 신고 정보 관련 딕셔너리 초기화
    id_list.forEach() {
        idReportedList[$0] = 0
        idReportingList[$0] = []
        answerDict[$0] = 0
    }
    
    report.forEach() {
        let strReport = $0.split(separator: " ").map { String($0) }
        let idReporting = strReport.first!  // 신고한 유저
        let idReported = strReport.last!    // 신고 당한 유저
        
        // 이전에 신고했던 사람인지 확인
        if !idReportingList[idReported]!.contains(idReporting) {
            idReportedList[idReported]! += 1
            idReportingList[idReported]! += [idReporting]
        }
    }
    
    // k번 이상 신고 당한(정지된) 유저 filter
    let idRevokedList = idReportedList.filter { $0.value >= k }.map { $0.key }
    
    // 결과 처리 메일을 보내야 할 유저들 횟수 저장
    let idSended = idRevokedList.compactMap { idReportingList[$0] }
    idSended.forEach {
        $0.forEach() { answerDict[$0]! += 1 }
    }
    
    id_list.forEach {
        answer.append(answerDict[$0]!)
    }
    
    return answer
}

//: [Next](@next)
