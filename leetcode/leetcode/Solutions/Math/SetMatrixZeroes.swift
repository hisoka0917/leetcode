//
//  SetMatrixZeroes.swift
//  leetcode
//
//  Created by Kai Wang on 8/2/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class SetMatrixZeroes {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        var zeroRows = Set<Int>()
        var zeroCols = Set<Int>()
        for i in 0 ..< rows {
            for j in 0 ..< cols {
                if matrix[i][j] == 0 {
                    zeroRows.insert(i)
                    zeroCols.insert(j)
                }
            }
        }
        for row in zeroRows {
            for col in 0 ..< cols {
                matrix[row][col] = 0
            }
        }
        for col in zeroCols {
            for row in 0 ..< rows {
                matrix[row][col] = 0
            }
        }
    }

    func test() {
        let case1 = [[1,1,1],[1,0,1],[1,1,1]]
        let case2 = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
        let cases = [case1, case2]
        for input in cases {
            var input = input
            setZeroes(&input)
            print(input)
        }
    }
}
