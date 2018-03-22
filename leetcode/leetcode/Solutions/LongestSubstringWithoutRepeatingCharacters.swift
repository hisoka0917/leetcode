//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  leetcode
//
//  Created by Wang Kai on 2018/3/22.
//  Copyright © 2018年 Pirate. All rights reserved.
//

import Foundation

class LongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charDict: [Character: Int] = [:]
        var length = 0
        var left = 0
        for (index, char) in s.enumerated() {
            if let foundIndex = charDict[char] {
                left = max(foundIndex + 1, left)
            }
            charDict[char] = index
            length = max(index - left + 1, length)
        }
        return length
    }
}
