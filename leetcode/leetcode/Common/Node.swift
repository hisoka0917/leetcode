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
    public var neighbors: [Node?]
    public init(_ val: Int) {
      self.val = val
      self.neighbors = []
    }
}

extension Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
    }
}

func makeNode(from adjacencyList: [[Int]]) -> Node? {
    guard !adjacencyList.isEmpty else {
        return nil
    }
    var nodeList = [Node]()
    for i in 1 ... adjacencyList.count {
        nodeList.append(Node(i))
    }
    for i in 0 ..< adjacencyList.count {
        let adj = adjacencyList[i]
        for int in adj {
            nodeList[i].neighbors.append(nodeList[int - 1])
        }
    }
    return nodeList.first!
}

func adjacencyList(from node: Node?) -> [[Int]] {
    guard let node = node else {
        return []
    }

    var stack = [node]
    var visited = Set<Node>()
    var res = [[Int]]()
    while !stack.isEmpty {
        let top = stack.removeLast()
        var adj = [Int]()
        for neighbor in top.neighbors {
            if !visited.contains(neighbor!),
                !stack.contains(neighbor!) {
                stack.append(neighbor!)
            }
            adj.append(neighbor!.val)
        }
        res.append(adj)
        visited.insert(top)
    }
    return res
}
