//
//  AddTwoNumbers.swift
//  leetcode
//
//  Created by Wang Kai on 2018/3/22.
//  Copyright © 2018年 Pirate. All rights reserved.
//

import Foundation

class AddTwoNumbers {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else {
            return l2
        }
        guard l2 != nil else {
            return l1
        }
        var l1 = l1
        var l2 = l2
        let header = ListNode(0)
        var node = header
        var carry = 0
        var sum = 0
        while l1 != nil || l2 != nil || carry > 0 {
            let val1 = l1?.val ?? 0
            let val2 = l2?.val ?? 0
            sum = val1 + val2 + carry
            carry = 0
            if sum >= 10 {
                carry = 1
                sum -= 10
            }
            let newNode = ListNode.init(sum)
            node.next = newNode
            l1 = l1?.next
            l2 = l2?.next
            node = newNode
        }

        return header.next
    }
}
