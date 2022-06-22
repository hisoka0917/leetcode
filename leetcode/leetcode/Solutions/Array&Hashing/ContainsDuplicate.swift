//
//  ContainsDuplicate.swift
//  leetcode
//
//  Created by Kai Wang on 6/21/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var hashSet = Set<Int>()
        for num in nums {
            guard !hashSet.contains(num) else {
                return true
            }
            hashSet.insert(num)
        }
        return false
    }

    func test() {
        let case1 = [1,2,3,1]
        let case2 = [1,2,3,4]
        let case3 = [1,1,1,3,3,4,3,2,4,2]
        let cases = [case1, case2, case3]
        for input in cases {
            print(containsDuplicate(input))
        }
    }
}
