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
