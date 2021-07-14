//
//  CombinationSumII.swift
//  leetcode
//
//  Created by Kai Wang on 7/13/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class CombinationSumII {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        let candidates = candidates.sorted()
        backtrack(candidates: candidates, target: target, start: 0, curCombine: [], combinations: &res)
        return res
    }

    private func backtrack(candidates: [Int], target: Int, start: Int, curCombine: [Int], combinations: inout [[Int]]) {
        if target < 0 {
            return
        } else if 0 == target {
            combinations.append(curCombine)
            return
        } else {
            var curCombine = curCombine
            var prev = -1
            for i in start ..< candidates.count {
                if candidates[i] == prev {
                    continue
                }
                curCombine.append(candidates[i])
                backtrack(candidates: candidates,
                          target: target - candidates[i],
                          start: i + 1,
                          curCombine: curCombine,
                          combinations: &combinations)
                curCombine.removeLast()
                prev = candidates [i]
            }
        }
    }

    func test() {
        let case1 = DataModel(candidates: [10,1,2,7,6,1,5], target: 8)
        let case2 = DataModel(candidates: [2,5,2,1,2], target: 5)
        let cases = [case1, case2]
        for input in cases {
            print(combinationSum2(input.candidates, input.target))
        }
    }

    struct DataModel {
        var candidates: [Int]
        var target: Int
    }
}
