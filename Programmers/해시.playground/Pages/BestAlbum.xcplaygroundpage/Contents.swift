import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var sumPlaysByGenre: [String: Int] = [:]        // [genre: 각 장르 총 노래 횟수]
    var idsByGenre: [String: [Int]] = [:]       // [genre: 고유 노래 번호 리스트]
    var sortedGenres: [String] = []     // genre list
    var answer: [Int] = []
    
    // 반복문 순회하여 위 데이터 구조 채우기
    for i in 0..<genres.count {
        if !sortedGenres.contains(genres[i]) {
            sortedGenres.append(genres[i])
            sumPlaysByGenre[genres[i]] = plays[i]
            idsByGenre[genres[i]] = [i]
            
        } else {
            sumPlaysByGenre[genres[i]]! += plays[i]
            idsByGenre[genres[i]]! += [i]
        }
    }
    
    // 장르별 총 노래 횟수 많은 순으로 장르 리스트 정렬
    sortedGenres = sortedGenres.sorted { sumPlaysByGenre[$0]! > sumPlaysByGenre[$1]! }
    
    // 장르 순으로 재생 횟수 높은 하나 또는 두 곡 아이디 answer에 저장
    for genre in sortedGenres {
        let Ids = idsByGenre[genre]!.sorted { plays[$0] > plays[$1] }
        answer.append(Ids[0])
        if Ids.count > 1 { answer.append(Ids[1]) }
    }
    return answer
}

solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])
