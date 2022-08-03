//
//  Numberof1Bits.swift
//  leetcode
//
//  Created by Kai Wang on 8/3/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class Numberof1Bits {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var count = 0
        while n > 0 {
            count += n & 1
            n = n >> 1
        }
        return count
    }

    func test() {
        let case1 = 0x00001011
        let case2 = 0x10000000
//        let case3 = 0x11111111111111111111111111111101
        let cases = [case1, case2]
        for input in cases {
            print(hammingWeight(input))
        }
    }
}
