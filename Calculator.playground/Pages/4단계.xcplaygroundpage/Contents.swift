import UIKit

//4단계는 상속으로 클래스 2개만 가지고 만들기
//보니깐 부모클래스를 Calculator로 설정하고 자식클래스를 기능으로 설정한 뒤 super키워드 사용해서 끌고오면 될듯
//자식클래스는 switch 사용해서 +, -, *, /, % 로 나누고 맨 아래에서 calculate(for: .add)뭐 이렇게 해주면 되겠다

class Calculator {
    let number1: Double
    let number2: Double
    
    init(number1: Double, number2: Double){
        self.number1 = number1
        self.number2 = number2
    }
}

class Function: Calculator {
    let operation: Operation
    init(number1: Double, number2: Double, operation: Operation) {
        self.operation = operation
        super.init(number1: number1, number2: number2)
    }
    
    enum Operation{
        case add, subtract, multiply, divide
    }
    
    func calculate() -> Double {
        switch operation {
        case .add:
            return number1 + number2
        case .subtract:
            return number1 - number2
        case .multiply:
            return number1 * number2
        case .divide:
            return number1 / number2
        }
    }
}

let function = Function(number1: 35, number2: 64, operation: .add)
print("더하기 답은 \(function.calculate())")


