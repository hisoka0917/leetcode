//
//  LongestConsecutiveSequence.swift
//  leetcode
//
//  Created by Kai Wang on 8/4/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class LongestConsecutiveSequence {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let hashSet = Set(nums)
        var longest = 0
        for num in hashSet {
            if !hashSet.contains(num - 1) {
                var length = 0
                while hashSet.contains(num + length) {
                    length += 1
                }
                longest = max(longest, length)
            }
        }

        return longest
    }

    func test() {
        let case1 = [100,4,200,1,3,2]
        let case2 = [0,3,7,2,5,8,4,6,0,1]
        let cases = [case1, case2]
        for input in cases {
            print(longestConsecutive(input))
        }
    }
}
