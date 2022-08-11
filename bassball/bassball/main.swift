import Foundation


func makeNumbers() -> Array<Int> {

    var firstNumber = 0
    var secondNumber = 0
    var thirdNumber = 0
    
    while firstNumber == secondNumber || secondNumber == thirdNumber || firstNumber == thirdNumber {
        firstNumber = Int.random(in: 1...9)
        secondNumber = Int.random(in: 1...9)
        thirdNumber = Int.random(in: 1...9)
    }

    return [firstNumber, secondNumber, thirdNumber]
}
