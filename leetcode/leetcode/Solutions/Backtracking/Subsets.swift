//
//  Subsets.swift
//  leetcode
//
//  Created by Kai Wang on 6/28/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class Subsets {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = [[]]

        for num in nums {
            var newSets = [[Int]]()
            for sub in result {
                var extend = sub
                extend.append(num)
                newSets.append(extend)
            }
            result.append(contentsOf: newSets)
        }

        return result

//        nums.reduce(into: [[]]) { (subsets, current) in
//            subsets.append(contentsOf: subsets.map { $0 + [current] })
//        }
    }

    func backtracking(nums: [Int], result: inout [[Int]], subset: inout [Int], index: Int) {
        result.append(subset)

        for i in index ..< nums.count {
            subset.append(nums[i])
            backtracking(nums: nums, result: &result, subset: &subset, index: i + 1)
            subset.removeLast()
        }
    }

    func test() {
        let case1 = [1,2,3]
        let case2 = [0]
        let cases = [case1, case2]
        for input in cases {
            print(subsets(input))
        }
    }
}
