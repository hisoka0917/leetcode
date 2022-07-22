//
//  RottingOranges.swift
//  leetcode
//
//  Created by Kai Wang on 7/22/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class RottingOranges {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var minutes = 0
        let m = grid.count
        let n = grid[0].count
        var queue = [(Int, Int)]()

        for i in 0 ..< m {
            for j in 0 ..< n {
                if grid[i][j] == 2 {
                    queue.append((i, j))
                }
            }
        }

        let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        // bfs
        while !queue.isEmpty {
            for _ in 0 ..< queue.count {
                let orange = queue.removeFirst()
                for dir in directions {
                    let nxtR = orange.0 + dir.0
                    let nxtC = orange.1 + dir.1
                    if nxtR < 0 || nxtC < 0 || nxtR >= m || nxtC >= n || grid[nxtR][nxtC] != 1 {
                        continue
                    }
                    grid[nxtR][nxtC] = 2
                    queue.append((nxtR, nxtC))
                }
            }
            minutes += queue.isEmpty ? 0 : 1
        }

        for i in 0 ..< m {
            for j in 0 ..< n {
                guard grid[i][j] != 1 else {
                    return -1
                }
            }
        }
        return minutes
    }

    func test() {
        let case1 = [[2,1,1],[1,1,0],[0,1,1]]
        let case2 = [[2,1,1],[0,1,1],[1,0,1]]
        let case3 = [[0,2]]
        let case4 = [[2,1,1],[1,1,1],[0,1,2]]
        let case5 = [[0]]
        let cases = [case1, case2, case3, case4, case5]
        for input in cases {
            print(orangesRotting(input))
        }
    }
}
