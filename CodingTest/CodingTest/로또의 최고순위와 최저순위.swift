//
//  로또의 최고순위와 최저순위.swift
//  CodingTest
//
//  Created by 이시안 on 4/11/24.
//

import Foundation

//번호가 겹치는 경우의 수 중 가장 많이 일치하는 것(최고순위)와 가장 적게 일치하는 경우(최저순위)를 찾기
//1-6, 2-5, 3-4, 4-3, 5-2, 6-1

func solution(_ lottos: [Int], _ win_nums: [Int]) -> [Int] {
    // 일치하는 번호의 개수를 구합니다.
    var matchPoint = 0
    //로또 배열에서의 번호가 윈넘버에서도 포함되어있으면 일치하는 경우를 1개씩 추가
    for number in lottos {
        if win_nums.contains(number) {
            matchPoint += 1
        }
    }
    
    //배열중에서 0인것만 죄다 뽑아내기, 그것이 다 맞을수도 다 틀릴수도 있다고 가정
    let zeroCount = lottos.filter { $0 == 0 }.count
    //최고순위와 최저순위 정의
    //최고는 (6등까지 있는 순위에서, 일치하는 경우와 0이 다 맞았다는 경우를 합쳐 7에서 빼면됨. 7에서 빼는 이유는 0등을 없애기 위함이고 많이 맞출수록 오름차순으로 정렬하기 때문)
    let maxRank = min(6, 7 - (matchPoint + zeroCount))
    //최저는 (6등까지 있는 순위에서, 일치하는 경우만 합쳐 7에서 빼면됨)
    let minRank = min(6, 7 - matchPoint)
    
    return [maxRank, minRank]
}
