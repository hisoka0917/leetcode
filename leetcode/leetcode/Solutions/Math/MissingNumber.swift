//
//  MissingNumber.swift
//  leetcode
//
//  Created by Kai Wang on 8/4/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class MissingNumber {
    func missingNumber(_ nums: [Int]) -> Int {
        let expectSum = nums.count * (nums.count + 1) / 2
        let actual = nums.reduce(0, +)
        return expectSum - actual
    }

    func test() {
        let case1 = [3,0,1]
        let case2 = [0,1]
        let case3 = [9,6,4,2,3,5,7,0,1]
        let case4 = [0]
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(missingNumber(input))
        }
    }

//    func missingNumber(_ nums: [Int]) -> Int {
//            var missing = nums.count
//            for i in 0..<nums.count {
//                missing ^= i ^ nums[i]
//            }
//            return missing
//    }
}
