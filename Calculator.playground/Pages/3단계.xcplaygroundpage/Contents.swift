import UIKit

// 3단계는 각 기능별 클래스를 만들어주고 프린트 될 대상을 분리하는것
class Calculator {
    
    // 0 설정 혹은 ? 하면 init 필요없음!
    let number1: Double
    let number2: Double
    let addOperation: AddOperation
    let subtractOperation: SubtractOperation
    let multiplyOperation: MultiplyOperation
    let divideOperation: DivideOperation
    
    // 앞의 number 와 뒤의 명칭이 다를때는 self 안써도 됨
    init(number1: Double, number2: Double, addOperation: AddOperation, subtractOperation: SubtractOperation, multiplyOperation: MultiplyOperation, divideOperation: DivideOperation){
        self.number1 = number1
        self.number2 = number2
        self.addOperation = addOperation
        self.subtractOperation = subtractOperation
        self.multiplyOperation = multiplyOperation
        self.divideOperation = divideOperation
    }
}

class AddOperation {
    
    func add(number1: Int, number2: Int) -> Int{
        return number1 + number2
    }
}

class SubtractOperation {
    
    func subtract(number1: Int, number2: Int) -> Int{
        return number1 - number2
    }
}

class MultiplyOperation {
    
    func multiply(number1: Int, number2: Int) -> Int{
        return number1 * number2
    }
}

class DivideOperation {
    
    func divide(number1: Int, number2: Int) -> Int{
        return number1 / number2
    }
}

let calculate = Calculator(number1: 4, number2: 2, addOperation: AddOperation(), subtractOperation: SubtractOperation(), multiplyOperation: MultiplyOperation(), divideOperation: DivideOperation())
print("더하기 답은 \(calculate.addOperation.add(number1: 4, number2: 2))")

let calculate2 = Calculator(number1: 8, number2: 7, addOperation: AddOperation(), subtractOperation: SubtractOperation(), multiplyOperation: MultiplyOperation(), divideOperation: DivideOperation())
print("빼기 답은 \(calculate2.subtractOperation.subtract(number1: 8, number2: 7))")

let calculate3 = Calculator(number1: 19, number2: 3, addOperation: AddOperation(), subtractOperation: SubtractOperation(), multiplyOperation: MultiplyOperation(), divideOperation: DivideOperation())
print("나누기 답은 \(calculate3.divideOperation.divide(number1: 19, number2: 3))")
