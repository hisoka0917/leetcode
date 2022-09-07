//
//  ConstructStringfromBinaryTree.swift
//  leetcode
//
//  Created by Kai Wang on 9/7/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ConstructStringfromBinaryTree {
    func tree2str(_ root: TreeNode?) -> String {
        guard let root = root else {
            return ""
        }
        var str = "\(root.val)"
        let left = tree2str(root.left)
        let right = tree2str(root.right)
        if root.right != nil {
            str += "(\(left))(\(right))"
        } else {
            str += root.left != nil ? "(\(left))" : ""
        }
        return str
    }

    func test() {
        let case1 = [1,2,3,4]
        let case2 = [1,2,3,nil,4]
        let cases = [case1, case2]
        for input in cases {
            let tree = TreeNode(values: input)
            print(tree2str(tree))
        }
    }
}
