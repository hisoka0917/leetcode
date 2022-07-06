//
//  SingleNumber.swift
//  leetcode
//
//  Created by Kai Wang on 7/5/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class SingleNumber {
    func singleNumber(_ nums: [Int]) -> Int {
        nums.reduce(0, ^)
    }

    func test() {
        let case1 = [2,2,1]
        let case2 = [4,1,2,1,2]
        let case3 = [1]
        let cases = [case1, case2, case3]
        for input in cases {
            print(singleNumber(input))
        }
    }
}
