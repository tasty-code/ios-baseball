//
//  main.swift
//  baseballgame
//
//  Created by 박도원 on 2022/08/10.
//

import Foundation


var attempt = 9
var randomArray: [Int] = []
var overlapArray:Set<Int> = []
var input_numbers: [Int] = []

var strike_count = 0
var ball_count = 0

func comparison(){
    for index in 0...2{
        if input_numbers[index] == randomArray[index]{
            strike_count += 1
        }else if randomArray.contains(input_numbers[index]){
            ball_count += 1
        }
    }
}

while overlapArray.count < 3 {
    let num = Int.random(in: 1...9)
    overlapArray.insert(num)
}
randomArray = Array<Int>(overlapArray)
print(randomArray)

for _ in 1...9 {

    while input_numbers.count < 3 {
        let num = Int.random(in: 1...9)
        input_numbers.append(num)
    }
    print("임의의 수 : \(input_numbers)")
    
    comparison()
    
    print ("\(strike_count) 스트라이크, \(ball_count) 볼")
    
    input_numbers = []
    attempt-=1
    
    print("남은 기회 : \(attempt)")
    
    if strike_count == 3 {
        print("정답")
        break
    }else if attempt == 0 {
        print("컴퓨터 승리...!")
    }
    strike_count = 0
    ball_count = 0
}
