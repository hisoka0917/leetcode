//
//  MinimumPathSum.swift
//  leetcode
//
//  Created by Kai Wang on 7/15/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class MinimumPathSum {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var res = grid
        for r in 0 ..< rows {
            for c in 0 ..< cols {
                guard r > 0 || c > 0 else {
                    continue
                }
                let left = c - 1 < 0 ? Int.max : res[r][c - 1]
                let up = r - 1 < 0 ? Int.max : res[r - 1][c]
                res[r][c] = min(left, up) + grid[r][c]
            }
        }
        return res[rows - 1][cols - 1]
    }

    func test() {
        let case1 = [[1,3,1],[1,5,1],[4,2,1]]
        let case2 = [[1,2,3],[4,5,6]]
        let cases = [case1, case2]
        for input in cases {
            print(minPathSum(input))
        }
    }
}
