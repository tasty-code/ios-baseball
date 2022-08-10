//
//  main.swift
//  baseball
//
//  Created by 천승희 on 2022/08/10.
//

import Foundation

var numbers: [Int] = []
var checkNumber:[Int] = []
var chance: Int = 9

func makeRandomNumber() {
    while checkNumber.count < 3 {
        let number = Int.random(in: 1...9)
        if checkNumber.contains(number) {
            continue
        } else {
            checkNumber.append(number)
        }
    }
}
