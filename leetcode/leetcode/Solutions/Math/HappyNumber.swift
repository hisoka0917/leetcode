//
//  HappyNumber.swift
//  leetcode
//
//  Created by Kai Wang on 7/5/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class HappyNumber {
    func isHappy(_ n: Int) -> Bool {
        var sums = Set<Int>()
        var squareSum = n
        while !sums.contains(squareSum) {
            sums.insert(squareSum)
            squareSum = sum(of: squareSum)
            if squareSum == 1 {
                return true
            }
        }
        return false
    }

    func sum(of n: Int) -> Int {
        var n = n
        var result = 0
        while n > 0 {
            let digit = n % 10
            result += digit * digit
            n /= 10
        }
        return result
//        let digits = String(n).compactMap { Int(String($0)) }
//        n = digits.map { $0 * $0 }.reduce(0, +)
    }

    func test() {
        for input in [7, 1111111, 19, 2] {
            print(isHappy(input))
        }
    }
}
