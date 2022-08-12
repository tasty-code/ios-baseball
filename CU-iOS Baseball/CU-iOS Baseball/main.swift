import Foundation

func startGame() {
    
    if inputMenu() == false{
        return
    }
    
    var chance: Int = 9
    let gameRandomNumbers: [Int] = getRandomNumbers()

    while chance > 0 {
        let userRandomNumbers: [Int] = getRandomNumbers()
        print("임의의 수 : \(userRandomNumbers[0]) \(userRandomNumbers[1]) \(userRandomNumbers[2])")
        let roundResult: String = compare(gameRandomNumbers, and: userRandomNumbers)
        
        if roundResult == "win" {
            print("사용자 승리!")
            return
        }
        
        chance -= 1
        print("남은 기회 : \(chance)")
    }
    print("컴퓨터 승리...!")
}

func inputMenu() -> Bool {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ",terminator: "")
    let inputNumber: String = readLine() ?? ""
    
    switch inputNumber {
    case "1":
        return true
    case "2":
        break
    default:
        print("입력이 잘못되었습니다")
        return inputMenu()
    }
    
    return false
}

func getRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = Set<Int>()

    while randomNumbers.count < 3 {
        let randomNum: Int = Int.random(in: 1...9)

        randomNumbers.insert(randomNum)
    }
    
    let randomNumbersToReturn = Array(randomNumbers)
    return randomNumbersToReturn
}

func compare(_ gameRandomNumbers: [Int], and userNumbers: [Int]) -> String {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    var roundResult: String = ""
    
    for i in 0...2 {
        if gameRandomNumbers[i] == userNumbers[i] {
            strikeCount += 1
        } else if gameRandomNumbers.contains(userNumbers[i]) {
            ballCount += 1
        }
    }

    print("\(strikeCount) 스트라이크, \(ballCount) 볼")

    if strikeCount == 3 {
        roundResult = "win"
    } else {
        roundResult = "lose"
    }
    
    return roundResult
}

startGame()
