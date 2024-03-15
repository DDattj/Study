//
//  가장_가까운_같은_글자.swift
//  CodingTest
//
//  Created by 이시안 on 3/14/24.
//

import Foundation

func solution(_ s:String) -> [Int] {
    //처음나온 글자는 -1로 표현
    //다시나온 글자는 처음나온 글자의 순서보다 떨어진 거리를 숫자로 표현
    var charIndexDict = [Character: Int]() // 각 문자의 마지막 인덱스를 저장할 딕셔너리
       var result = [Int]() // 결과 배열
       
       for (index, char) in s.enumerated() {
           if let lastIndex = charIndexDict[char] { // 해당 문자의 마지막 인덱스가 있는 경우
               result.append(index - lastIndex) // 현재 인덱스와 마지막 인덱스의 차이를 결과 배열에 추가
           } else {
               result.append(-1) // 해당 문자가 처음 나온 경우
           }
           charIndexDict[char] = index // 현재 인덱스를 해당 문자의 마지막 인덱스로 갱신
       }
       
       return result
   }

