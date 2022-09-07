//
//  LongestCommonSubsequence.swift
//  leetcode
//
//  Created by Kai Wang on 9/7/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class LongestCommonSubsequence {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let arr1 = Array(text1)
        let arr2 = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: arr2.count + 1), count: arr1.count + 1)

        // bottom up
        for i in stride(from: arr1.count - 1, to: -1, by: -1) {
            for j in stride(from: arr2.count - 1, to: -1, by: -1) {
                if arr1[i] == arr2[j] {
                    dp[i][j] = dp[i + 1][j + 1] + 1
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i][j + 1])
                }
            }
        }

        return dp[0][0]

        // top down
//        for i in 0..<t1.endIndex {
//            for j in 0..<t2.endIndex {
//                if t1[i] == t2[j] {
//                    dp[i + 1][j + 1] = dp[i][j] + 1
//                } else {
//                    dp[i + 1][j + 1] = max(dp[i + 1][j], dp[i][j + 1])
//                }
//            }
//        }
    }

    func test() {
        let case1 = ("abcde", "ace")
        let case2 = ("abc", "abc")
        let case3 = ("abc", "def")
        let cases = [case1, case2, case3]
        for input in cases {
            print(longestCommonSubsequence(input.0, input.1))
        }
    }
}
