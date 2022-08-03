//
//  CountingBits.swift
//  leetcode
//
//  Created by Kai Wang on 8/3/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class CountingBits {
    func countBits(_ n: Int) -> [Int] {
        guard n > 0 else { return [0] }
        var ans = Array(repeating: 0, count: n + 1)
        ans[0] = 0
        for i in 1 ... n {
            ans[i] = ans[i >> 1] + (i & 1)
        }
        return ans
    }

    func test() {
        let case1 = 2
        let case2 = 5
        let cases = [case1, case2]
        for input in cases {
            print(countBits(input))
        }
    }
}
