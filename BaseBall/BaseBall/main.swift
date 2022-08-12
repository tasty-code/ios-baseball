//
//  main.swift
//  BaseBall
//
//  Created by 김유진 on 2022/08/09.
//
import Foundation

var computerNumbers = [Int]()

func createComputerNumbers() -> [Int] {
    var randomNumber: [Int] = [Int.random(in: 1...9)]

    while randomNumber.count < 3 {
        randomNumber.append(Int.random(in: 1...9))
        randomNumber = Array(Set(randomNumber))
    }

    return randomNumber
}

func compareComputerNumbers(with userNumbers: [Int]) -> [Int] {
    var strikeCount = 0
    var ballCount = 0
    let userNumbersSet = Set(userNumbers)
    let computerNumbersSet = Set(computerNumbers)

    for i in 0...2 {
        if userNumbers[i] == computerNumbers[i] { strikeCount += 1 }
    }

    ballCount = (userNumbersSet.intersection(computerNumbersSet).count) - strikeCount

    return [strikeCount, ballCount]
}

func selectMenu() -> Int{
    print("1. 게임 시작\n2. 게임 종료\n원하는 기능을 선택해주세요 : ", terminator: "")
    
    let answer: Int = Int(readLine() ?? "") ?? Int()
    return answer
}

func checkExistWinner(tryCount: Int, randomNumber: [Int]) -> Bool {
    let strikeBallResult = compareComputerNumbers(with: randomNumber)

    if strikeBallResult[0] == 3 {
        print("사용자 승리...!")
    }

    if tryCount == 0 {
        print("컴퓨터 승리...!")
    }

    print("\(strikeBallResult[0]) 스트라이크, \(strikeBallResult[1]) 볼")
    print("남은 기회 : \(tryCount)")

    if strikeBallResult[0] == 3 || tryCount == 0 {
        return true
    }

    return false
}

func playGame(){
    computerNumbers = createComputerNumbers()
    var tryCount = 9

    while true {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
        let randomNumber = (readLine() ?? "").split(separator: " ").map{Int($0) ?? Int()}

        if randomNumber.count == 3 {
            tryCount -= 1

            if checkExistWinner(tryCount: tryCount, randomNumber: randomNumber) {
                break
            }
            
        }else {
            print("입력이 잘못되었습니다")
        }
    }
}

func startGame() {
    while true {
        let menuAnswer = selectMenu()

        if menuAnswer == 1 {
            playGame()
        }else if menuAnswer == 2 {
            return
        }else {
            print("입력이 잘못되었습니다")
        }
    }
}

startGame()
