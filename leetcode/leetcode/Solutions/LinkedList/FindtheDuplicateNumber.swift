//
//  FindtheDuplicateNumber.swift
//  leetcode
//
//  Created by Kai Wang on 8/28/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class FindtheDuplicateNumber {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0
        var fast = 0
        while true {
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast {
                break
            }
        }

        var slow2 = 0
        while true {
            slow = nums[slow]
            slow2 = nums[slow2]
            if slow == slow2 {
                break
            }
        }
        return slow2
    }

    func test() {
        let case1 = [1,3,4,2,2]
        let case2 = [3,1,3,4,2]
        let cases = [case1, case2]
        for input in cases {
            print(findDuplicate(input))
        }
    }
}
