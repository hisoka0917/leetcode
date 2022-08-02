//
//  Non-overlappingIntervals.swift
//  leetcode
//
//  Created by Kai Wang on 8/1/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class NonOverlappingIntervals {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted { $0[0] < $1[0] }
        var count = 0
        var rightBound = -Int.max
        for interval in sorted {
            if interval[0] < rightBound {
                count += 1
                rightBound = min(rightBound, interval[1])
            } else {
                rightBound = interval[1]
            }
        }
        return count
    }

    func test() {
        let case1 = [[1,2],[2,3],[3,4],[1,3]]
        let case2 = [[1,2],[1,2],[1,2]]
        let case3 = [[1,2],[2,3]]
        let cases = [case1, case2, case3]
        for input in cases {
            print(eraseOverlapIntervals(input))
        }
    }
}
