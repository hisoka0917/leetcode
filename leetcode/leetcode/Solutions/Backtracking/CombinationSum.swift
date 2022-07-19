//
//  CombinationSum.swift
//  leetcode
//
//  Created by Kai Wang on 7/13/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class CombinationSum {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()

        func backtracking(target: Int, start: Int, combine: [Int]) {
            if target < 0 {
                return
            } else if target == 0 {
                res.append(combine)
                return
            } else {
                for i in start ..< candidates.count {
                    backtracking(target: target - candidates[i],
                                 start: i,
                                 combine: combine + [candidates[i]])
                }
            }
        }

        backtracking(target: target, start: 0, combine: [])
        return res
    }

    func combinationSumHelper(candidates: [Int], target: Int, start: Int, curCombine: [Int], combinations: inout [[Int]]) {
        if target < 0 {
            return
        } else if 0 == target {
            combinations.append(curCombine)
            return
        } else {
            var curCombine = curCombine
            for i in start ..< candidates.count {
                curCombine.append(candidates[i])
                combinationSumHelper(candidates: candidates,
                                     target: target - candidates[i],
                                     start: i,
                                     curCombine: curCombine,
                                     combinations: &combinations)
                curCombine.removeLast()
            }
        }
    }

    func test() {
        let case1 = DataModel(candidates: [2,3,6,7], target: 7)
        let case2 = DataModel(candidates: [2,3,5], target: 8)
        let case3 = DataModel(candidates: [2], target: 1)
        let case4 = DataModel(candidates: [1], target: 1)
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(combinationSum(input.candidates, input.target))
        }
    }

    struct DataModel {
        var candidates: [Int]
        var target: Int
    }
}
