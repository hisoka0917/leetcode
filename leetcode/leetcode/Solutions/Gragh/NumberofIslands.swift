//
//  NumberofIslands.swift
//  leetcode
//
//  Created by Kai Wang on 6/29/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class NumberofIslands {

    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        var numOfIslands = 0

        func dfs(_ point: (Int, Int)) {
            let (row, col) = point
            guard row >= 0,
                    row < m,
                    col >= 0,
                    col < n,
                    grid[row][col] == "1" else {
                return
            }
            grid[row][col] = "2"
            let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
            for (dr, dc) in directions {
                let nxtR = row + dr
                let nxtC = col + dc
                dfs((nxtR, nxtC))
            }
        }

        for i in 0 ..< m {
            for j in 0 ..< n {
                if grid[i][j] == "1" {
                    numOfIslands += 1
                    dfs((i, j))
                }
            }
        }
        return numOfIslands
    }

    /*** TLE on leetcode
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var numOfIslands = 0
        var explored = Set<[Int]>()

        func bfs(_ point: [Int]) {
            var queue = [point]
            while !queue.isEmpty {
                let land = queue.removeFirst() // Change it to queue.removeLast so it becomes dfs
                explored.insert(land)

                let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
                for (dr, dc) in directions {
                    let row = land[0] + dr
                    let col = land[1] + dc
                    if row >= 0 && row < m && col >= 0 && col < n && grid[row][col] == "1" && !explored.contains([row, col]) {
                        queue.append([row, col])
                    }
                }
            }
        }

        for i in 0 ..< m {
            for j in 0 ..< n {
                if grid[i][j] == "1" && !explored.contains([i, j]) {
                    numOfIslands += 1
                    bfs([i,j])
                }
            }
        }
        return numOfIslands
    }
***/

    func test() {
        let case1: [[Character]] = [
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
          ]
        let case2: [[Character]] = [
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
          ]
        let case3: [[Character]] = [
            ["1","1","1"],
            ["0","1","0"],
            ["1","1","1"]
        ]
        let cases = [case1, case2, case3]
        for input in cases {
            print(numIslands(input))
        }
    }
}
