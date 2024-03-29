//
//  덧칠하기.swift
//  CodingTest
//
//  Created by 이시안 on 3/29/24.
//

import Foundation
//벽을 1m씩 나눴더니 n개가 나왔다
//각 구역에 번호를 매김
//다시 칠해야하는 구역은 section
//롤러의 길이는 m
//롤러로 페인트칠 해야하는 최소 횟수를 리턴

/* 입출력 예시에만 맞춘 정답
func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var answer = 0
    if (section.count) % m != 0{
        answer += (((section.count) % m) - 1)
        return answer
    } else {
        return (section.count) * m
    }
}
*/

func solution(_ n: Int, _ m: Int, _ section: [Int]) -> Int {
    // 주어진 구역들을 정렬합니다.
    let sortedSections = section.sorted()
    
    var rollersUsed = 0
    var currentPosition = 0
    
    // 구역들 간의 간격을 확인하면서 최소 페인트칠 횟수를 계산합니다.
    for i in 0..<sortedSections.count {
        let gap = sortedSections[i] - currentPosition - 1
        
        // 현재 구역과 다음 구역 사이의 간격이 롤러의 길이보다 작거나 같으면 한 번에 페인트칠합니다.
        if gap <= m {
            rollersUsed += 1
            currentPosition = sortedSections[i]
        } else {
            // 롤러의 길이로 나누어서 페인트칠하는 횟수를 계산합니다.
            rollersUsed += (gap + m - 1) / m
            currentPosition = sortedSections[i]
        }
    }
    
    // 마지막 구역까지 페인트칠을 마치고 나면 rollersUsed를 반환합니다.
    return rollersUsed
}
