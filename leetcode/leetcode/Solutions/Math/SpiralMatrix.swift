//
//  SpiralMatrix.swift
//  leetcode
//
//  Created by Kai Wang on 8/2/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class SpiralMatrix {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var left = 0
        var top = 0
        var bottom = matrix.count
        var right = matrix[0].count
        var res = [Int]()

        while top < bottom && left < right {
            // from left to right on top
            for i in left ..< right {
                res.append(matrix[top][i])
            }
            top += 1
            // from top to bottom on right
            for i in top ..< bottom {
                res.append(matrix[i][right - 1])
            }
            right -= 1

            guard top < bottom && left < right else { break }

            // from right to left on bottom
            for i in stride(from: right - 1, through: left, by: -1) {
                res.append(matrix[bottom - 1][i])
            }
            bottom -= 1
            // from bottom to top on left
            for i in stride(from: bottom - 1, through: top, by: -1) {
                res.append(matrix[i][left])
            }
            left += 1
        }

        return res
    }

    func test() {
        let case1 = [[1,2,3],[4,5,6],[7,8,9]]
        let case2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
        let cases = [case1, case2]
        for input in cases {
            print(spiralOrder(input))
        }
    }
}
