//
//  TopKFrequentElements.swift
//  leetcode
//
//  Created by Kai Wang on 7/6/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class TopKFrequentElements {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let res = nums
            .reduce(into: [:]) { counter, num in
                counter[num, default: 0] += 1
            }
            .sorted { $0.value > $1.value }
            .map { $0.key }
            .prefix(k)
        return Array(res)
    }

    func test() {
        let case1 = ([1,1,1,2,2,3], 2)
        let case2 = ([1], 1)
        let cases = [case1, case2]
        for input in cases {
            print(topKFrequent(input.0, input.1))
        }
    }
}
