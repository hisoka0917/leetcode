//
//  Node.swift
//  leetcode
//
//  Created by Kai Wang on 7/13/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}


func makeRandomList(from array: [[Int?]]) -> Node {
    let nodeArray = array.map { Node($0[0]!) }
    let length = nodeArray.count
    for i in 0 ..< length {
        nodeArray[i].next = i + 1 < length ? nodeArray[i + 1] : nil
        if let randomPointer = array[i][1] {
            nodeArray[i].random = nodeArray[randomPointer]
        }
    }
    return nodeArray[0]
}

func arrayFromRandomList(node: Node?) -> [[Int?]] {
    var head = node
    var res = [[Int?]]()
    var nodeArray = [Node]()
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
