//
//  ImplementStackusingQueues.swift
//  leetcode
//
//  Created by Kai Wang on 11/23/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

struct QueueArray {
    private var array: [Int] = []

    var isEmpty: Bool {
        array.isEmpty
    }

    var last: Int {
        array.last!
    }

    var peek: Int {
        array.first!
    }

    mutating func enqueue(_ element: Int) {
        array.append(element)
    }

    mutating func dequeue() -> Int? {
        isEmpty ? nil : array.removeFirst()
    }

    func reversed() -> QueueArray {
        var queue = self // 1
        var stack: [Int] = [] // 2
        while let element = queue.dequeue() {
            stack.append(element)
        }
        while let element = stack.popLast() {
            queue.enqueue(element)
        }
        return queue
    }


}

class MyStack {
    var first = QueueArray()
    var second = QueueArray()

    func push(_ x: Int) {
        first.enqueue(x)
    }

    func pop() -> Int {
        if second.isEmpty {
            second = first.reversed()
            first = QueueArray()
        }
        return second.dequeue()!
    }

    func top() -> Int {
        !second.isEmpty ? second.peek : first.last
    }

    func empty() -> Bool {
        first.isEmpty && second.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
