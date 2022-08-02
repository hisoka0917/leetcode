//
//  MeetingRoomsII.swift
//  leetcode
//
//  Created by Kai Wang on 8/1/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class MeetingRoomsII {
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        let starts = intervals.map { $0.start }.sorted()
        let ends = intervals.map { $0.end }.sorted()
        var (count, maxRooms) = (0, 0)
        var (s, e) = (0, 0)
        while s < starts.count {
            if starts[s] < ends[e] {
                count += 1
                s += 1
            } else {
                count -= 1
                e += 1
            }
            maxRooms = max(maxRooms, count)
        }
        return maxRooms
    }

    func test() {
        let case1 = [(0,30),(5,10),(15,20)]
        let case2 = [(2,7)]
        let cases = [case1, case2]
        for input in cases {
            var intervals = [Interval]()
            for (start, end) in input {
                intervals.append(Interval(start, end))
            }
            print(minMeetingRooms(intervals))
        }
    }
}
