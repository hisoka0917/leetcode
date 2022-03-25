//
//  TwoCityScheduling.swift
//  leetcode
//
//  Created by Kai Wang on 3/25/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class TwoCityScheduling {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let costs = costs.sorted(by: { $0[0] - $0[1] < $1[0] - $1[1] })
        let n = costs.count / 2
        var total = 0
        for i in 0 ..< n {
            total += costs[i][0] + costs[i + n][1]
        }
        return total
    }

    func test() {
        let case1 = [[10,20],[30,200],[400,50],[30,20]]
        let case2 = [[259,770],[448,54],[926,667],[184,139],[840,118],[577,469]]
        let case3 = [[515,563],[451,713],[537,709],[343,819],[855,779],[457,60],[650,359],[631,42]]
        let cases = [case1, case2, case3]
        for input in cases {
            print(twoCitySchedCost(input))
        }
    }
}
