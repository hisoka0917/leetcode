//
//  BinarySearch.swift
//  leetcode
//
//  Created by Kai Wang on 6/23/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class BinarySearch {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            let midVal = nums[mid]
            if midVal == target {
                return mid
            } else if midVal > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        return -1
    }

    func test() {
        let case1 = ([-1,0,3,5,9,12], 9)
        let case2 = ([-1,0,3,5,9,12], 2)
        let cases = [case1, case2]
        for input in cases {
            print(search(input.0, input.1))
        }
    }
}
