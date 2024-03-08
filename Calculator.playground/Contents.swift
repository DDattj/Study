import UIKit

/*
 1단계 & 2단계
 
 //일단 클래스 생성, 이름은 Calculator
 class Calculator {
 
 // 연산을 할 정수 2개 만들기
 // 컴퓨터 로컬에 '데스크탑''문서' 라는 기본 공간이름 정의라 생각하면 쉬움
 let number1: Int
 let number2: Int
 
 // '문서' 안에서 파일 이름 정하기
 init(n1: Int, n2: Int) {
 self.number1 = n1
 self.number2 = n2
 }
 
 /*프로그래머스 연산식 참고
  ()는 앞의 단계와 이름을 또 써줘야 하는걸 생략한 것
  -> 는 바꾸고 싶은 형식 포인트! 라고 생각하자 */
 func add() -> Int {
 return number1 + number2
 }
 
 func subtract() -> Int {
 return number1 - number2
 }
 
 func multiply() -> Int {
 return number1 * number2
 }
 
 //number가 0일때 오류가 날 경우도 작성해야한다!!!!
 func divide() -> Int {
 if number1 != 0 && number2 != 0 {
 return number1 / number2
 } else {
 return 0
 }
 }
 
 func remaind() -> Int {
 if number1 != 0 && number2 != 0 {
 return number1 % number2
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
 print("나머지는 \(calculator.remaind())")
 //print 내에서 줄바꿈 하고싶을땐 print("\n")공백을 프린트 해주면 된다
 print("\n")
 let calculator2 = Calculator(n1: 8, n2: 3)
 print("더하면 \(calculator2.add())")
 print("빼면 \(calculator2.subtract())")
 print("곱하면 \(calculator2.multiply())")
 print("나누면 \(calculator2.divide())")
 //calculator 라고만 되어있어서 답이 이상하게 출력됐던것! 가리키는 대상이 옳게 연결되어있는지 잘 확인하자
 print("나머지는 \(calculator2.remaind())")
 */




/*
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
 
 */




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
