//
//  ReverseBits.swift
//  leetcode
//
//  Created by Kai Wang on 7/14/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class ReverseBits {
    func reverseBits(_ n: Int) -> Int {
        var res = 0
        var n = n
        for _ in 0 ..< 32 {
            res = res << 1
            res |= n & 1
            n = n >> 1
        }
        return res
    }

    func test() {
        let case1 = 0b00000010100101000001111010011100
        let case2 = 0b11111111111111111111111111111101
        let cases = [case1, case2]
        for input in cases {
            print(reverseBits(input))
        }
    }
}
