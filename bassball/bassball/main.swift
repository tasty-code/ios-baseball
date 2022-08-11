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

func judgeNumber(computerNumbers: Array<Int>, userNumbers: Array<Int>) -> Array<Int> {
    
    var strike = 0
    var ball = 0
    
    var i = 0
    
    while i < computerNumbers.count {
        if computerNumbers[i] == userNumbers[i] {
            strike += 1
            i += 1
        } else if userNumbers.contains(computerNumbers[i])  {
            ball += 1
            i += 1
        } else {
            i += 1
        }
    }
    
    return [strike, ball]
}
