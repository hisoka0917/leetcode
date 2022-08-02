//
//  MergeIntervals.swift
//  leetcode
//
//  Created by Kai Wang on 8/1/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class MergeIntervals {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        var current = [Int]()
        let sorted = intervals.sorted { $0[0] < $1[0] }
        for interval in sorted {
            if current.isEmpty {
                current = interval
            } else if interval[0] > current[1] || interval[1] < current[0] {
                res.append(current)
                current = interval
            } else {
                current = [min(current[0], interval[0]), max(current[1], interval[1])]
            }
        }
        if !current.isEmpty {
            res.append(current)
        }
        return res
    }

    func test() {
        let case1 = [[1,3],[2,6],[8,10],[15,18]]
        let case2 = [[1,4],[4,5]]
        let case3 = [[2,3],[4,5],[6,7],[8,9],[1,10]]
        let cases = [case1, case2, case3]
        for input in cases {
            print(merge(input))
        }
    }
}
