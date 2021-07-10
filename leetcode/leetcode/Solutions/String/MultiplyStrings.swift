//
//  MultiplyStrings.swift
//  leetcode
//
//  Created by Kai Wang on 7/9/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class MultiplyStrings {
    func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" && num2 != "0" else {
            return "0"
        }
        var res: [UInt8] = Array(repeating: 0, count: num1.count + num2.count)
        let arr1 = Array(num1).reversed().map({ $0.asciiValue! - Character("0").asciiValue! })
        let arr2 = Array(num2).reversed().map({ $0.asciiValue! - Character("0").asciiValue! })
        for i in 0 ..< arr1.count {
            for j in 0 ..< arr2.count {
                let digit = arr1[i] * arr2[j]
                let sum = res[i + j] + digit
                res[i + j + 1] += sum / 10
                res[i + j] = sum % 10
            }
        }
        while res.last == 0 {
            res.removeLast()
        }
        return res.reversed().map({ String($0) }).joined()
    }

    func test() {
        let case1 = ("2", "3")
        let case2 = ("123", "456")
        let cases = [case1, case2]
        for input in cases {
            print(multiply(input.0, input.1))
        }
    }
}
