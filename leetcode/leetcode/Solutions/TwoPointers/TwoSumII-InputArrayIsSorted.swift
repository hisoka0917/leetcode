//
//  TwoSumII-InputArrayIsSorted.swift
//  leetcode
//
//  Created by Kai Wang on 7/7/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class TwoSumIIInputArrayIsSorted {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0, right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum < target {
                left += 1
            } else if sum > target {
                right -= 1
            } else {
                return [left + 1, right + 1]
            }
        }
        return []
    }

    func test() {
        let case1 = ([2,7,11,15], 9)
        let case2 = ([2,3,4], 6)
        let case3 = ([-1,0], -1)
        let cases = [case1, case2, case3]
        for input in cases {
            print(twoSum(input.0, input.1))
        }
    }
}
