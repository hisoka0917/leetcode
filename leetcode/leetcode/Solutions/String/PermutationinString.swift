//
//  PermutationinString.swift
//  leetcode
//
//  Created by Kai Wang on 11/23/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class PermutationinString {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s2.count >= s1.count else { return false }
        var s1count = Array(repeating: 0, count: 26)
        var s2count = Array(repeating: 0, count: 26)
        let arr1 = Array(s1)
        let arr2 = Array(s2)
        for i in 0 ..< arr1.count {
            let i1 = Int(arr1[i].asciiValue! - Character("a").asciiValue!)
            s1count[i1] += 1
            let i2 = Int(arr2[i].asciiValue! - Character("a").asciiValue!)
            s2count[i2] += 1
        }

        var matches = 0
        for i in 0..<26 {
            matches += s1count[i] == s2count[i] ? 1 : 0
        }
        var l = 0

        for r in arr1.count..<arr2.count {
            if matches == 26 {
                return true
            }
            var index = Int(arr2[r].asciiValue! - Character("a").asciiValue!)
            s2count[index] += 1
            if s1count[index] == s2count[index] {
                matches += 1
            } else if s1count[index] + 1 == s2count[index] {
                matches -= 1
            }

            index = Int(arr2[l].asciiValue! - Character("a").asciiValue!)
            s2count[index] -= 1
            if s1count[index] == s2count[index] {
                matches += 1
            } else if s1count[index] - 1 == s2count[index] {
                matches -= 1
            }
            l += 1
        }
        return matches == 26
    }

    func test() {
        let case1 = ["ab", "eidbaooo"]
        let case2 = ["ab", "eidboaoo"]
        let case3 = ["adc", "dcda"]
        let case4 = ["ab", "ab"]
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(checkInclusion(input[0], input[1]))
        }
    }
}
