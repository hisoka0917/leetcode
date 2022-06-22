//
//  TwoSum.swift
//  leetcode
//
//  Created by Kai Wang on 6/21/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0 ..< nums.count {
            let num = nums[i]
            let complete = target - num
            if let index = dict[complete] {
                return [index, i]
            } else {
                dict[num] = i
            }
        }
        return []
    }

    func test() {
        let case1 = ([2,7,11,15], 9)
        let case2 = ([3,2,4], 6)
        let case3 = ([3,3], 6)
        let cases = [case1, case2, case3]
        for input in cases {
            print(twoSum(input.0, input.1))
        }
    }
}
