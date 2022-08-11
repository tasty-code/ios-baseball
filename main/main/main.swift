import Foundation

let randomNumber: Array<Int> = makeRandomNumber()
var tryCount: Int = 9
var strike = 0, ball = 0

func makeRandomNumber() -> Array<Int> {
    var set: Set<Int> = []
    
    while set.count < 3 {
        set.update(with: Int.random(in: 1...9))
    }
    
    return Array(set)
}

func checkStrikeOrBall(userNumber: Array<Int>) {
    for i in 0...2 {
        if userNumber[i] == randomNumber[i] {
            strike += 1
        } else if randomNumber.contains(userNumber[i]) {
            ball += 1
        }
    }
}

func isGameEnd() -> Bool {
    tryCount -= 1
    
    if strike == 3 {
        print("사용자 승리!")
        print("남은 기회 : \(tryCount)")
        return true
    } else if tryCount == 0 {
        print("컴퓨터 승리...!")
        print("남은 기회 : \(tryCount)")
        return true
    }
    
    return false
}

func playGame() {
    let userNumber = makeRandomNumber()
    strike = 0
    ball = 0
    
    print("임의의 수 : \(userNumber[0]) \(userNumber[1]) \(userNumber[2])")
    checkStrikeOrBall(userNumber: userNumber)
   
    print("\(strike) 스트라이크, \(ball) 볼")
    if isGameEnd() {
        return
    }
   
    print("남은 기회 : \(tryCount)")
    
    playGame()
}

playGame()
