//
//  Permutations.swift
//  leetcode
//
//  Created by Kai Wang on 7/18/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class Permutations {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()

        func backtracking(curPermute: [Int]) {
            guard curPermute.count != nums.count else {
                res.append(curPermute)
                return
            }
            for num in nums {
                if !curPermute.contains(num) {
                    backtracking(curPermute: curPermute + [num])
                }
            }
        }

        backtracking(curPermute: [])
        return res
    }

    func test() {
        let case1 = [1,2,3]
        let case2 = [0,1]
        let case3 = [1]
        let cases = [case1, case2, case3]
        for input in cases {
            print(permute(input))
        }
    }
}
