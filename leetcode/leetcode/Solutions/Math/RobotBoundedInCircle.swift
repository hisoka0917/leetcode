//
//  RobotBoundedInCircle.swift
//  leetcode
//
//  Created by Kai Wang on 7/22/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class RobotBoundedInCircle {
    func isRobotBounded(_ instructions: String) -> Bool {
        var dirX = 0
        var dirY = 1
        var x = 0
        var y = 0
        for c in instructions {
            if c == "G" {
                x += dirX
                y += dirY
            } else if c == "L" {
                dirY = -dirY
                swap(&dirX, &dirY)
            } else {
                dirX = -dirX
                swap(&dirX, &dirY)
            }
        }
        return (x == 0 && y == 0) || (dirX, dirY) != (0, 1)
    }

    func test() {
        let case1 = "GGLLGG"
        let case2 = "GG"
        let case3 = "GL"
        let cases = [case1, case2, case3]
        for input in cases {
            print(isRobotBounded(input))
        }
    }
}
