//
//  HouseRobber.swift
//  leetcode
//
//  Created by Kai Wang on 7/27/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class HouseRobber {
    func rob(_ nums: [Int]) -> Int {
        var house1 = 0
        var house2 = 0
        for n in nums {
            let maximum = max(house1 + n, house2)
            house1 = house2
            house2 = maximum
        }
        return house2
    }

    func test() {
        let case1 = [1,2,3,1]
        let case2 = [2,7,9,3,1]
        let cases = [case1, case2]
        for input in cases {
            print(rob(input))
        }
    }
}
