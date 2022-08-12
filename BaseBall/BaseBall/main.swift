//
//  main.swift
//  BaseBall
//
//  Created by 김유진 on 2022/08/09.
//
import Foundation

var correctNumber = [Int]()
var tryCount = 9

func createRandomNumber() -> [Int] {
    var randomNumber: [Int] = [Int.random(in: 1...9)]
    
    while randomNumber.count < 3 {
        randomNumber.append(Int.random(in: 1...9))
        randomNumber = Array(Set(randomNumber))
    }

    return randomNumber
}

func compareCorrectNumber(with number: [Int]) -> [Int] {
    var strikeCount = 0
    var ballCount = 0
    
    for i in 0...2 {
        if number[i] == correctNumber[i] { strikeCount += 1 }
    }
    
    ballCount = (Set(number).intersection(Set(correctNumber)).count) - strikeCount
    
    return [strikeCount, ballCount]
}

func checkExistWinner(tryCount: Int, randomNumber: [Int]) -> Bool {
    let strikeBallResult = compareCorrectNumber(with: randomNumber)
    
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


func selectMenu() -> Int{
    print("1. 게임 시작\n2. 게임 종료\n원하는 기능을 선택해주세요 : ", terminator: "")
    let answer = Int(readLine()!)!
    return answer
}

func startGame() {
    correctNumber = createRandomNumber()
    while tryCount > 0 {
        tryCount -= 1
        
        let randomNumber = createRandomNumber()
        print("임의의 수 : \(randomNumber.map{ String($0) }.joined(separator: " "))")
        
        if checkExistWinner(tryCount: tryCount, randomNumber: randomNumber) { break }
    }
}

startGame()
