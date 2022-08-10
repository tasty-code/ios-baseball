//
//  main.swift
//  BaseBall
//
//  Created by 김유진 on 2022/08/09.
//

import Foundation

var correctNumber = [Int]()
var tryCount = 9

// MARK: - 임의의 수 생성 함수
func createRandomNumber() -> [Int] {
    var randomNumber = [Int.random(in: 1...3), Int.random(in: 4...6), Int.random(in: 7...9)]
    randomNumber.shuffle()

    return randomNumber
}

// MARK: - 임의의 수와 입력 수 비교 함수
func compareCorrectNumber(with number: [Int]) {
    var strikeCount = 0
    var ballCount = 0
    
    for i in 0...2{
        
        if number[i] == correctNumber[i]{
            
            strikeCount += 1
            
        }else if correctNumber.contains(number[i]){
            
            ballCount += 1
            
        }
    }
    
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

// MARK: - 게임 진행 함수
func startGame() {
    correctNumber = createRandomNumber()
    
    while tryCount > 0 {
        
        tryCount -= 1
        
        let randomNumber = createRandomNumber()
        print("임의의 수 : \(randomNumber.map{ String($0) }.joined(separator: " "))")
        
        compareCorrectNumber(with: randomNumber)
        print("남은 기회 : \(tryCount)")
        
    }
}

startGame()
