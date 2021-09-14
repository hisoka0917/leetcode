//
//  MaximumProductoftheLengthofTwoPalindromicSubsequences.swift
//  leetcode
//
//  Created by Kai Wang on 9/13/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class MaximumProductoftheLengthofTwoPalindromicSubsequences {
    func maxProduct(_ s: String) -> Int {
        let length = s.count
        var palindrom = [Int: Int]()
        let strArr = Array(s)
        for mask in 1 ..< 1 << length {
            var subseq = ""
            for i in 0 ..< length {
                if (mask & 1 << i) != 0 { // subsequence
                    subseq += String(strArr[length - i - 1])
                }
            }
            if Array(subseq) == subseq.reversed() {
                palindrom[mask] = subseq.count
            }
        }
        var res = 0
        for m1 in palindrom.keys {
            for m2 in palindrom.keys {
                if m1 & m2 == 0 { // disjoint
                    res = max(res, palindrom[m1]! * palindrom[m2]!)
                }
            }
        }
        return res
    }

    func test() {
        let cases = ["leetcodecom", "bb", "accbcaxxcxx"]
        for s in cases {
            print(maxProduct(s))
        }
    }
}
