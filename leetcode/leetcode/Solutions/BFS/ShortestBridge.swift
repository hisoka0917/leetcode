//
//  ShortestBridge.swift
//  leetcode
//
//  Created by Kai Wang on 3/25/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ShortestBridge {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        let bounds = grid.count
        var visited = Set<[Int]>()
        let directions = [[-1, 0], [0, -1], [1, 0], [0, 1]]

        func invalid(row: Int, column: Int) -> Bool {
            row < 0 || column < 0 || row >= bounds || column >= bounds
        }

        func dfs(row: Int, column: Int) {
            guard !invalid(row: row, column: column) && grid[row][column] == 1 && !visited.contains([row, column]) else {
                return
            }
            visited.insert([row, column])
            for dir in directions {
                dfs(row: row + dir[0], column: column + dir[1])
            }
        }

        func bfs() -> Int {
            var queue = Array(visited)
            var res = 0
            while !queue.isEmpty {
                let length = queue.count
                for _ in 0 ..< length {
                    let position = queue.removeFirst()
                    for dir in directions {
                        let (dirR, dirC) = (position[0] + dir[0], position[1] + dir[1])
                        if invalid(row: dirR, column: dirC) || visited.contains([dirR, dirC]) {
                            continue
                        }
                        if grid[dirR][dirC] == 0 {
                            visited.insert([dirR, dirC])
                            queue.append([dirR, dirC])
                        } else {
                            return res
                        }
                    }
                }
                res += 1
            }
            return res
        }

        for i in 0 ..< bounds {
            for j in 0 ..< bounds {
                if grid[i][j] == 1 {
                    dfs(row: i, column: j)
                    return bfs()
                }
            }
        }

        return 0
    }

    func test() {
        let case1 = [[0,1],[1,0]]
        let case2 = [[0,1,0],[0,0,0],[0,0,1]]
        let case3 = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
        let cases = [case1, case2, case3]
        for input in cases {
            print(shortestBridge(input))
        }
    }
}
