//
//  MaximumDepthofBinaryTree.swift
//  leetcode
//
//  Created by Kai Wang on 6/26/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class MaximumDepthofBinaryTree {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }

        let depth = max(maxDepth(root?.left), maxDepth(root?.right)) + 1

        return depth
    }

    func test() {
        let case1 = [3,9,20,nil,nil,15,7]
        let case2 = [1,nil,2]
        let cases = [case1, case2]
        for input in cases {
            let tree = TreeNode(values: input)
            print(maxDepth(tree))
        }
    }
}
