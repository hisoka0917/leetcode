//
//  SubsetsII.swift
//  leetcode
//
//  Created by Kai Wang on 7/18/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class SubsetsII {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let nums = nums.sorted()

        func backtracking(subset: [Int], start: Int) {
            res.append(subset)

            for i in start ..< nums.count {
                if i > start && nums[i] == nums[i - 1] {
                    continue
                }
                backtracking(subset: subset + [nums[i]], start: i + 1)
            }
        }

        backtracking(subset: [], start: 0)
        return res
    }

    func test() {
        let case1 = [1,2,2]
        let case2 = [1]
        let cases = [case1, case2]
        for input in cases {
            print(subsetsWithDup(input))
        }
    }
}
