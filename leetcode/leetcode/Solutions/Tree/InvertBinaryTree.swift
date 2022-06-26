//
//  InvertBinaryTree.swift
//  leetcode
//
//  Created by Kai Wang on 6/26/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class InvertBinaryTree {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root?.left != nil || root?.right != nil else {
            return root
        }

        let temp = root?.left
        root?.left = root?.right
        root?.right = temp

        if root?.left != nil {
            root?.left = invertTree(root?.left)
        }
        if root?.right != nil {
            root?.right = invertTree(root?.right)
        }

        return root
    }

    func test() {
        let case1 = [4,2,7,1,3,6,9]
        let case2 = [2,1,3]
        let case3 = [Int]()
        let cases = [case1, case2, case3]
        for input in cases {
            let tree = TreeNode(values: input)
            let root = invertTree(tree)
            print(root?.toArray() ?? [])
        }
    }
}
