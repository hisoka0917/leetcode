//
//  ValidPalindrome.swift
//  leetcode
//
//  Created by Kai Wang on 6/22/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ValidPalindrome {
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }

        let s = Array(s)
        var i = 0
        var j = s.count - 1

        while i < j {
            if !s[i].isLetter, !s[i].isNumber {
                i += 1
                continue
            }

            if !s[j].isLetter, !s[j].isNumber {
                j -= 1
                continue
            }

            guard s[i].lowercased() == s[j].lowercased() else { return false }
            i += 1
            j -= 1
        }

        return true
    }

    func test() {
        let case1 = "A man, a plan, a canal: Panama"
        let case2 = "race a car"
        let case3 = " "
        let case4 = "a"
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(isPalindrome(input))
        }
    }
}
