//
//  DecodeWays.swift
//  leetcode
//
//  Created by Kai Wang on 7/15/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class DecodeWays {
    func numDecodings(_ s: String) -> Int {
        var dp = Array(repeating: 0, count: s.count)
        let strArr = Array(s)

        for i in stride(from: strArr.count - 1, to: -1, by: -1) {
            if strArr[i] == "0" {
                dp[i] = 0
            } else {
                dp[i] = i + 1 < strArr.count ? dp[i + 1] : 1
            }
            if i + 1 < strArr.count && (strArr[i] == "1" || (strArr[i] == "2" && "0123456".contains(strArr[i + 1]))) {
                dp[i] += i + 2 < strArr.count ? dp[i + 2] : 1
            }
        }

        return dp[0]
    }

    func test() {
        let cases = ["12", "226", "0", "06"]
        for s in cases {
            print(numDecodings(s))
        }
    }
}
