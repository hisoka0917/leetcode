//
//  RotateArray.swift
//  leetcode
//
//  Created by Kai Wang on 7/14/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class RotateArray {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let lastK = k % nums.count
        let lastNums = nums[nums.index(after: nums.count - lastK - 1) ..< nums.endIndex]
        nums.removeLast(lastK)
        nums.insert(contentsOf: lastNums, at: 0)
    }

    func rotateReverse(_ nums: inout [Int], _ k: Int) {
        let lastK = k % nums.count
        nums.reverse()
        var l = 0
        var r = lastK - 1
        while l < r {
            nums.swapAt(l, r)
            l += 1
            r -= 1
        }
        l = lastK
        r = nums.count - 1
        while l < r {
            nums.swapAt(l, r)
            l += 1
            r -= 1
        }
    }

    func test() {
        let case1 = DataModel(nums: [1,2,3,4,5,6,7], k: 3)
        let case2 = DataModel(nums: [-1,-100,3,99], k: 2)
        let case3 = DataModel(nums: [1,2], k: 2)
        let cases = [case1, case2, case3]
        for input in cases {
            var nums = input.nums
            rotateReverse(&nums, input.k)
            print(nums)
        }
    }

    struct DataModel {
        var nums: [Int]
        var k: Int
    }
}
