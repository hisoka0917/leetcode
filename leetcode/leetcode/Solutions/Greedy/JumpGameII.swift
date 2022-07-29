//
//  JumpGameII.swift
//  leetcode
//
//  Created by Kai Wang on 7/28/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class JumpGameII {
    func jump(_ nums: [Int]) -> Int {
        var jumps = Array(repeating: Int.max, count: nums.count)
        jumps[0] = 0
        for i in 0 ..< jumps.count {
            var steps = 1
            while steps <= nums[i] && i + steps < jumps.count {
                jumps[i + steps] = min(jumps[i + steps], jumps[i] + 1)
                steps += 1
            }
        }
        return jumps.last!
    }

    func greedy(_ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var minJumps = 0
        while right < nums.count - 1 {
            var farthest = 0
            for i in left ... right {
                farthest = max(farthest, i + nums[i])
            }
            left = right + 1
            right = farthest
            minJumps += 1
        }
        return minJumps
    }

    func test() {
        let case1 = [2,3,1,1,4]
        let case2 = [2,3,0,1,4]
        let case3 = [0]
        let case4 = [2,1]
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(greedy(input))
        }
    }
}
