//
//  CloneGraph.swift
//  leetcode
//
//  Created by Kai Wang on 7/19/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class CloneGraph {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        var visited = [Int: Node]()
        var queue = [node]
        while !queue.isEmpty {
            let head = queue.removeFirst()
            let copy = Node(head.val)
            visited[head.val] = copy
            for neighbor in head.neighbors where neighbor != nil {
                if let visitedNeighbor = visited[neighbor!.val] {
                    copy.neighbors.append(visitedNeighbor)
                    visitedNeighbor.neighbors.append(copy)
                } else {
                    if !queue.contains(neighbor!) {
                        queue.append(neighbor!)
                    }
                }
            }
        }

        return visited[node.val]
    }

    func test() {
        let case1 = [[2,4],[1,3],[2,4],[1,3]]
        let case2: [[Int]] = [[]]
        let case3: [[Int]] = []
        let cases = [case1, case2, case3]
        for input in cases {
            let node = makeNode(from: input)
            let copy = cloneGraph(node)
            print(adjacencyList(from: copy))
        }

    }
}
