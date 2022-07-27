//
//  HouseRobberII.swift
//  leetcode
//
//  Created by Kai Wang on 7/27/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class HouseRobberII {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums[0]
        }
        var house1 = 0
        var house2 = 0
        for i in 0 ..< nums.count - 1 {
            let maximum = max(house1 + nums[i], house2)
            house1 = house2
            house2 = maximum
        }
        let max1 = house2
        house1 = 0
        house2 = 0
        for i in 1 ..< nums.count {
            let maximum = max(house1 + nums[i], house2)
            house1 = house2
            house2 = maximum
        }
        let max2 = house2

        return max(max1, max2)
    }

    func test() {
        let case1 = [1,2,3,1]
        let case2 = [2,7,9,3,1]
        let case3 = [2,3,2]
        let cases = [case1, case2, case3]
        for input in cases {
            print(rob(input))
        }
    }
}
