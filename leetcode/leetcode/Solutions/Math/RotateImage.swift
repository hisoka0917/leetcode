//
//  RotateImage.swift
//  leetcode
//
//  Created by Kai Wang on 8/2/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class RotateImage {
    func rotate(_ matrix: inout [[Int]]) {
        var left = 0
        var right = matrix.count - 1
        while left < right {
            let top = left
            let bottom = right
            for i in 0 ..< right - left {
                // move top left to temp
                let temp = matrix[top][left + i]

                // move bottom left to top left
                matrix[top][left + i] = matrix[bottom - i][left]

                // move bottom right to bottom left
                matrix[bottom - i][left] = matrix[bottom][right - i]

                // move top right to bottom right
                matrix[bottom][right - i] = matrix[top + i][right]

                // move top left to top right
                matrix[top + i][right] = temp
            }
            left += 1
            right -= 1
        }
    }

    func test() {
        let case1 = [[1,2,3],[4,5,6],[7,8,9]]
        let case2 = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
        let cases = [case1, case2]
        for input in cases {
            var input = input
            rotate(&input)
            print(input)
        }
    }
}
