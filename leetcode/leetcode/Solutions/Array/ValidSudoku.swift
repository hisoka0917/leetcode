//
//  ValidSudoku.swift
//  leetcode
//
//  Created by Kai Wang on 7/6/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class ValidSudoku {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSet = Array(repeating: Set<Int>(), count: 9)
        var colSet = Array(repeating: Set<Int>(), count: 9)
        var boxSet = Array(repeating: Set<Int>(), count: 9)

        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                if let number = board[i][j].wholeNumberValue {
                    let boxIndex = i / 3 * 3 + j / 3
                    guard !rowSet[i].contains(number),
                          !colSet[j].contains(number),
                          !boxSet[boxIndex].contains(number) else {
                        return false
                    }
                    rowSet[i].insert(number)
                    colSet[j].insert(number)
                    boxSet[boxIndex].insert(number)
                }
            }
        }
        return true
    }

    func test() {
        let case1: [[Character]] = [["5","3",".",".","7",".",".",".","."]
                                     ,["6",".",".","1","9","5",".",".","."]
                                     ,[".","9","8",".",".",".",".","6","."]
                                     ,["8",".",".",".","6",".",".",".","3"]
                                     ,["4",".",".","8",".","3",".",".","1"]
                                     ,["7",".",".",".","2",".",".",".","6"]
                                     ,[".","6",".",".",".",".","2","8","."]
                                     ,[".",".",".","4","1","9",".",".","5"]
                                     ,[".",".",".",".","8",".",".","7","9"]]
        let case2: [[Character]] = [["8","3",".",".","7",".",".",".","."]
                                    ,["6",".",".","1","9","5",".",".","."]
                                    ,[".","9","8",".",".",".",".","6","."]
                                    ,["8",".",".",".","6",".",".",".","3"]
                                    ,["4",".",".","8",".","3",".",".","1"]
                                    ,["7",".",".",".","2",".",".",".","6"]
                                    ,[".","6",".",".",".",".","2","8","."]
                                    ,[".",".",".","4","1","9",".",".","5"]
                                    ,[".",".",".",".","8",".",".","7","9"]]
        let cases = [case1, case2]
        for input in cases {
            print(isValidSudoku(input))
        }
    }
}
