//
//  SubtreeofAnotherTree.swift
//  leetcode
//
//  Created by Kai Wang on 7/14/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class SubtreeOfAnotherTree {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard root != nil else {
            return false
        }
        guard !isSameTree(root, subRoot) else {
            return true
        }
        return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
    }

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p?.val == q?.val else {
            return false
        }
        guard !(p == nil && q == nil) else {
            return true
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }

    func test() {
        let case1 = ([3,4,5,1,2], [4,1,2])
        let case2 = ([3,4,5,1,2,nil,nil,nil,nil,0], [4,1,2])
        let case3 = ([1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,2],
                     [1,nil,1,nil,1,nil,1,nil,1,nil,1,2])
        let cases = [case1, case2, case3]
        for input in cases {
            let root = TreeNode(values: input.0)
            let subRoot = TreeNode(values: input.1)
            print(isSubtree(root, subRoot))
        }
    }
}
