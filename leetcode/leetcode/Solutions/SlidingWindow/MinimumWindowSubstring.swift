//
//  MinimumWindowSubstring.swift
//  leetcode
//
//  Created by Kai Wang on 8/8/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class MinimumWindowSubstring {
    func minWindow(_ s: String, _ t: String) -> String {
        let string = Array(s)
        let charDict = t.reduce(into: [:]) { dict, char in
            dict[char, default: 0] += 1
        }
        var window = [String.Element: Int]()
        var left = 0
        var range = (0, string.count)
        var have = 0
        let need = charDict.keys.count
        for right in 0 ..< string.count {
            let char = string[right]
            if let count = charDict[char] {
                window[char, default: 0] += 1
                if window[char]! == count {
                    have += 1
                }
            }
            while have == need {
                if right - left < range.1 - range.0 {
                    range = (left, right)
                }
                let ch = string[left]
                if let count = charDict[ch] {
                    window[ch]! -= 1
                    if window[ch]! < count {
                        have -= 1
                    }
                }
                left += 1
            }
        }

        guard range.1 != string.count else {
            return ""
        }
        return String(string[range.0 ... range.1])
    }

    func test() {
        let case1 = ("ADOBECODEBANC", "ABC")
        let case2 = ("a", "a")
        let case3 = ("a", "aa")
        let case4 = ("aaaaaaaaaaaabbbbbcdd", "abcdd")
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(minWindow(input.0, input.1))
        }
    }
}
