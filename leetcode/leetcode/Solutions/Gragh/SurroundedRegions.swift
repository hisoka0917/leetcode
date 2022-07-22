//
//  SurroundedRegions.swift
//  leetcode
//
//  Created by Kai Wang on 7/21/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class SurroundedRegions {
    func solve(_ board: inout [[Character]]) {
        var visited = Set<[Int]>()
        let rows = board.count
        let cols = board[0].count

        func dfs(row: Int, col: Int) {
            guard row >= 0, row < rows, col >= 0, col < cols,
                    board[row][col] == "O",
                    !visited.contains([row, col]) else {
                return
            }
            visited.insert([row, col])
            dfs(row: row + 1, col: col)
            dfs(row: row - 1, col: col)
            dfs(row: row, col: col + 1)
            dfs(row: row, col: col - 1)
        }

        for i in 0 ..< rows {
            dfs(row: i, col: 0)
            dfs(row: i, col: cols - 1)
        }
        for j in 0 ..< cols {
            dfs(row: 0, col: j)
            dfs(row: rows - 1, col: j)
        }

        for i in 0 ..< rows {
            for j in 0 ..< cols {
                if board[i][j] == "O" && !visited.contains([i, j]) {
                    board[i][j] = "X"
                }
            }
        }
    }

    func test() {
        let case1: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
        let case2: [[Character]] = [["X"]]
        let case3: [[Character]] = [["O","O","O"],["O","O","O"],["O","O","O"]]
        let cases = [case1, case2, case3]
        for input in cases {
            var board = input
            solve(&board)
            print(board)
        }
    }
}
