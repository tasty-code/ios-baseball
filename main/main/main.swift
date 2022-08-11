import Foundation

let randomNumber: Array<Int> = makeRandomNumber()
var tryCount: Int = 9

func makeRandomNumber() -> Array<Int> {
    var arr: Array<Int> = []
    
    for _ in 0...2 {
        var randomNum = Int.random(in: 1...9)
        while arr.contains(randomNum) == true {
            randomNum = Int.random(in: 1...9)
        }
        arr.append(randomNum)
    }
    
    return arr
}

func playGame() {
    let myNumber = makeRandomNumber()
    var strike = 0, ball = 0
    
    print("임의의 수 : \(myNumber[0]) \(myNumber[1]) \(myNumber[2])")
    
    for i in 0...2 {
        if myNumber[i] == randomNumber[i] {
            strike += 1
        } else if randomNumber.contains(myNumber[i]) {
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
