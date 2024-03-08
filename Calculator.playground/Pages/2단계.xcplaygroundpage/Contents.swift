import UIKit

class Calculator {
    
    let number1: Double
    let number2: Double
    
    init(n1: Double, n2: Double) {
        self.number1 = n1
        self.number2 = n2
    }
    
    func add() -> Double {
        return number1 + number2
    }
    
    func subtract() -> Double {
        return number1 - number2
    }
    
    func multiply() -> Double {
        return number1 * number2
    }
    
    func divide() -> Double {
        if number1 != 0 && number2 != 0 {
            return number1 / number2
        } else {
            return 0
        }
    }
    
//remain은 Double이 안되는데 어떻게 하지
    func remain() -> Double {
        if number1 != 0 && number2 != 0 {
            return Double(Int(number1) % Int(number2))
        } else {
            return 0
        }
    }
}


let calculator = Calculator(n1: 6, n2: 0)
print("더하면 \(calculator.add())")
print("빼면 \(calculator.subtract())")
print("곱하면 \(calculator.multiply())")
print("나누면 \(calculator.divide())")
print("나머지는 \(calculator.remain())")
//print 내에서 줄바꿈 하고싶을땐 print("\n")공백을 프린트 해주면 된다
print("\n")
let calculator2 = Calculator(n1: 8, n2: 3)
print("더하면 \(calculator2.add())")
print("빼면 \(calculator2.subtract())")
print("곱하면 \(calculator2.multiply())")
print("나누면 \(calculator2.divide())")
//calculator 라고만 되어있어서 답이 이상하게 출력됐던것! 가리키는 대상이 옳게 연결되어있는지 잘 확인하자
print("나머지는 \(calculator2.remain())")




