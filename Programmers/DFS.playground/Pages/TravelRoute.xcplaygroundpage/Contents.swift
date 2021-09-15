//: 프로그래머스 여행 경로(DFS)
import Foundation

var answer = [[String]]()
var ticketsCount = 0

func solution(_ tickets:[[String]]) -> [String] {
    ticketsCount = tickets.count
    let filter = tickets.filter { $0.first == "ICN" }
    for ticket in filter {
        var ticketsCopy = tickets
        let index = ticketsCopy.firstIndex(of: ticket)
        ticketsCopy.remove(at: index!)
        let arrival = ticket.last!
        searchRoute(ticketsCopy, ["ICN", arrival])
    }
    
    // answer에 담긴 배열의 값을 하나의 문자로 묶음
    let join = answer.map { $0.joined() }
    return answer[join.firstIndex(of: join.sorted().first!)!]
}

func searchRoute(_ tickets:[[String]], _ route: [String]) -> Void {
    if route.count == ticketsCount + 1 {
        answer.append(route)
        return
    }
    // departure가 출발지인 항공권만 filter
    let validTickets = tickets.filter { $0.first == route.last }
    // filter 순환하여 재귀 실행
    for ticket in validTickets {
        var ticketsCopy = tickets
        let index = ticketsCopy.firstIndex(of: ticket)
        ticketsCopy.remove(at: index!)
        let arrival = ticket.last!
        searchRoute(ticketsCopy, route + [arrival])
    }
}

solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])
//solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])
