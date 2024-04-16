//
//  옹알이.swift
//  CodingTest
//
//  Created by 이시안 on 4/15/24.
//

import Foundation
//할 수 있는 옹알이를 골라내는 문제

func solution(_ babbling:[String]) -> Int {
    //기존의 옹알이 정의
    let words: [String] = ["aya", "ye", "woo", "ma"]
    var count = 0
    //주어진 옹알이에서 기존의 옹알이와 비교하여 할 수 있는 단어만 골라내기
    for word in words {
        if babbling.contains(word) {
            count += 1
        }}
    // 주어진 옹알이에서 기존의 옹알이가 합쳐진 단어는 할 수 있는 단어로 간주
    var isComposedOfWords = true
    for character in babbling {
        let characterString = String(character)
        if !words.contains(characterString) {
            isComposedOfWords = false
            break
        }
    }
    if isComposedOfWords {
        count += 1
    }
    return count
}

