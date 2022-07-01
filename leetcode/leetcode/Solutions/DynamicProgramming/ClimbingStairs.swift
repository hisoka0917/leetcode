//
//  ClimbingStairs.swift
//  leetcode
//
//  Created by Kai Wang on 6/30/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ClimbingStairs {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1}
        if n == 2 { return 2}
        var n1 = 1
        var n2 = 2
        var i = 3
        while i <= n {
            let n3 = n1 + n2
            n1 = n2
            n2 = n3
            i += 1
        }
        return n2
    }

    func test() {
        let cases = [2, 3, 4]
        for input in cases {
            print(climbStairs(input))
        }
    }
}
