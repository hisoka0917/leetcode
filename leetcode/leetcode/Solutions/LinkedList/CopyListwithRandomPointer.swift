//
//  CopyListwithRandomPointer.swift
//  leetcode
//
//  Created by Kai Wang on 7/13/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class CopyListwithRandomPointer {
    fileprivate func copyRandomList(_ head: RandomListNode?) -> RandomListNode? {
        guard head != nil else { return nil }
        var node = head
        var nodeArray = [RandomListNode]()
        var copyArray = [RandomListNode]()
        while node != nil {
            nodeArray.append(node!)
            copyArray.append(RandomListNode(node!.val))
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

fileprivate class RandomListNode {
    fileprivate var val: Int
    fileprivate var next: RandomListNode?
    fileprivate var random: RandomListNode?
    fileprivate init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}


fileprivate func makeRandomList(from array: [[Int?]]) -> RandomListNode {
    let nodeArray = array.map { RandomListNode($0[0]!) }
    let length = nodeArray.count
    for i in 0 ..< length {
        nodeArray[i].next = i + 1 < length ? nodeArray[i + 1] : nil
        if let randomPointer = array[i][1] {
            nodeArray[i].random = nodeArray[randomPointer]
        }
    }
    return nodeArray[0]
}

fileprivate func arrayFromRandomList(node: RandomListNode?) -> [[Int?]] {
    var head = node
    var res = [[Int?]]()
    var nodeArray = [RandomListNode]()
    while head != nil {
        nodeArray.append(node!)
        head = head?.next
    }

    head = node
    while head != nil {
        let val = head?.val
        var randomPos: Int? = nil
        if let random = node?.random,
           let position = nodeArray.firstIndex(where: { $0 === random }) {
               randomPos = position
        }
        res.append([val!, randomPos])
        head = head?.next
    }
    return res
}

