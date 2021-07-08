//
//  FindMinimuminRotatedSortedArray.swift
//  leetcode
//
//  Created by Kai Wang on 7/7/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class FindMinimuminRotatedSortedArray {
    func findMin(_ nums: [Int]) -> Int {
        let count = nums.count
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = (left + right) / 2
            let preMid = (mid + count - 1) % count
            if nums[preMid] > nums[mid] {
                return nums[mid]
            } else if nums[right] < nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return nums[left]
    }

    func test() {
        let case1 = [3,4,5,1,2]
        let case2 = [4,5,6,7,0,1,2]
        let case3 = [11,13,15,17]
        let cases = [case1, case2, case3]
        for input in cases {
            print(findMin(input))
        }
    }
}
