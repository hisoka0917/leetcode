//
//  BestTimetoBuyandSellStock.swift
//  leetcode
//
//  Created by Kai Wang on 6/23/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class BestTimetoBuyandSellStock {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        var left = 0
        var right = 1
        while right < prices.count {
            let low = prices[left]
            let high = prices[right]
            if high < low {
                left = right
            } else {
                profit = max(high - low, profit)
            }
            right += 1
        }

        return profit
    }

    func test() {
        let case1 = [7,1,5,3,6,4]
        let case2 = [7,6,4,3,1]
        let cases = [case1, case2]
        for input in cases {
            print(maxProfit(input))
        }
    }
}
