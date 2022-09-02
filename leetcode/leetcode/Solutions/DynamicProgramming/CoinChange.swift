//
//  CoinChange.swift
//  leetcode
//
//  Created by Kai Wang on 9/1/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class CoinChange {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for a in 1 ... amount {
            for coin in coins where coin <= a {
                dp[a] = min(dp[a], dp[a - coin] + 1)
            }
        }

//        for coin in coins {
//            for i in stride(from: coin, to: amount + 1, by: 1) {
//                amounts[i] = min(amounts[i], amounts[i - coin] + 1)
//            }
//        }

        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }

    func test() {
        let case1 = ([1,2,5], 11)
        let case2 = ([2], 3)
        let case3 = ([1], 0)
        let cases = [case1, case2, case3]
        for input in cases {
            print(coinChange(input.0, input.1))
        }
    }
}
