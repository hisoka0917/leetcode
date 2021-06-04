//
//  Binary Tree Inorder Traversal.swift
//  leetcode
//
//  Created by Kai Wang on 6/2/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class BinaryTreeInorderTraversal {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var inorders = [Int]()
        recursiveTraversal(root, result: &inorders)
        return inorders
    }

    func recursiveTraversal(_ root: TreeNode?, result: inout [Int]) {
        guard let node = root else {
            return
        }
        if let leftChild = node.left {
            recursiveTraversal(leftChild, result: &result)
        }
        result.append(node.val)
        if let rightChild = node.right {
            recursiveTraversal(rightChild, result: &result)
        }
    }

    func iterateTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = [Int]()
        var stack = [TreeNode]()
        stack.append(root)
        var current = root
        while !stack.isEmpty {
            if let left = current.left {
                stack.append(left)
                current = left
            } else {
                if let top = stack.popLast() {
                    result.append(top.val)
                    if let right = top.right {
                        stack.append(right)
                        current = right
                    }
                }
            }
        }
        return result
    }
}

extension BinaryTreeInorderTraversal {
    func test() {
        let case1 = [1,nil,2,3]
        let case2 = [Int?]()
        let case3 = [1]
        let case4 = [1,2]
        let case5 = [1,nil,2]
        let case6 = [2,3,nil,1]

        let cases = [case1, case2, case3, case4, case5, case6]
        for input in cases {
            let tree = TreeNode(values: input)
            let inorderTraversal = iterateTraversal(tree)
            print(inorderTraversal)
        }
    }
}
