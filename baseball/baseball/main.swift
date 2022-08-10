//
//  main.swift
//  baseball
//
//  Created by 천승희 on 2022/08/10.
//
import Foundation

var numbers: [Int] = []
var userNumbers: [Int] = []
var randomNumber: Set<Int> = []
var remainingChance: Int = 9

func makeRandomNumber() {
    while randomNumber.count < 3 {
        let number = Int.random(in: 1...9)
        randomNumber.insert(number)
    }
    numbers = Array<Int>(randomNumber)
}

func compareStrikeBall() {
    var strike = 0
    var ball = 0
    
    for i in 0...2 {
        if numbers[i] == userNumbers[i] {
            strike += 1
        } else if numbers.contains(userNumbers[i]) {
            ball += 1
        }
    }
    
    remainingChance -= 1
    print("\(strike) 스트라이크 \(ball) 볼")
}

func startBaseballGame() {
    makeRandomNumber()
    
    while remainingChance != 0 {
        while userNumbers.count < 3 {
            let number = Int.random(in: 1...9)
            if userNumbers.contains(number) {
                continue
            } else {
                userNumbers.append(number)
            }
        }
        
        print("임의의 수 : ", terminator: " ")
        for number in userNumbers {
            print(number, terminator: " ")
        }
        print()
        
        compareStrikeBall()
        userNumbers.removeAll()
    }
    remainingChance = 9
}

startBaseballGame()
