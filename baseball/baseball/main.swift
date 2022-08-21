import Foundation

func computerNumber() -> [Int] {
    var aNumber : Int = 0
    var bNumber : Int = 0
    var cNumber : Int = 0
        
    while (aNumber == bNumber || bNumber == cNumber || aNumber == cNumber) {
        aNumber = Int.random(in: 1...9)
        bNumber = Int.random(in: 1...9)
        cNumber = Int.random(in: 1...9)
    }
    return [aNumber, bNumber, cNumber]
}

func userNumber() -> [Int] {
    
    var aNumberComparison : Int = 0
    var bNumberComparison : Int = 0
    var cNumberComparison : Int = 0
    
    
    while (aNumberComparison == bNumberComparison || bNumberComparison == cNumberComparison || aNumberComparison == cNumberComparison) {
        aNumberComparison = Int.random(in: 1...9)
        bNumberComparison = Int.random(in: 1...9)
        cNumberComparison = Int.random(in: 1...9)
    }
    
    return [aNumberComparison, bNumberComparison, cNumberComparison]
    
}

func comparison(computernumber: [Int], usernumber: [Int]) -> [Int] {
    
    var strike : Int = 0
    var ball : Int = 0
    
        
    if  computernumber[0] == usernumber[0]{
        strike += 1
    }
    else if computernumber[0] == usernumber[1] || computernumber[0] == usernumber[2] {
        ball += 1
    }
    
    if computernumber[1] == usernumber[1] {
        strike += 1
    }
    else if computernumber[1] == usernumber[0] || computernumber[1] == usernumber[2] {
        ball += 1
    }
    
    if computernumber[2] == usernumber[2] {
        strike += 1
    }
    else if  computernumber[2] == usernumber[0] || computernumber[2] == usernumber[1] {
        ball += 1
    }
    
    return [strike , ball]
}

func startGame() -> [[Int]] {
    var returnvalue : [[Int]] = .init()
    
    for chance in (0...8).reversed() {
        let computernumber : [Int] = computerNumber()
        let usernumber : [Int] = userNumber()
        let comparions : [Int] = comparison(computernumber: computernumber, usernumber: usernumber)
        returnvalue = [computernumber, usernumber, comparions]
        if returnvalue[2] == [3,0] {
            print("사용자 승리!")
        }
        else if chance == 0 {
            print("임의의 수",  returnvalue[0].compactMap{ String($0).description }.joined(separator: " "))
            print("컴퓨터 승리...!")
            print(returnvalue[2][0],"스트라이크,",returnvalue[2][1],"볼")
            print("남은 기회:", chance)
        }
        else {
            print("임의의 수",  returnvalue[0].compactMap{ String($0).description }.joined(separator: " "))
            print(returnvalue[2][0],"스트라이크,",returnvalue[2][1],"볼")
            print("남은 기회:", chance)
        }
        
        
    }
    
    return returnvalue
}

startGame()
