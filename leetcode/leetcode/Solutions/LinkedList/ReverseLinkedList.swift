//
//  ReverseLinkedList.swift
//  leetcode
//
//  Created by Kai Wang on 6/24/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ReverseLinkedList {
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
        let case1 = [1,2,3,4,5]
        let case2 = [1,2]
        let case3 = [Int]()
        let cases = [case1, case2, case3]
        for input in cases {
            let list = arrayToList(input)
            let reverted = reverseList(list)
            print(listToArray(reverted))
        }
    }
}
