//
//  ImplementStrStr.swift
//  leetcode
//
//  Created by Wang Kai on 2018/8/29.
//  Copyright © 2018年 Pirate. All rights reserved.
//

import Foundation

class StrStr {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }

        if let lower = haystack.range(of: needle)?.lowerBound.encodedOffset {
            return lower
        } else {
            return -1
        }
    }
}
