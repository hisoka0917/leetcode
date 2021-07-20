//
//  InsertInterval.swift
//  leetcode
//
//  Created by Kai Wang on 7/19/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class InsertInterval {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var newInterval = newInterval

        for i in 0 ..< intervals.count {
            if newInterval[1] < intervals[i][0] {
                res.append(newInterval)
                res.append(contentsOf: intervals[i ..< intervals.count])
                return res
            } else if newInterval[0] > intervals[i][1] {
                res.append(intervals[i])
            } else {
                newInterval = [min(newInterval[0], intervals[i][0]), max(newInterval[1], intervals[i][1])]
            }
        }
        res.append(newInterval)
        return res
    }

    func test() {
        let case1 = DataModel(intervals: [[1,3],[6,9]], newInterval: [2,5])
        let case2 = DataModel(intervals: [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval: [4,8])
        let case3 = DataModel(intervals: [], newInterval: [5,7])
        let case4 = DataModel(intervals: [[1,5]], newInterval: [2,3])
        let case5 = DataModel(intervals: [[1,5]], newInterval: [2,7])
        let cases = [case1, case2, case3, case4, case5]
        for input in cases {
            print(insert(input.intervals, input.newInterval))
        }
    }

    struct DataModel {
        var intervals: [[Int]]
        var newInterval: [Int]
    }
}
