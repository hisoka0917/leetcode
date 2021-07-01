//
//  SearchInsertPosition.swift
//  leetcode
//
//  Created by Kai Wang on 6/30/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class SearchInsertPosition {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let left = 0
        let right = nums.count - 1
        if target < nums[left] {
            return left
        } else if target > nums[right] {
            return right + 1
        } else {
            return binarySearch(nums, target: target, left: left, right: right)
        }
    }

    func binarySearch(_ nums: [Int], target: Int, left: Int, right: Int) -> Int {
        if left + 1 >= right {
            if target > nums[left] {
                return left + 1
            } else {
                return left
            }
        }
        let mid = (left + right) / 2
        if nums[mid] == target {
            return mid
        } else if target < nums[mid] {
            return binarySearch(nums, target: target, left: left, right: mid)
        } else {
            return binarySearch(nums, target: target, left: mid, right: right)
        }
    }

    func test() {
        let case1 = DataModel(nums: [1,3,5,6], target: 5)
        let case2 = DataModel(nums: [1,3,5,6], target: 2)
        let case3 = DataModel(nums: [1,3,5,6], target: 7)
        let case4 = DataModel(nums: [1,3,5,6], target: 0)
        let case5 = DataModel(nums: [1], target: 0)
        let case6 = DataModel(nums: [1,2,4,6,7], target: 3)
        let cases = [case1, case2, case3, case4, case5, case6]
        for input in cases {
            print(searchInsert(input.nums, input.target))
        }
    }

    struct DataModel {
        var nums: [Int]
        var target: Int
    }
}
