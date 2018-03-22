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
        var substring = ""
        var length = 0
        for (_, char) in s.enumerated() {
            if let foundChar = substring.index(of: char) {
                substring.removeSubrange(substring.startIndex...foundChar)
            }
            substring.append(char)
            length = substring.count > length ? substring.count : length
        }
        return length
    }
}
