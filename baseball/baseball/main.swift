//
//  main.swift
//  baseball
//
//  Created by 천승희 on 2022/08/10.
//
import Foundation

var remainingChance: Int = 9
var userNumbers: [Int] = []
var strike = 0
var ball = 0

func makeRandomNumber() -> [Int] {
    var randomNumber: Set<Int> = []
    
    while randomNumber.count < 3 {
        let number = Int.random(in: 1...9)
        randomNumber.insert(number)
    }
    return Array<Int>(randomNumber)
}

func compareStrikeBall(userNumber: [Int], randonNumber: [Int]) {
    strike = 0
    ball = 0
    for i in 0...2 {
        if randonNumber[i] == userNumber[i] {
            strike += 1
        } else if randonNumber.contains(userNumber[i]) {
            ball += 1
        }
    }
    remainingChance -= 1
    judgmentGameOver()
}

func judgmentGameOver() {
    print("\(strike) 스트라이크, \(ball) 볼")
    if strike == 3 {
        print("사용자 승리!")
        inputGameMenu()
    }
    
    print("남은 기회 : \(remainingChance)")
    if remainingChance == 0 {
        print("컴퓨터 승리...!")
        inputGameMenu()
    }
}

func startBaseballGame() {
    let randomNumbers: [Int] = makeRandomNumber()
    remainingChance = 9
    
    while remainingChance != 0 {
        inputUserNumber()
        
        compareStrikeBall(userNumber: userNumbers, randonNumber: randomNumbers)
        userNumbers.removeAll()
    }
}

func inputGameMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    guard let input = readLine() else { return }
    if let menu = Int(input) {
        checkGameMene(gameMenu: menu)
    } else {
        checkGameMene(gameMenu: 0)
    }
}

func inputUserNumber() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    guard let input = readLine() else { return }
    checkUserInput(userInput: input)
}

func checkGameMene(gameMenu: Int) {
    if gameMenu == 1 {
        startBaseballGame()
    } else if gameMenu == 2 {
        exit(0)
    } else {
        inputGameMenu()
    }
}

func checkUserInput(userInput: String) {
    userNumbers.removeAll()
    var userNumber: [Int] = []
    let number = userInput.split(separator: " ")
    
    for num in number {
        if let value = Int(num) {
            userNumber.append(value)
        }
    }
    
    for range in userNumber {
        if range > 9 || range < 0 {
            userNumber.removeFirst()
        }
    }
    
    if userNumber.count == 3 && Array(Set(userNumber)).count == 3 {
        userNumbers = userNumber
    } else {
        print("입력이 잘못되었습니다")
        inputUserNumber()
    }
}

inputGameMenu()
