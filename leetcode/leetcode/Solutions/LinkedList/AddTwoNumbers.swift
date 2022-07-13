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
        let header: ListNode? = ListNode()
        var node = header
        var carry = 0
        while l1 != nil || l2 != nil || carry > 0 {
            var sum = 0
            if l1 != nil {
                sum += l1!.val
            }
            if l2 != nil {
                sum += l2!.val
            }
            sum += carry
            carry = sum / 10
            sum %= 10

            node?.next = ListNode(sum)
            l1 = l1?.next
            l2 = l2?.next
            node = node?.next
        }

        return header?.next
    }
}
