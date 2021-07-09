//
//  EliminateMaximumNumberofMonsters.swift
//  leetcode
//
//  Created by Kai Wang on 7/8/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class EliminateMaximumNumberofMonsters {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        var minutReach = [Int]()
        for i in 0 ..< dist.count {
            let minute = ceil(Double(dist[i]) / Double(speed[i]))
            minutReach.append(Int(minute))
        }
        var count = 0
        minutReach.sort()
        for i in 0 ..< minutReach.count {
            guard i < minutReach[i] else {
                return count
            }
            count += 1
        }
        return count
    }

    func test() {
        let case1 = DataModel(dist: [1,3,4], speed: [1,1,1])
        let case2 = DataModel(dist: [1,1,2,3], speed: [1,1,1,1])
        let case3 = DataModel(dist: [3,2,4], speed: [5,3,2])
        let case4 = DataModel(dist: [46,33,44,42,46,36,7,36,31,47,38,42,43,48,48,25,28,44,49,47,29,32,30,6,42,9,39,48,22,26,50,34,40,22,10,45,7,43,24,18,40,44,17,39,36],
                              speed: [1,2,1,3,1,1,1,1,1,1,1,1,1,1,7,1,1,3,2,2,2,1,2,1,1,1,1,1,1,1,1,6,1,1,1,8,1,1,1,3,6,1,3,1,1])
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(eliminateMaximum(input.dist, input.speed))
        }
    }

    struct DataModel {
        var dist: [Int]
        var speed: [Int]
    }
}
