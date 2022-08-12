import Foundation

func startGame() {
    if inputMenu() == false{
        return
    }
    
    var chance: Int = 9
    let gameRandomNumbers: [Int] = getRandomNumbers()

    while chance > 0 {
        let userNumbers: [Int] = getUserNumbers()
        let roundResult: String = compare(gameRandomNumbers, and: userNumbers)
        
        if roundResult == "win" {
            print("사용자 승리!")
            return startGame()
        }
        
        chance -= 1
        print("남은 기회 : \(chance)")
    }
    
    print("컴퓨터 승리...!")
    return startGame()
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

func getUserNumbers() -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ",terminator: "")
    let userNumbers: String = readLine() ?? ""
    let userNumbersToIntArray: [Int] = userNumbers.split(separator: " ").map { Int($0) ?? 0 }
    let duplicateElementCheck: Set<Int> = Set(userNumbersToIntArray)
    var isValidNumbers: Bool = true
    
    if duplicateElementCheck.count != 3 {
        isValidNumbers = false
    }
    for element in duplicateElementCheck {
        if element < 1 || element > 9 {
            isValidNumbers = false
        }
    }
    if isValidNumbers == false {
        print("입력이 잘못되었습니다")
        return getUserNumbers()
    }
    
    return userNumbersToIntArray
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
