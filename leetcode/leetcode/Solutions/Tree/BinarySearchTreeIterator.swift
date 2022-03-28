//
//  BinarySearchTreeIterator.swift
//  leetcode
//
//  Created by Kai Wang on 3/28/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class BSTIterator {
    var stack = [TreeNode]()
    init(_ root: TreeNode?) {
        var node = root
        while node != nil {
            stack.append(node!)
            node = node!.left
        }
    }

    func next() -> Int {
        var node = stack.popLast()
        let val = node!.val
        node = node?.right
        while node != nil {
            stack.append(node!)
            node = node!.left
        }

        return val
    }

    func hasNext() -> Bool {
        !stack.isEmpty
    }

    static func test() {
        let nodes = [7, 3, 15, nil, nil, 9, 20]
        let tree = TreeNode(values: nodes)
        let bstIterator = BSTIterator(tree)
        print(bstIterator.next())
        print(bstIterator.next())
        print(bstIterator.hasNext())
        print(bstIterator.next())
        print(bstIterator.hasNext())
        print(bstIterator.next())
        print(bstIterator.hasNext())
        print(bstIterator.next())
        print(bstIterator.hasNext())
    }
}

/*
class BSTIterator {
    private var sorted: [Int]
    private var idx: Int
    init(_ root: TreeNode?) {
        sorted = []
        idx = -1
        dfs(root, &sorted)
    }

    func next() -> Int {
        idx += 1
        return sorted[idx]
    }

    func hasNext() -> Bool {
        return idx + 1 < sorted.count
    }

    private func dfs(_ root: TreeNode?, _ sorted: inout [Int]) {
        guard let root = root else {
            return
        }
        dfs(root.left, &sorted)
        sorted.append(root.val)
        dfs(root.right, &sorted)
    }
}
*/
