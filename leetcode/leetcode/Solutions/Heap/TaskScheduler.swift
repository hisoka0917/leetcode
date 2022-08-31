//
//  TaskScheduler.swift
//  leetcode
//
//  Created by Kai Wang on 8/30/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class TaskScheduler {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        // Greedy
        guard n > 0 else { return tasks.count }

        let frequency = tasks
            .reduce(into: [:]) { partialResult, task in
                partialResult[task, default: 0] += 1
            }
        let maxFrequency = frequency.values.max()!
        let numMostFreq = frequency.filter { $0.value == maxFrequency }.count

        return max((n + 1) * (maxFrequency - 1) + numMostFreq, tasks.count)
    }

    func test() {
        let case1: ([Character], Int) = (["A","A","A","B","B","B"], 2)
        let case2: ([Character], Int) = (["A","A","A","B","B","B"], 0)
        let case3: ([Character], Int) = (["A","A","A","A","A","A","B","C","D","E","F","G"], 2)
        let cases = [case1, case2, case3]
        for input in cases {
            print(leastInterval(input.0, input.1))
        }
    }
}
