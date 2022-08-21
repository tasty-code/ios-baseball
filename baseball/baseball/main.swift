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
