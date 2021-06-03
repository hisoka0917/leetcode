//
//  MergeTwoSortedLists.swift
//  leetcode
//
//  Created by Wang Kai on 2017/11/20.
//  Copyright © 2017年 Pirate. All rights reserved.
//

import Foundation

class MergeTwoSortedLists {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var newList = ListNode.init(0)
        let head = newList
        while l1 != nil && l2 != nil {
            if let val1 = l1?.val {
                if let val2 = l2?.val {
                    if val1 < val2 {
                        newList.next = l1
                        l1 = l1?.next
                    } else {
                        newList.next = l2
                        l2 = l2?.next
                    }
                }
            }
            newList = newList.next!
        }
        newList.next = l1 != nil ? l1 : l2
        return head.next
    }
}
