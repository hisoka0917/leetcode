//
//  ContainerWithMostWater.swift
//  leetcode
//
//  Created by Kai Wang on 8/5/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ContainerWithMostWater {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            let area = (right - left) * min(height[left], height[right])
            maxArea = max(area, maxArea)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }

    func test() {
        let case1 = [1,8,6,2,5,4,8,3,7]
        let case2 = [1,1]
        let cases = [case1, case2]
        for input in cases {
            print(maxArea(input))
        }
    }
}
