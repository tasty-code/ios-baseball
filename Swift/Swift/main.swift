import Foundation

func numberReturn() -> Array<Int>{
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

func user() -> Array<Int>{
    
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

func comparison() -> Array<Int> {
    let recall : Array<Int> = numberReturn()
    let recall1 : Array<Int> = user()
    
    var strike : Int = 0
    var ball : Int = 0
    
        
        
    if recall[0] == recall1[0] {
        strike += 1
    }
    else if recall[0] == recall1[1] || recall[0] == recall1[2] {
        ball += 1
    }
    
    if recall[1] == recall1[1] {
        strike += 1
    }
    else if recall[1] == recall1[0] || recall[1] == recall1[2] {
        ball += 1
    }
    
    if recall[2] == recall1[2] {
        strike += 1
    }
    else if recall[2] == recall1[0] || recall[2] == recall1[1] {
        ball += 1
    }
    
    if strike == 3 {
        print("사용자 승리")
    }
    
    return [strike , ball]
}
