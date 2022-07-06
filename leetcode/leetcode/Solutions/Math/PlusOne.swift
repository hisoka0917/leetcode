//
//  PlusOne.swift
//  leetcode
//
//  Created by Kai Wang on 7/5/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class PlusOne {
    func plusOne(_ digits: [Int]) -> [Int] {
        var ext = 1
        var digits = digits
        var i = digits.count - 1
        while i >= 0 && ext > 0 {
            ext += digits[i]
            if ext >= 10 {
                digits[i] = ext - 10
                ext -= 9
                i -= 1
            } else {
                digits[i] = ext
                ext = 0
            }
        }
        if ext > 0 {
            digits.insert(1, at: 0)
        }
        return digits
    }

//    func plusOne(_ digits: [Int]) -> [Int] {
//        let sum = digits.reduce(0) { partialResult, digit in
//            partialResult * 10 + digit
//        }
//        return String(sum + 1).compactMap { Int(String($0)) }
//    }

    func test() {
        let case1 = [1,2,3]
        let case2 = [4,3,2,1]
        let case3 = [9]
        let cases = [case1, case2, case3]
        for input in cases {
            print(plusOne(input))
        }
    }
}
