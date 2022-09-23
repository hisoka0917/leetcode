//
//  SumofTwoIntegers.swift
//  leetcode
//
//  Created by Kai Wang on 9/22/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class SumofTwoIntegers {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while (b != 0) {
            let carry = (a & b) << 1
            a ^= b
            b = carry
        }
        return a
    }
    
    func test() {
        let case1 = (1, 2)
        let case2 = (2, 3)
        let cases = [case1, case2]
        for input in cases {
            print(getSum(input.0, input.1))
        }
    }
}
