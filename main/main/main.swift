import Foundation

var randomNumbers: [Int] = []
var tryCount: Int = 9
var strike = 0, ball = 0

func showMenu() {
    while true {
        randomNumbers = makeRandomNumbers()
        tryCount = 9
        
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")
        
        let inputMenuNumber = readLine()
        
        if inputMenuNumber == "1" {
            startGame()
        } else if inputMenuNumber == "2" {
            break
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
}

func makeRandomNumbers() -> [Int] {
    var nonduplicateNumbers: Set<Int> = []

    while nonduplicateNumbers.count < 3 {
        nonduplicateNumbers.insert(Int.random(in: 1...9))
    }

    return Array(nonduplicateNumbers)
}

func getUserNumbers() -> [Int] {
    var userNumbers: [Int] = []
    while true {
        userNumbers = []
        
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 : ", terminator: "")
        
        let inputNumbers = readLine()?.split(separator: " ")
        let unwrappedNumbers: Array<Substring> = inputNumbers ?? []
        
        for i in unwrappedNumbers {
            if let number = Int(i) {
                userNumbers.append(number)
            }
        }
        
        if isDuplicatedNumbers(userNumbers: userNumbers) || isNumbersRangeCorrect(userNumbers: userNumbers) || userNumbers.count != 3 {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        break
    }
    
    return userNumbers
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

func isNumbersRangeCorrect(userNumbers: [Int]) -> Bool {
    for i in userNumbers {
        if i < 1 || i > 9 {
            return true
        }
    }
    
    return false
}

func isDuplicatedNumbers(userNumbers: [Int]) -> Bool {
    var removedDuplicateNumbers: [Int] = []
    
    for i in userNumbers {
        if removedDuplicateNumbers.contains(i) {
            return true
        }
        
        removedDuplicateNumbers.append(i)
    }
    
    return false
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
    let userNumbers = getUserNumbers()
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

showMenu()

