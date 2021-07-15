//
//  UniqueLength3PalindromicSubsequences.swift
//  leetcode
//
//  Created by Kai Wang on 7/15/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class UniqueLength3PalindromicSubsequences {
    func countPalindromicSubsequence(_ s: String) -> Int {
        //Time Limit Exceeded
        struct Palindrom: Hashable {
            let mid: Character
            let out: Character
        }
        var res = Set<Palindrom>()
        var left = Set<Character>()
        var right = [Character: Int]()
        for char in s {
            right[char] = (right[char] ?? 0) + 1
        }
        let xs = (0..<26).map({Character(UnicodeScalar("a".unicodeScalars.first!.value + $0)!)})
        for char in s {
            if var ccount = right[char] {
                ccount -= 1
                if ccount == 0 {
                    right.removeValue(forKey: char)
                } else {
                    right[char] = ccount
                }
            }

            for c in xs {
                if left.contains(c) && right.keys.contains(c) {
                    res.insert(Palindrom(mid: char, out: c))
                }
            }
            left.insert(char)
        }
        return res.count
    }

    func countPalindromicSubsequence2(_ s: String) -> Int {
        var res = 0
        var first = Array(repeating: s.count, count: 26)
        var last = Array(repeating: -1, count: 26)
        let stringArray = Array(s)
        for i in 0 ..< stringArray.count {
            let index = Int(stringArray[i].asciiValue! - Character("a").asciiValue!)
            first[index] = min(first[index], i)
            last[index] = i
        }
        for i in 0 ..< 26 {
            if first[i] < last[i] {
                res += Array(Set(stringArray[first[i] + 1 ..< last[i]])).count
            }
        }

        return res
    }

    func test() {
        let case1 = "aabca"
        let case2 = "adc"
        let case3 = "bbcbaba"
        let cases = [case1, case2, case3]
        for input in cases {
            print(countPalindromicSubsequence2(input))
        }
    }
}
