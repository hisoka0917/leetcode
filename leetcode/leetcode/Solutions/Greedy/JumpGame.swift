//
//  JumpGame.swift
//  leetcode
//
//  Created by Kai Wang on 7/28/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class JumpGame {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        var longest = 0
        for i in 0 ..< nums.count - 1 {
            if i > longest {
                return false
            }
            longest = max(longest, i + nums[i])
            if longest >= nums.count - 1 {
                return true
            }
        }
        return false

//        var maxLength = 0
//        var index = 0
//
//        while index <= maxLength {
//            maxLength = max(index + nums[index], maxLength)
//            if maxLength >= nums.count - 1 { return true }
//            index += 1
//        }
//
//        return false
    }

    func greedy(_ nums: [Int]) -> Bool {
        var goal = nums.count - 1
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if i + nums[i] >= goal {
                goal = i
            }
        }
        return goal == 0
    }

    func test() {
        let case1 = [2,3,1,1,4]
        let case2 = [3,2,1,0,4]
        let case3 = [0,1]
        let case4 = [2,0,0]
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(canJump(input))
        }
    }
}
