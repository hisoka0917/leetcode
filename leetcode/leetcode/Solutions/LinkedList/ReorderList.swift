//
//  ReorderList.swift
//  leetcode
//
//  Created by Kai Wang on 7/20/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class ReorderList {
    func reorderList(_ head: ListNode?) {
        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        var second = slow?.next

        // reverse second half of the list
        slow?.next = nil
        var prev: ListNode? = nil
        var next = second?.next
        while second != nil {
            second?.next = prev
            prev = second
            second = next
            next = second?.next
        }
        second = prev

        // reorder
        var first = head
        var tmp1: ListNode?
        var tmp2: ListNode?
        while second != nil {
            tmp1 = first?.next
            tmp2 = second?.next
            first?.next = second
            second?.next = tmp1
            second = tmp2
            first = tmp1
        }
    }

    func test() {
        let case1 = [1,2,3,4]
        let case2 = [1,2,3,4,5]
        let cases = [case1, case2]
        for input in cases {
            let list = arrayToList(input)
            reorderList(list)
            print(listToArray(list))
        }
    }
}
