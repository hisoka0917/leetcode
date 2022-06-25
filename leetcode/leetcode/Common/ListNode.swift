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
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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

func arrayToCycleList(_ array: [Int], pos: Int) -> ListNode? {
    guard array.count > 0 else {
        return nil
    }
    let head = ListNode.init(0)
    var p: ListNode? = head
    var cycleNode: ListNode?
    for (index, val) in array.enumerated() {
        let item = ListNode.init(val)
        p?.next = item
        p = p?.next
        if index == pos {
            cycleNode = item
        }
    }
    p?.next = cycleNode
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

func cycleList(at pos: Int, list: ListNode?) -> ListNode? {
    guard let head = list, pos >= 0 else {
        return list
    }
    var tail: ListNode? = head
    var posNode: ListNode? = nil
    var index = 0
    while tail?.next != nil {
        if index == pos {
            posNode = tail
        }
        index += 1
        tail = tail?.next
    }
    tail?.next = posNode
    return head
}
