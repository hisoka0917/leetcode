//
//  PaintHouse.swift
//  leetcode
//
//  Created by Kai Wang on 7/20/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class PaintHouse {
    func minCost(_ costs: [[Int]]) -> Int {
        var dp = costs[0]
        for i in 1 ..< costs.count {
            let dp0 = costs[i][0] + min(dp[1], dp[2])
            let dp1 = costs[i][1] + min(dp[0], dp[2])
            let dp2 = costs[i][2] + min(dp[0], dp[1])
            dp = [dp0, dp1, dp2]
        }
        return min(dp[0], dp[1], dp[2])
    }

    func test() {
        let case1 = [[14,2,11],[11,14,5],[14,3,10]]
        let case2 = [[1,2,3],[1,4,6]]
        let cases = [case1, case2]
        for input in cases {
            print(minCost(input))
        }
    }
}
