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
            if let val1 = l1?.val,
               let val2 = l2?.val {
                if val1 < val2 {
                    newList.next = l1
                    l1 = l1?.next
                } else {
                    newList.next = l2
                    l2 = l2?.next
                }
            }
            newList = newList.next!
        }
        newList.next = l1 != nil ? l1 : l2
        return head.next
    }

    func test() {
        let case1 = ([1,2,4], [1,3,4])
        let case2 = ([Int](),[Int]())
        let case3 = ([Int](), [0])
        let cases = [case1, case2, case3]
        for input in cases {
            let l1 = arrayToList(input.0)
            let l2 = arrayToList(input.1)
            let res = mergeTwoLists(l1, l2)
            print(listToArray(res))
        }
    }
}
