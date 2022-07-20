//
//  MaxAreaofIsland.swift
//  leetcode
//
//  Created by Kai Wang on 7/20/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class MaxAreaofIsland {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var maxArea = 0
        var grid = grid
        let directions = [(0,1), (1,0), (0,-1), (-1,0)]

        func dfs(_ point: (Int, Int)) -> Int {
            let (row, col) = point
            guard row >= 0, row < m, col >= 0, col < n, grid[row][col] == 1 else {
                return 0
            }
            grid[row][col] = 0
            var landArea = 1
            for (dr, dc) in directions {
                let nextR = dr + row
                let nextC = dc + col
                landArea += dfs((nextR, nextC))
            }
            return landArea
        }

        for i in 0 ..< m {
            for j in 0 ..< n {
                if grid[i][j] == 1 {
                    maxArea = max(maxArea, dfs((i, j)))
                }
            }
        }
        return maxArea
    }

    func test() {
        let case1 = [[0,0,1,0,0,0,0,1,0,0,0,0,0],
                     [0,0,0,0,0,0,0,1,1,1,0,0,0],
                     [0,1,1,0,1,0,0,0,0,0,0,0,0],
                     [0,1,0,0,1,1,0,0,1,0,1,0,0],
                     [0,1,0,0,1,1,0,0,1,1,1,0,0],
                     [0,0,0,0,0,0,0,0,0,0,1,0,0],
                     [0,0,0,0,0,0,0,1,1,1,0,0,0],
                     [0,0,0,0,0,0,0,1,1,0,0,0,0]]
        let case2 = [[0,0,0,0,0,0,0,0]]
        let case3 = [[1]]
        let cases = [case1, case2, case3]
        for input in cases {
            print(maxAreaOfIsland(input))
        }
    }
}
