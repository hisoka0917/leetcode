//
//  MinCostClimbingStairs.swift
//  leetcode
//
//  Created by Kai Wang on 6/30/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class MinCostClimbingStairs {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var cost = cost
        let count = cost.count
        for i in 2 ..< count {
            let current = cost[i]
            cost[i] = min(cost[i - 1] + current, cost[i - 2] + current)
        }
        return min(cost[count - 1], cost[count - 2])
    }

    func test() {
        let case1 = [10,15,20]
        let case2 = [1,100,1,1,1,100,1,1,100,1]
        let cases = [case1, case2]
        for input in cases {
            print(minCostClimbingStairs(input))
        }
    }
}
