//
//  시저_암호.swift
//  CodingTest
//
//  Created by 이시안 on 3/6/24.
//

import Foundation

func solution(_ s: String, _ n: Int) -> String {
    var result = ""
    for char in s {
        let unicodeScalar = char.unicodeScalars.first!.value
        var shiftedUnicodeScalar = unicodeScalar
        
        if char.isLetter {
            let baseValue: UInt32 = char.isUppercase ? 65 : 97
            shiftedUnicodeScalar = (unicodeScalar - baseValue + UInt32(n)) % 26 + baseValue
        }
        
        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicodeScalar)))
        result.append(shiftedCharacter)
    }
    return result
}
