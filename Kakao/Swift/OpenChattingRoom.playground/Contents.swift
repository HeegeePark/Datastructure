import Foundation

enum ChatInfo {
    case Enter(String)
    case Leave(String)
    
    var result: String {
        switch self {
        case .Enter(let uid):
            return "\(userInfo[uid]!)님이 들어왔습니다."
        case .Leave(let uid):
            return "\(userInfo[uid]!)님이 나갔습니다."
        }
    }
}

var chatInfo: [ChatInfo] = []       // 채팅 정보
var userInfo: [String: String] = [:]        // 유저 정보 [uid: nickname]

func solution(_ record:[String]) -> [String] {
    var answer: [String] = []
    
    // 1. record에 따른 채팅 정보와 유저 정보 담기
    record.forEach() {
        var strRecord = $0.split(separator: " ").map { String($0) }
        let command = strRecord.first!
        strRecord.removeFirst()
        switch command {
        case "Enter":
            let info = strRecord
            userInfo.updateValue(info.last!, forKey: info.first!)
            chatInfo.append(.Enter(info.first!))
        case "Leave":
            let uid = strRecord.last!
            chatInfo.append(.Leave(uid))
        case "Change":
            let info = strRecord
            userInfo.updateValue(info.last!, forKey: info.first!)
        default:
            break
        }
    }
    
    // 2. enum case에 따른 result 담아주기
    chatInfo.forEach() {
        answer.append($0.result)
    }
    
    return answer
}

solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])
