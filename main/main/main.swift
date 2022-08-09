import Foundation

func makeRandomNumber() -> Array<Int> {
    var arr: Array<Int> = []
    
    for _ in 0...2 {
        var randomNum = Int.random(in: 1...9)
        while arr.contains(randomNum) == true {
            randomNum = Int.random(in: 1...9)
        }
        arr.append(randomNum)
    }
    
    return arr
}

let randomNumber = makeRandomNumber()
var tryCount = 9

print(randomNumber)
