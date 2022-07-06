//
//  MeetingRooms.swift
//  leetcode
//
//  Created by Kai Wang on 7/5/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class MeetingRooms {
    func canAttendMeetings(_ intervals: Array<Interval>) -> Bool {
        let sorted = intervals.sorted { $0.start < $1.end }
        for i in 1 ..< sorted.count {
            if sorted[i].start < sorted[i - 1].end {
                return false
            }
        }
        return true
    }

    func test() {
        let case1 = [(0,30),(5,10),(15,20)]
        let case2 = [(5,8),(9,15)]
        let case3 = [(0,8),(8,10)]
        let cases = [case1, case2, case3]
        for input in cases {
            var intervals = [Interval]()
            for tuple in input {
                intervals.append(Interval(tuple.0, tuple.1))
            }
            print(canAttendMeetings(intervals))
        }
    }
}
