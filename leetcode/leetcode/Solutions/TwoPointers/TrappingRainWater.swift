//
//  TrappingRainWater.swift
//  leetcode
//
//  Created by Kai Wang on 8/5/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class TrappingRainWater {
    func trap(_ height: [Int]) -> Int {
        guard !height.isEmpty else { return 0 }
        var left = 0
        var right = height.count - 1
        var leftMax = height[left]
        var rightMax = height[right]
        var water = 0
        while left < right {
            if leftMax < rightMax {
                left += 1
                leftMax = max(leftMax, height[left])
                water += leftMax - height[left]
            } else {
                right -= 1
                rightMax = max(rightMax, height[right])
                water += rightMax - height[right]
            }
        }
        return water
    }

    func test() {
        let case1 = [0,1,0,2,1,0,1,3,2,1,2,1]
        let case2 = [4,2,0,3,2,5]
        let case3 = [0]
        let cases = [case1, case2, case3]
        for input in cases {
            print(trap(input))
        }
    }
}
