//
//  PacificAtlanticWaterFlow.swift
//  leetcode
//
//  Created by Kai Wang on 7/20/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class PacificAtlanticWaterFlow {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let m = heights.count
        let n = heights[0].count
        var pacific = Set<[Int]>()
        var atlantic = Set<[Int]>()
        var res = [[Int]]()
        let directions = [(0,1), (1,0), (0,-1), (-1,0)]

        func dfs(row: Int, col: Int, visited: inout Set<[Int]>, prevHeight: Int) {
            guard row >= 0, row < m, col >= 0, col < n,
                    !visited.contains([row, col]),
                    prevHeight <= heights[row][col] else {
                return
            }
            visited.insert([row, col])
            for direction in directions {
                let nextR = direction.0 + row
                let nextC = direction.1 + col
                dfs(row: nextR, col: nextC, visited: &visited, prevHeight: heights[row][col])
            }
        }

        for row in 0 ..< m {
            dfs(row: row, col: 0, visited: &pacific, prevHeight: 0)
            dfs(row: row, col: n - 1, visited: &atlantic, prevHeight: 0)
        }
        for col in 0 ..< n {
            dfs(row: 0, col: col, visited: &pacific, prevHeight: 0)
            dfs(row: m - 1, col: col, visited: &atlantic, prevHeight: 0)
        }

        for i in 0 ..< m {
            for j in 0 ..< n {
                if pacific.contains([i, j]) && atlantic.contains([i, j]) {
                    res.append([i, j])
                }
            }
        }

        return res
//        return Array(pacific.intersection(atlantic))
    }

    func test() {
        let case1 = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
        let case2 = [[2,1],[1,2]]
        let cases = [case1, case2]
        for input in cases {
            print(pacificAtlantic(input))
        }
    }
}
