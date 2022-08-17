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
