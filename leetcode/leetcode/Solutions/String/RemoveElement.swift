//
//  RemoveElement.swift
//  leetcode
//
//  Created by Wang Kai on 2018/8/3.
//  Copyright © 2018年 Pirate. All rights reserved.
//

import Foundation

class RemoveElement {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        while i < nums.count {
            if nums[i] == val {
                nums.remove(at: i)
            } else {
                i += 1
            }
        }
        return nums.count
    }
}
