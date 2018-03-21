//
//  LongestCommonPrefix.swift
//  leetcode
//
//  Created by Wang Kai on 2018/3/21.
//  Copyright © 2018年 Pirate. All rights reserved.
//

import Foundation

class LongestCommonPrefix {

    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else {
            return ""
        }

        var prefix = strs[0]
        for i in 1..<strs.count {
            while !prefix.isEmpty && !strs[i].hasPrefix(prefix) {
                prefix = String(prefix.prefix(prefix.count - 1))
                // prefix.remove(at: prefix.index(before: prefix.endIndex))
            }
        }
        return prefix
    }

}
