//
//  CountGoodNodesinBinaryTree.swift
//  leetcode
//
//  Created by Kai Wang on 8/29/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class CountGoodNodesinBinaryTree {
    func goodNodes(_ root: TreeNode?) -> Int {
        var count = 0

        func helper(node: TreeNode?, largestInPath: Int) {
            guard let node = node else {
                return
            }
            if node.val >= largestInPath {
                count += 1
            }
            helper(node: node.left, largestInPath: max(largestInPath, node.val))
            helper(node: node.right, largestInPath: max(largestInPath, node.val))
        }

        helper(node: root, largestInPath: Int.min)

        return count
    }

    func test() {
        let case1 = [3,1,4,3,nil,1,5]
        let case2 = [3,3,nil,4,2]
        let case3 = [1]
        let cases = [case1, case2, case3]
        for input in cases {
            let tree = TreeNode(values: input)
            print(goodNodes(tree))
        }
    }
}
