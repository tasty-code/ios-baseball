//
//  main.swift
//  baseball
//
//  Created by 천승희 on 2022/08/10.
//
import Foundation

var remainingChance: Int = 9

func makeRandomNumber() -> [Int] {
    var randomNumber: Set<Int> = []
    
    while randomNumber.count < 3 {
        let number = Int.random(in: 1...9)
        randomNumber.insert(number)
    }
    return Array<Int>(randomNumber)
}

func compareStrikeBall(userNumber: [Int], randonNumber: [Int]) {
    var strike = 0
    var ball = 0
    
    for i in 0...2 {
        if randonNumber[i] == userNumber[i] {
            strike += 1
        } else if randonNumber.contains(userNumber[i]) {
            ball += 1
        }
    }
    
    remainingChance -= 1
    
    if remainingChance == 0 {
        print("컴퓨터 승리...!")
    }
    print("\(strike) 스트라이크, \(ball) 볼")
    print("남은 기회 : \(remainingChance)")
}

func startBaseballGame() {
    let randomNumbers: [Int] = makeRandomNumber()
    
    while remainingChance != 0 {
        var userNumbers: [Int] = makeRandomNumber()
        
        print("임의의 수 :", terminator: " ")
        print(userNumbers.map{ String($0) }.joined(separator: " "))
        
        compareStrikeBall(userNumber: userNumbers, randonNumber: randomNumbers)
        userNumbers.removeAll()
    }
    remainingChance = 9
}

func inputGameMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    let input = readLine()
    if let menu = Int(input ?? "0") {
        checkGameMene(gameMenu: menu)
    } else {
        checkGameMene(gameMenu: 0)
    }
}

func inputUserNumber() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    let input = readLine()
    let numbers = input ?? "0"
    print(numbers.split(separator: " "))
}

func checkGameMene(gameMenu: Int) {
    if gameMenu == 1 {
        startBaseballGame()
    } else if gameMenu == 2 {
        print("게임종료")
    } else {
        inputGameMenu()
    }
}

inputGameMenu()
