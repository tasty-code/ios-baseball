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
