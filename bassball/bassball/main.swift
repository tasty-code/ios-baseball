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

let computerNumber = makeNumbers()

var userNumber: Array<Int>

var tryCount = 9

var judged = [0, 0]

for i in 1...tryCount {

    userNumber = makeNumbers()
    judged = judgeNumber(computerNumbers: computerNumber, userNumbers: userNumber)
    
    print("임의의 수 : ", terminator:"")
    for n in 0...2 {
        print(userNumber[n], terminator:" ")
        if n == 2 {
            print("")
        }
    }
    
    if judged[0] == 3 {
        print("사용자 승리...!")
    } else if tryCount - i == 0{
        print("컴퓨터 승리...!")
    }

    print("\(judged[0]) 스트라이크, \(judged[1]) 볼")
    print("남은 기회 : \(tryCount - i)")

}
