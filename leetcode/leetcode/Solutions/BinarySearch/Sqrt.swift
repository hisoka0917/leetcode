//
//  Sqrt.swift
//  leetcode
//
//  Created by Kai Wang on 7/1/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class Sqrt {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else {
            return x
        }
        var left = 1
        var right = x / 2
        while left <= right {
            let mid = (left + right) / 2
            if mid * mid == x {
                return mid
            } else if mid * mid > x {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return right
    }

    func test() {
        let cases = [4,8]
        for input in cases {
            print(mySqrt(input))
        }
    }
}
