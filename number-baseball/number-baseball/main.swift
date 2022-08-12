//
//  main.swift
//  number-baseball
//
//  Created by 이은호 on 2022/08/09.
//

import Foundation

//게임 기회
var chanceNumber : Int = 9

//정답 숫자 저장
var answerNumberPc:[Int] = []
var answerNumberUser:[Int] = []

//중복 없이 랜덤숫자 저장
var tempNumberPc:Set<Int> = []
var tempNumberUser:Set<Int> = []

//스트라이크,볼 갯수
var countStrik = 0
var countBall = 0

// 컴퓨터 랜덤 수
func pcRandom(){
    while tempNumberPc.count < 3 {
        var number = Int.random(in: 1...9)
        tempNumberPc.insert(number)
    }
    answerNumberPc = Array<Int>(tempNumberPc)
}


// 사용자 랜덤 수
func userRandom() {
    
    tempNumberUser = []
    
    while tempNumberUser.count < 3 {
        var number2 = Int.random(in: 1...9)
        tempNumberUser.insert(number2)
    }
    answerNumberUser = Array<Int>(tempNumberUser)
}

// 스트라이크와 볼 갯수 비교 연산
func comparisonStrikBall(){
    
    countStrik = 0
    countBall = 0
    
    for index in 0...2{
        if answerNumberUser[index] == answerNumberPc[index]{
            countStrik += 1
        }else if answerNumberPc.contains(answerNumberUser[index]){
            countBall += 1
        }
    }
    
}


while chanceNumber > 0{
    
    userRandom()
    pcRandom()
    comparisonStrikBall()
    
    print("임의의 수 : \(answerNumberUser)")
    print ("\(countStrik) 스트라이크 ,\(countBall) 볼")
    print("남은 기회 : \(chanceNumber - 1)")
    chanceNumber -= 1
    if countStrik == 3{
        print("사용자 승리 !")
        break
    }
    if chanceNumber == 0 {
        print("컴퓨터 승리 !")
    }
    
}





