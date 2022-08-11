import Foundation

let randomNumber: Array<Int> = makeRandomNumber()
var tryCount: Int = 9

func makeRandomNumber() -> Array<Int> {
    var set: Set<Int> = []
    
    while set.count < 3 {
        set.update(with: Int.random(in: 1...9))
    }
    
    return Array(set)
}

func playGame() {
    let userNumber = makeRandomNumber()
    var strike = 0, ball = 0
    
    print("임의의 수 : \(userNumber[0]) \(userNumber[1]) \(userNumber[2])")
    
    for i in 0...2 {
        if userNumber[i] == randomNumber[i] {
            strike += 1
        } else if randomNumber.contains(userNumber[i]) {
            ball += 1
        }
    }
    print("\(strike) 스트라이크, \(ball) 볼")
    
    tryCount -= 1
    if tryCount == 0 {
        print("컴퓨터 승리...!")
        print("남은 기회 : \(tryCount)")
        return
    } else if strike == 3 {
        print("사용자 승리!")
        print("남은 기회 : \(tryCount)")
        return
    }
    
    print("남은 기회 : \(tryCount)")
    
    playGame()
}

playGame()
