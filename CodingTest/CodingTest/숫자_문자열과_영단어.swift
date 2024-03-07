//
//  숫자_문자열과_영단어.swift
//  CodingTest
//
//  Created by 이시안 on 3/7/24.
//

import Foundation

func solution(_ s: String) -> Int {
    let numbers: [String: Int] = [
        "zero": 0,
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9
    ]
    
    var result = ""
    var currentWord = ""

    for char in s {
        if char.isLetter {
            currentWord.append(char)
            if let number = numbers[currentWord] {
                result.append("\(number)")
                currentWord = ""
            }
        } else {
            result.append(char)
        }
    }
    
    return Int(result) ?? 0
}



/* import Foundation
 
 func solution(_ s:String) -> Int {
 //문자열을 쪼개기
 var s:String = ""
 //알파벳을 숫자에 대입하기
 var words : String = 0
 let number : Int
 switch words {
 case "zero":
 number = 0
 case "one":
 number = 1
 case "two":
 number = 2
 case "three":
 number = 3
 case "four":
 number = 4
 case "five":
 number = 5
 case "six":
 number = 6
 case "seven":
 number = 7
 case "eight":
 number = 8
 case "nine":
 number = 9
 default:
 number = 403
 }
 print(number)
 
 //숫자로만 된 문자열을 배출
 let num = s
 let strNum = String(num)
 return (strNum)
 }
 */
