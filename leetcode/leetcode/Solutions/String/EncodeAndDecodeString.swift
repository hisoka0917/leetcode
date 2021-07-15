//
//  EncodeAndDecodeString.swift
//  leetcode
//
//  Created by Kai Wang on 7/14/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class EncodeAndDecodeString {
    func encode(_ strs: [String]) -> String {
        var res = ""
        for s in strs {
            res += String(s.count) + "#" + s
        }
        return res
    }

    func decode(_ str: String) -> [String] {
        var res = [String]()
        var i = 0
        while i < str.count {
            var j = i
            var index = str.index(str.startIndex, offsetBy: j)
            while str[index] != "#" {
                j += 1
                index = str.index(str.startIndex, offsetBy: j)
            }
            if let length = Int(str[str.index(str.startIndex, offsetBy: i) ..< index]) {
                let left = str.index(str.startIndex, offsetBy: j + 1)
                let right = str.index(str.startIndex, offsetBy: j + 1 + length)
                let sub = str[left ..< right]
                res.append(String(sub))
                i = j + 1 + length
            }
        }
        return res
    }
}
