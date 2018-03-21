//
//  ListNode.swift
//  leetcode
//
//  Created by Wang Kai on 2017/11/20.
//  Copyright © 2017年 Pirate. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func arrayToList(_ array: Array<Int>) -> ListNode? {
    guard array.count > 0 else {
        return nil
    }
    let head = ListNode.init(0)
    var p = head
    for i in array {
        let item = ListNode.init(i)
        p.next = item
        p = p.next!
    }
    return head.next
}

func listToArray(_ list: ListNode?) -> Array<Int> {
    guard list != nil else {
        return []
    }
    var array: Array<Int> = []
    var list: ListNode? = list
    repeat {
        array.append((list?.val)!)
        list = list?.next
    } while (list != nil)
    return array
}
