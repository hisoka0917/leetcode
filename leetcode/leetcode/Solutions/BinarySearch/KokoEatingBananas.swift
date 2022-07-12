//
//  KokoEatingBananas.swift
//  leetcode
//
//  Created by Kai Wang on 7/12/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class KokoEatingBananas {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
//        guard h > piles.count else {
//            return piles.max()!
//        }
        var min = 1
        var max = piles.max()!
        var res = max
        while min <= max {
            let mid = (min + max) / 2
            let eatingHours = piles.reduce(into: 0) { partialResult, item in
                partialResult += Int(ceil(Double(item) / Double(mid)))
            }
            if eatingHours <= h {
                res = mid
                max = mid - 1
            } else {
                min = mid + 1
            }
        }
        return res
    }

    func test() {
        let case1 = ([3,6,7,11], 8)
        let case2 = ([30,11,23,4,20], 5)
        let case3 = ([30,11,23,4,20], 6)
        let case4 = ([312884470], 312884469)
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(minEatingSpeed(input.0, input.1))
        }
    }
}
