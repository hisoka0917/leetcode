//
//  DailyTemperatures.swift
//  leetcode
//
//  Created by Kai Wang on 7/11/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class DailyTemperatures {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answer = Array(repeating: 0, count: temperatures.count)
        var stack = [(Int, Int)]()

        for (index, item) in temperatures.enumerated() {
            while !stack.isEmpty, stack.last!.1 < item {
                let last = stack.removeLast()
                answer[last.0] = index - last.0
            }
            stack.append((index, item))
        }

        return answer
    }

    func test() {
        let case1 = [73,74,75,71,69,72,76,73]
        let case2 = [30,40,50,60]
        let case3 = [30,60,90]
        let cases = [case1, case2, case3]
        for input in cases {
            print(dailyTemperatures(input))
        }
    }
}
