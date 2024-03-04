//
//  크기가_작은_부분.swift
//  CodingTest
//
//  Created by 이시안 on 3/4/24.
//

import Foundation

func solution(_ t: String, _ p: String) -> Int {
    func convertToInt(_ str: String) -> Int {
        return Int(str)!
    }
    
    func getSubstrings(ofLength len: Int, fromString str: String) -> [String] {
        var substrings: [String] = []
        let endIndex = str.count - len
        
        for i in 0...endIndex {
            let start = str.index(str.startIndex, offsetBy: i)
            let end = str.index(start, offsetBy: len)
            let substring = String(str[start..<end])
            substrings.append(substring)
        }
        
        return substrings
    }
    
    func countSubstringsLessThanOrEqualToP(_ t: String, _ p: String) -> Int {
        let pValue = convertToInt(p)
        let pLength = p.count
        let substrings = getSubstrings(ofLength: pLength, fromString: t)
        var count = 0
        
        for substring in substrings {
            let intValue = convertToInt(substring)
            if intValue <= pValue {
                count += 1
            }
        }
        
        return count
    }
    
    return countSubstringsLessThanOrEqualToP(t, p)
}


