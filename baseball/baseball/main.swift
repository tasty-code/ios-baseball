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
    print("\(strike) 스트라이크 \(ball) 볼")
    print("남은 기회 : \(remainingChance)")
}

func startBaseballGame() {
    let randomNumbers: [Int] = makeRandomNumber()
    
    while remainingChance != 0 {
        var userNumbers: [Int] = makeRandomNumber()
        
        print("임의의 수 : ", terminator: " ")
        print(userNumbers.map{ String($0) }.joined(separator: " "))
        
        compareStrikeBall(userNumber: userNumbers, randonNumber: randomNumbers)
        userNumbers.removeAll()
    }
    remainingChance = 9
}

startBaseballGame()
