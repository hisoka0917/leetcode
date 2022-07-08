//
//  3SumClosest.swift
//  leetcode
//
//  Created by Kai Wang on 7/27/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class ThreeSumClosest {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var res = 0
        var minGap = Int.max
        for i in 0 ..< nums.count - 1 {
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let sum3 = nums[i] + nums[left] + nums[right]
                let gap = abs(sum3 - target)
                if gap < minGap {
                    minGap = gap
                    res = sum3
                }
                if gap == 0 {
                    return sum3
                }
                if sum3 < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return res
    }

    func test() {
        let case1 = DataModel(nums: [-1,2,1,-4], target: 1)
        let cases = [case1]
        for input in cases {
            print(threeSumClosest(input.nums, input.target))
        }
    }

    struct DataModel {
        var nums: [Int]
        var target: Int
    }
}
