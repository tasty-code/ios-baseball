import Foundation

let randomNumbers: [Int] = makeRandomNumbers()
var tryCount: Int = 9
var strike = 0, ball = 0

func makeRandomNumbers() -> [Int] {
    var nonduplicateNumbers: Set<Int> = []

    while nonduplicateNumbers.count < 3 {
        nonduplicateNumbers.update(with: Int.random(in: 1...9))
    }

    return Array(nonduplicateNumbers)
}

func checkStrikeOrBall(userNumbers: [Int]) {
    for i in 0...2 {
        if userNumbers[i] == randomNumbers[i] {
            strike += 1
        } else if randomNumbers.contains(userNumbers[i]) {
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

func startGame() {
    let userNumbers = makeRandomNumbers()
    strike = 0
    ball = 0

    print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
    checkStrikeOrBall(userNumbers: userNumbers)

    print("\(strike) 스트라이크, \(ball) 볼")
    if isGameEnd() {
        return
    }

    print("남은 기회 : \(tryCount)")

    startGame()
}

startGame()

