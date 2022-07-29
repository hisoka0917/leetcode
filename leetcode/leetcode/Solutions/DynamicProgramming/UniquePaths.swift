//
//  UniquePaths.swift
//  leetcode
//
//  Created by Kai Wang on 7/28/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class UniquePaths {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var grid = Array(repeating: Array(repeating: 0, count: n), count: m)
        grid[0][0] = 1
        for i in 0 ..< m {
            for j in 0 ..< n {
                let left = j > 0 ? grid[i][j - 1] : 0
                let top = i > 0 ? grid[i - 1][j] : 0
                grid[i][j] += left + top
            }
        }
        return grid[m - 1][n - 1]
    }

    func test() {
        let case1 = (3,7)
        let case2 = (3,2)
        let cases = [case1, case2]
        for input in cases {
            print(uniquePaths(input.0, input.1))
        }
    }
}
