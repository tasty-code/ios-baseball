import Foundation
    
var chance = 9
var computerNumbers: [Int] = []
var computerSetNumbers: Set<Int> = []
var userNumbers: [Int] = []
var userSetNumbers: Set<Int> = []
var strikeCount = 0
var ballCount = 0

func makeCoputerNums() {
    while computerSetNumbers.count < 3 {
        let num = Int.random(in: 1...9)
        computerSetNumbers.insert(num)
    }
    computerNumbers = Array(computerSetNumbers)
}

func comparisonNumbers() {
    while userSetNumbers.count < 3 {
        let num = Int.random(in: 1...9)
        userSetNumbers.insert(num)
    }
    
    userNumbers = Array(userSetNumbers)
    print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
    
    if chance == 1 {
        print("컴퓨터 승리...!")
    }
    
    for index in 0...2 {
        if userNumbers[index] == computerNumbers[index]{
            strikeCount += 1
        }else if computerNumbers.contains(userNumbers[index]){
            ballCount += 1
        }
    }
    print ("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

func gameStart() {
    makeCoputerNums()

    for _ in 1...9 {
        comparisonNumbers()
        
        userSetNumbers = []
        chance -= 1
        
        print("남은 기회 : \(chance)")

        if strikeCount == 3 {
            print("정답")
            break
        }
        
        strikeCount = 0
        ballCount = 0
    }
}

gameStart()
    
