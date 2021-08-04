//
//  LastStoneWeight.swift
//  leetcode
//
//  Created by Kai Wang on 8/3/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class LastStoneWeight {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        guard stones.count > 1 else {
            return stones.count == 1 ? stones[0] : 0
        }
        var heap = Heap(array: stones, sort: >)
        while heap.count > 1 {
            let num1 = heap.remove()!
            let num2 = heap.remove()!
            let leftOver = abs(num1 - num2)
            if leftOver > 0 {
                heap.insert(leftOver)
            }
        }
        return heap.count == 1 ? heap.peek()! : 0
    }

    func test() {
        let case1 = [2,7,4,1,8,1]
        let cases = [case1]
        for input in cases {
            print(lastStoneWeight(input))
        }
    }
}
