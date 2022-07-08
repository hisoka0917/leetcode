//
//  LongestRepeatingCharacterReplacement.swift
//  leetcode
//
//  Created by Kai Wang on 7/8/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class LongestRepeatingCharacterReplacement {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var counts = [String: Int]()
        var maxFrequency = 0
        var left = 0
        var longest = 0
        let string = Array(s)

        for right in 0 ..< string.count {
            let letter = string[right]
            counts[String(letter), default: 0] += 1
            maxFrequency = max(maxFrequency, counts[String(letter)]!)

            while (right - left + 1) - maxFrequency > k {
                counts[String(string[left])]! -= 1
                left += 1
            }

            longest = max(right - left + 1, longest)
        }
        return longest
    }

    func test() {
        let case1 = ("ABAB",2)
        let case2 = ("AABABBA", 1)
        let cases = [case1, case2]
        for input in cases {
            print(characterReplacement(input.0, input.1))
        }
    }
}
