//
//  LowestCommonAncestorofaBinarySearchTree.swift
//  leetcode
//
//  Created by Kai Wang on 7/14/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class LowestCommonAncestorofaBinarySearchTree {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard root != nil else { return nil }

        if root!.val > p!.val && root!.val > q!.val {
            return lowestCommonAncestor(root?.left, p, q)
        } else if root!.val < p!.val && root!.val < q!.val {
            return lowestCommonAncestor(root?.right, p, q)
        } else {
            return root
        }
    }

    func lcaNonRecurrsive(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var root = root
        while root != nil {
            if root!.val > p!.val && root!.val > q!.val {
                root = root?.left
            } else if root!.val < p!.val && root!.val < q!.val {
                root = root?.right
            } else {
                return root
            }
        }
        return root
    }

    func test() {
        let case1 = ([6,2,8,0,4,7,9,nil,nil,3,5], 2, 4)
        let case2 = ([2,1], 2, 1)
        let cases = [case1, case2]
        for input in cases {
            let root = TreeNode(values: input.0)
            let p = TreeNode(input.1)
            let q = TreeNode(input.2)
            print(lcaNonRecurrsive(root, p, q)?.val ?? "Not found")
        }
    }
}
