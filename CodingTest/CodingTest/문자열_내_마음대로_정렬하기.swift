//
//  문자열_내_마음대로_정렬하기.swift
//  CodingTest
//
//  Created by 이시안 on 3/8/24.
//

import Foundation

func solution(_ strings: [String], _ n: Int) -> [String] {

    // 문자열의 n번째 글자를 반환하는 함수
    func character(at index: Int, in string: String) -> Character? {
        guard index >= 0 && index < string.count else { return nil }
        return string[string.index(string.startIndex, offsetBy: index)]
    }

    // 문자열 배열을 n번째 글자를 기준으로 정렬하는 함수
    func compareStringsByNthCharacter(strings: [String], n: Int) -> [String] {
        // 각 문자열의 n번째 글자를 비교하여 정렬
        let sortedStrings = strings.sorted { (str1, str2) -> Bool in
            guard let char1 = character(at: n, in: str1), let char2 = character(at: n, in: str2) else {
                // n번째 글자가 없는 경우에는 앞선 문자열을 우선 배치
                return str1 < str2
            }
            // n번째 글자가 같은 경우에는 다음 문자열을 비교하여 정렬
            if char1 == char2 {
                // 다음 문자열을 비교하여 정렬
                return str1 < str2
            }
            // n번째 글자를 기준으로 정렬
            return char1 < char2
        }
        return sortedStrings
    }
    
    // 정렬된 문자열 배열을 반환
    return compareStringsByNthCharacter(strings: strings, n: n)
}
