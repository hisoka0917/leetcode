//
//  PalindromicSubstrings.swift
//  leetcode
//
//  Created by Kai Wang on 7/27/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class PalindromicSubstrings {
    func countSubstrings(_ s: String) -> Int {
        let strArray = Array(s)
        var count = 0
        for center in 0 ..< strArray.count {
            var (left, right) = (center, center)
            while right + 1 < strArray.count && strArray[right + 1] == strArray[left] {
                right += 1
                count += 1
            }
            while left >= 0 && right < strArray.count && strArray[left] == strArray[right] {
                count += 1
                left -= 1
                right += 1
            }
        }
        return count
    }

    func test() {
        let case1 = "abc"
        let case2 = "aaa"
        let cases = [case1, case2]
        for input in cases {
            print(countSubstrings(input))
        }
    }
}
