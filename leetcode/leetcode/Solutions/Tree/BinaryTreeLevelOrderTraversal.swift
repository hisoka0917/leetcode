//
//  BinaryTreeLevelOrderTraversal.swift
//  leetcode
//
//  Created by Kai Wang on 7/14/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class BinaryTreeLevelOrderTraversal {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue = [root]
        while !queue.isEmpty {
            var level = [Int]()
            let count = queue.count
            for _ in 0 ..< count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(level)
        }
        return res
    }

    func test() {
        let case1 = [3,9,20,nil,nil,15,7]
        let case2 = [1]
        let case3 = [Int?]()
        let cases = [case1, case2, case3]
        for input in cases {
            let root = TreeNode(values: input)
            print(levelOrder(root))
        }
    }
}
