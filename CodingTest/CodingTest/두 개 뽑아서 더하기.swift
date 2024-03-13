//
//  두 개 뽑아서 더하기.swift
//  CodingTest
//
//  Created by 이시안 on 3/13/24.
//

import Foundation

import Foundation

func solution(_ numbers: [Int]) -> [Int] {
    var result: Set<Int> = []
    
    //숫자열의 더할수있는 모든 수를 더해 값을 내기
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            result.insert(numbers[i] + numbers[j])
        }
    }
    //그 값을 오름차순으로 정렬
    return result.sorted()
}
