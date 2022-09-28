//
//  GasStation.swift
//  leetcode
//
//  Created by Kai Wang on 9/27/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class GasStation {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        guard gas.reduce(0, +) >= cost.reduce(0, +) else {
            return -1
        }
        
        var res = 0
        var total = 0
        for i in 0 ..< gas.count {
            total += gas[i] - cost[i]
            if total < 0 {
                total = 0
                res = i + 1
            }
        }
        return res
    }
    
    func test() {
        let case1 = ([1,2,3,4,5], [3,4,5,1,2])
        let case2 = ([2,3,4], [3,4,3])
        let cases = [case1, case2]
        for input in cases {
            print(canCompleteCircuit(input.0, input.1))
        }
    }
}
