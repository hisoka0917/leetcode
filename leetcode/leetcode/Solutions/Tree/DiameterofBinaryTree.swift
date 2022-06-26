//
//  DiameterofBinaryTree.swift
//  leetcode
//
//  Created by Kai Wang on 6/26/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class DiameterofBinaryTree {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        _ = depth(root, diameter: &diameter)
        return diameter
    }

    func depth(_ root: TreeNode?, diameter: inout Int) -> Int {
        guard root != nil else { return 0 }
        let leftD = depth(root?.left, diameter: &diameter)
        let rightD = depth(root?.right, diameter: &diameter)
        diameter = max(diameter, leftD + rightD)
        return max(leftD, rightD) + 1
    }

    func test() {
        let case1 = [1,2,3,4,5]
        let case2 = [1,2]
        let cases = [case1, case2]
        for input in cases {
            let tree = TreeNode(values: input)
            print(diameterOfBinaryTree(tree))
        }
    }
}
