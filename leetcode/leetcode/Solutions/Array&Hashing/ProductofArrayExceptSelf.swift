//
//  ProductofArrayExceptSelf.swift
//  leetcode
//
//  Created by Kai Wang on 8/4/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ProductofArrayExceptSelf {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: 1, count: nums.count)
        var prefix = 1
        var suffix = 1
        for i in 0 ..< nums.count {
            res[i] = prefix
            prefix *= nums[i]
        }
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            res[i] *= suffix
            suffix *= nums[i]
        }
        return res
    }

    func test() {
        let case1 = [1,2,3,4]
        let case2 = [-1,1,0,-3,3]
        let cases = [case1, case2]
        for input in cases {
            print(productExceptSelf(input))
        }
    }
}
