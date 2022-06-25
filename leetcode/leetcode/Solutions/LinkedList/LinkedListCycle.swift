//
//  LinkedListCycle.swift
//  leetcode
//
//  Created by Kai Wang on 6/24/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class LinkedListCycle {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head?.next != nil else { return false }
        var slow = head
        var fast = head
        while slow != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }

    func hasCycle2(_ head: ListNode?) -> Bool {
        guard head?.next != nil else { return false }
        let tail = reverseList(head)
        return tail === head
    }

    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var prev: ListNode? = nil
        var head = head
        var next = head?.next
        while head != nil {
            head?.next = prev
            prev = head
            head = next
            next = head?.next
        }
        return prev
    }

    func test() {
        let case1 = ([3,2,0,-4], 1)
        let case2 = ([1,2], 0)
        let case3 = ([1], -1)
        let cases = [case1, case2, case3]
        for input in cases {
            let list = arrayToCycleList(input.0, pos: input.1)
            print(hasCycle(list))
        }
    }
}
