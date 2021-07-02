//
//  MaximumSubarray.swift
//  leetcode
//
//  Created by Kai Wang on 7/1/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class MaximumSubarray {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSub = nums[0]
        var currentSub = 0
        for number in nums {
            currentSub = max(currentSub + number, number)
            maxSub = max(currentSub, maxSub)
        }
        return maxSub
    }

    func test() {
        let case1 = [-2,1,-3,4,-1,2,1,-5,4]
        let case2 = [1]
        let case3 = [5,4,-1,7,8]
        let cases = [case1, case2, case3]
        for input in cases {
            print(maxSubArray(input))
        }
    }
}
