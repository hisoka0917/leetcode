//
//  RemoveNthNodeFromEndofList.swift
//  leetcode
//
//  Created by Kai Wang on 7/13/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class RemoveNthNodeFromEndofList {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var slow = head
        var fast = head
        for _ in 0 ..< n {
            fast = fast?.next
        }
        if fast == nil {
            // remove head
            return head?.next
        }
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        return head
    }

    func test() {
        let case1 = ([1,2,3,4,5], 2)
        let case2 = ([1], 1)
        let case3 = ([1,2], 1)
        let case4 = ([1,2], 2)
        let cases = [case1, case2, case3, case4]
        for input in cases {
            let list = arrayToList(input.0)
            let res = removeNthFromEnd(list, input.1)
            print(listToArray(res))
        }
    }

}
