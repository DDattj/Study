//
//  카드_뭉치.swift
//  CodingTest
//
//  Created by 이시안 on 3/22/24.
//

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    //cards1 과 cards2 배열 이름과 카드 인덱스에 대하여 정의
    var card1 = cards1
    var card2 = cards2
    var index1 = 0
    var index2 = 0
    
    //goal의 인덱스를 indexG라고 정의
    for i in 0..<goal.count {
        let indexG = goal[i]
        //모든 배열에서 각 인덱스에 알맞은 요소가 들어 있는지 확인하는 작업 거치는것
        //맞으면 1포인트씩 추가해서 각 인덱스가 1포인트를 얻지 못하면 no, 다 얻었다면 yes
        //goal 배열의 첫번째 요소가 card1 첫번째에 있는지 확인
        //있으면 card1의 인덱스에 1포인트, 없으면 card2의 첫번째를 확인
        //이때 아래순번이 먼저 인식되지 않도록 index숫자 < card숫자.count라는 조건 추가
        if index1 < card1.count && card1[index1] == indexG {
                index1 += 1
        } else if index2 < card2.count && card2[index2] == indexG {
                index2 += 1
        } else {
            return "No"
        }
    }
    return "Yes"
}
