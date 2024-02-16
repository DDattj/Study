import UIKit

var greeting = "Hello, playground"

func solution(_ s: String) -> String {
    let length = s.count
    let middleIndex = s.index(s.startIndex, offsetBy: length / 2)

    if length % 2 == 0 {
        let prevIndex = s.index(before: middleIndex)
        return String(s[prevIndex...middleIndex])
    } else {
        return String(s[middleIndex])
    }
}

