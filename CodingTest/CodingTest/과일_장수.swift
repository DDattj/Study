//
//  과일_장수.swift
//  CodingTest
//
//  Created by 이시안 on 3/25/24.
//

import Foundation
//등급이 매겨진 사과배열 score에서 가장 좋은 품질은 k, 1로 갈수록 최하품 사과
//사과들을 m개로 묶었을때 얻을 수 있는 최대금액을 구하기
//이때 금액 선정 기준 = 묶음 내에 최하품인 p를 구하고 p * 묶어진 개수 m 임

//사과 점수를 내림차순으로 정렬
//m개씩 묶어서 그 묶음 당 가장 낮은 점수 골라내기(사과 한 상자당 가격이 '묶음에서 가장 낮은점수 * m' 이기 때문)

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var answer = 0
    var score = score.sorted(by: >)//score를 내림차순으로 정렬
    var minScore = m-1//배열의 마지막 인덱스 구하기, 내림차순 했으니 등급중 가장 작은 등급일것
    
    
    //묶음 안에서 계산
    while minScore < score.count { //상자 한개당 계산
        answer += m*score[minScore] //묶음에서 가장 낮은점수 * m = answer에 저장
        minScore += m //그 다음묶음의 상자로 넘어가기
    }

    return answer//묶음당 구한 가격들의 총합 계산
}

