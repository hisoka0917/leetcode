//
//  KthLargestElementinaStream.swift
//  leetcode
//
//  Created by Kai Wang on 6/27/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class KthLargest {

    private var topKth = [Int]()
    private var numK = 0

    init(_ k: Int, _ nums: [Int]) {
        self.numK = k
        guard !nums.isEmpty else {
            self.topKth = []
            return
        }
        self.topKth = nums
            .sorted(by: >)
            .dropLast(max(nums.count - k, 0))
    }

    func add(_ val: Int) -> Int {
        insert(val)
        return topKth.last!
    }

    private func insert(_ val: Int) {
        guard let kthItem = topKth.last else {
            topKth.append(val)
            return
        }
        if topKth.count == numK {
            if val > kthItem {
                topKth.removeLast()
            } else {
                return
            }
        }

        let length = topKth.count
        for i in 0 ..< length {
            if val >= topKth[i] {
                topKth.insert(val, at: i)
                break
            }
        }
        if topKth.count == length {
            topKth.append(val)
        }
    }

    static func test() {
        let obj = KthLargest(1, [])
        print(obj.add(-3))
        print(obj.add(-2))
        print(obj.add(-4))
        print(obj.add(0))
        print(obj.add(4))
    }
}
