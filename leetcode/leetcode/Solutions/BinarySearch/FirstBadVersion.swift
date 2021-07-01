//
//  FirstBadVersion.swift
//  leetcode
//
//  Created by Kai Wang on 6/30/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class VersionControl {
    var bad: Int
    init(bad: Int) {
        self.bad = bad
    }
    func isBadVersion(_ version: Int) -> Bool {
        return version >= bad
    }
}


class FirstBadVersion : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var lower = 1
        var upper = n
        while lower < upper {
            let current = (lower + upper) / 2
            if isBadVersion(current) {
                upper = current
            } else {
                lower = current + 1
            }
        }
        return lower
    }

    static func test() {
        let case1 = DataModel(n: 5, bad: 4)
        let case2 = DataModel(n: 1, bad: 1)
        let cases = [case1, case2]
        for input in cases {
            let solution = FirstBadVersion(bad: input.bad)
            print(solution.firstBadVersion(input.n))
        }
    }

    struct DataModel {
        var n: Int
        var bad: Int
    }
}
