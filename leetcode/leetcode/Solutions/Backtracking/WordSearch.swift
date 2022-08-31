//
//  WordSearch.swift
//  leetcode
//
//  Created by Kai Wang on 8/31/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class WordSearch {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let characters = word.map { $0 }
        let n = board.count
        let m = board[0].count
        let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        var visited = Set<[Int]>()

        func backtracking(row: Int, col: Int, charIndex: Int) -> Bool {
            let targetChar = characters[charIndex]
            guard charIndex < characters.count - 1 else {
                return board[row][col] == targetChar
            }
            guard targetChar == board[row][col] else {
                return false
            }
            visited.insert([row, col])
            for direction in directions {
                let nextRow = direction.0 + row
                let nextCol = direction.1 + col
                if nextRow >= 0 && nextRow < n && nextCol >= 0 && nextCol < m, !visited.contains([nextRow, nextCol]) {
                    if backtracking(row: nextRow, col: nextCol, charIndex: charIndex + 1) {
                        return true
                    }
                }
            }
            visited.remove([row,col])
            return false
        }

        for i in 0 ..< n {
            for j in 0 ..< m {
                visited.removeAll()
                if backtracking(row: i, col: j, charIndex: 0) {
                    return true
                }
            }
        }
        return false
    }

    func test() {
        let case1: ([[Character]], String) = ([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")
        let case2: ([[Character]], String) = ([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE")
        let case3: ([[Character]], String) = ([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB")
        let case4: ([[Character]], String) = ([["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]], "ABCEFSADEESE")
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(exist(input.0, input.1))
        }
    }
}
