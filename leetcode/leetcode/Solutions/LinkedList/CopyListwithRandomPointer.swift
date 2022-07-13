//
//  CopyListwithRandomPointer.swift
//  leetcode
//
//  Created by Kai Wang on 7/13/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class CopyListwithRandomPointer {
    func copyRandomList(_ head: Node?) -> Node? {
        guard head != nil else { return nil }
        var node = head
        var nodeArray = [Node]()
        var copyArray = [Node]()
        while node != nil {
            nodeArray.append(node!)
            copyArray.append(Node(node!.val))
            node = node?.next
        }
        node = head
        let length = copyArray.count
        for i in 0 ..< length {
            copyArray[i].next = i + 1 < length ? copyArray[i + 1] : nil
            if let random = node?.random,
                let pos = nodeArray.firstIndex(where: { $0 === random }) {
                copyArray[i].random = copyArray[pos]
            }
            node = node?.next
        }
        return copyArray[0]
    }

    func test() {
        let case1 = [[7,nil],[13,0],[11,4],[10,2],[1,0]]
        let case2 = [[1,1],[2,1]]
        let case3 = [[3,nil],[3,0],[3,nil]]
        let cases = [case1, case2, case3]
        for input in cases {
            let head = makeRandomList(from: input)
            let copy = copyRandomList(head)
            print(arrayFromRandomList(node: copy))
        }
    }
}
