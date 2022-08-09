//
//  main.swift
//  BaseBall
//
//  Created by 김유진 on 2022/08/09.
//

import Foundation

private var correctNumber: [Int] = [Int.random(in: 1...9)]
private var tryCount = 9

createCorrectNumber()

private func createCorrectNumber(){
    while(correctNumber.count < 3){
        let randomNumber = Int.random(in: 1...9)
        
        if !correctNumber.contains(randomNumber){
            correctNumber.append(randomNumber)
        }
    }
}
