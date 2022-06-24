//
//  MinStack.swift
//  leetcode
//
//  Created by Kai Wang on 6/23/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class MinStack {
    private var minimumElement = Int.max
    private var stack: [Int]

    init() {
        stack = []
    }

    func push(_ val: Int) {
        stack.append(val)
        minimumElement = min(val, minimumElement)
    }

    func pop() {
        guard !stack.isEmpty else { return }
        let last = stack.removeLast()
        if last == minimumElement {
            minimumElement = stack.isEmpty ? .max : stack.min()!
        }
    }

    func top() -> Int {
        stack.last!
    }

    func getMin() -> Int {
        minimumElement
    }

    static func test() {
        let minStack = MinStack()
        minStack.push(-2)
        minStack.push(0)
        minStack.push(-3)
        print(minStack.getMin())
        minStack.pop()
        print(minStack.top())
        print(minStack.getMin())
    }
}
