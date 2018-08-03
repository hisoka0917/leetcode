//
//  RemoveDuplicatesFromSortedArray.swift
//  leetcode
//
//  Created by Wang Kai on 2018/8/3.
//  Copyright © 2018年 Pirate. All rights reserved.
//

import Foundation

class RemoveDuplicatesFromArray {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var i = 0
        for j in 1..<nums.count {
            if nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
}
