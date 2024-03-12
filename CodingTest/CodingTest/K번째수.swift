//
//  K번째수.swift
//  CodingTest
//
//  Created by 이시안 on 3/12/24.
//

import Foundation

func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    var result = [Int]()
    
    for command in commands {
        let i = command[0]
        let j = command[1]
        let k = command[2]
        
        // 배열에서 i번째부터 j번째까지의 부분 배열을 가져옵니다.
        let slicedArray = Array(array[i-1..<j])
        
        // 배열을 정렬합니다.
        let sortedArray = slicedArray.sorted()
        
        // 정렬된 배열에서 k번째 원소를 구합니다.
        let kthElement = sortedArray[k-1]
        
        // 결과 배열에 추가합니다.
        result.append(kthElement)
    }
    
    return result
}
