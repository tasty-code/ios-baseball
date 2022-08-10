import Foundation

let maxChance: Int = 9
gameStart()

func gameStart() {
    var chance = maxChance
    let gameRandomNumbers = getRandomNumbers()
    
    while chance > 0 {
        chance = chance - 1
        
        let userRandomNumbers: [Int] = getRandomNumbers()
        print("임의의 수 : \(userRandomNumbers[0]), \(userRandomNumbers[1]), \(userRandomNumbers[2])")
        
        let roundResult = compare(gameRandomNumbers, and: userRandomNumbers)
        if roundResult == "win" {
            print("사용자 승리!")
            return
        }
        
        print("남은 기회 : \(chance)")
    }
    
    print("컴퓨터 승리!")
}

func getRandomNumbers() -> [Int] {
    var arr: [Int] = []
    while arr.count < 3 {
        let randomNum: Int = Int.random(in: 1...9)
        
        if arr.contains(randomNum) {
            
            continue
        }
        
        arr.append(randomNum)
    }
    
    return arr
}

func compare(_ gameRandomNumbers: [Int], and: [Int]) -> String{
    var userRandomNumbers = and
    var strikeCount: Int = 0
    var ballCount: Int = 0
    var roundResult: String = ""
    
    for i in 0...2 {
        if gameRandomNumbers[i] == userRandomNumbers[i] {

            userRandomNumbers[i] = 0
            strikeCount = strikeCount + 1
        }
    }
    for userNumber in userRandomNumbers {
        if gameRandomNumbers.contains(userNumber) {
            
            ballCount = ballCount + 1
        }
    }
    
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    
    if strikeCount == 3 {
        
        roundResult = "win"
    }else {
        
        roundResult = "lose"
    }
    
    return roundResult
}

