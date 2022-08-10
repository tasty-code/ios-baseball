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

func compareCorrectNumber(with number: [Int]) -> Int {
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
    return strikeCount
}

func playGame(){
    correctNumber = createRandomNumber()

    while true {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
        let randomNumber = readLine()!.split(separator: " ").map{Int($0)!}
        
        if randomNumber.count == 3{
            tryCount -= 1
            print("남은 기회 : \(tryCount)")
            
            if compareCorrectNumber(with: randomNumber) == 3 {
                print("사용자 승리...!")
                break
            }
            
            if tryCount == 0 {
                print("컴퓨터 승리...!")
                break
            }
        }else {
            print("입력이 잘못되었습니다")
        }
    }
}

func selectMenu() -> Int{
    print("1. 게임 시작\n2. 게임 종료\n원하는 기능을 선택해주세요 : ", terminator: "")
    let answer = Int(readLine()!)!
    return answer
}

func startGame() {
    while true {
        if selectMenu() == 1{
            playGame()
        }else if selectMenu() == 2 {
            return
        }else {
            print("입력이 잘못되었습니다")
        }
    }
}

startGame()
