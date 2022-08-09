//
//  main.swift
//  BaseBall
//
//  Created by 김유진 on 2022/08/09.
//

import Foundation

private var correctNumber = [Int]()
private var tryCount = 9

// MARK: - 임의의 수 생성 함수
private func createRandomNumber() -> [Int]{
    var randomNumber = [Int.random(in: 1...3), Int.random(in: 4...6), Int.random(in: 7...9)]
    randomNumber.shuffle()

    return randomNumber
}

