//
//  Search2DMatrix.swift
//  leetcode
//
//  Created by Kai Wang on 7/12/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class Search2DMatrix {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let colNum = matrix[0].count
        var leftRow = 0, rightRow = matrix.count - 1
        while leftRow < rightRow {
            let midRow = (rightRow + leftRow) / 2
            let midRowHead = matrix[midRow][0]
            let midRowTail = matrix[midRow][colNum - 1]
            guard midRowHead != target && midRowTail != target else {
                return true
            }
            if target < midRowHead {
                rightRow = midRow - 1
            } else if target > midRowTail {
                leftRow = midRow + 1
            } else {
                leftRow = midRow
                break
            }
        }
        var leftCol = 0, rightCol = matrix[leftRow].count - 1
        while leftCol < rightCol {
            let midCol = (leftCol + rightCol) / 2
            let midColVal = matrix[leftRow][midCol]
            guard midColVal != target else {
                return true
            }
            if target > midColVal {
                leftCol = midCol + 1
            } else {
                rightCol = midCol - 1
            }
        }
        return matrix[leftRow][leftCol] == target
    }

    func test() {
        let case1 = ([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)
        let case2 = ([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)
        let case3 = ([[1]], 1)
        let cases = [case1, case2, case3]
        for input in cases {
            print(searchMatrix(input.0, input.1))
        }
    }
}
