//
//  ThreeSum.swift
//  leetcode
//
//  Created by Kai Wang on 7/7/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var res = [[Int]]()

        for (i, num) in nums.enumerated() {
            if i > 0 && nums[i - 1] == num {
                continue
            }
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let threeSum = num + nums[left] + nums[right]
                if threeSum == 0 {
                    res.append([num, nums[left], nums[right]])
                    left += 1
                    while nums[left] == nums[left - 1] && left < right {
                        left += 1
                    }
                } else if threeSum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return res
    }

    func test() {
        let case1 = [-1,0,1,2,-1,-4]
        let case2: [Int] = []
        let case3 = [0]
        let cases = [case1, case2, case3]
        for input in cases {
            print(threeSum(input))
        }
    }
}
