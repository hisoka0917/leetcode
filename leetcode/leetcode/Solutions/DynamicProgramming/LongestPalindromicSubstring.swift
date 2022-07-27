//
//  LongestPalindromicSubstring.swift
//  leetcode
//
//  Created by Kai Wang on 8/5/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class LongestPalindromicSubstring {
    func longestPalindrome(_ s: String) -> String {
        var res = ""
        var length = 0
        let string = Array(s)
        for i in 0 ..< string.count {
            // Odd
            var (left, right) = (i, i)
            while left >= 0 && right < string.count && string[left] == string[right] {
                left -= 1
                right += 1
            }
            if right - left + 1 > length {
                res = String(string[left + 1..<right])
                length = right - left + 1
            }
            // Even
            (left, right) = (i, i + 1)
            while left >= 0 && right < string.count && string[left] == string[right] {
                left -= 1
                right += 1
            }
            if right - left + 1 > length {
                res = String(string[left + 1..<right])
                length = right - left + 1
            }
        }
        return res
    }

    func test() {
        let case1 = "babad"
        let case2 = "cbbd"
        let case3 = "ac"
        let case4 = "a"
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(longestPalindrome(input))
        }
    }
}
