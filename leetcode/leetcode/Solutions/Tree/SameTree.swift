//
//  SameTree.swift
//  leetcode
//
//  Created by Kai Wang on 7/14/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class SameTree {
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
        let case1 = ([1,2,3], [1,2,3])
        let case2 = ([1,2], [1,nil,2])
        let case3 = ([1,2,1], [1,1,2])
        let cases = [case1, case2, case3]
        for input in cases {
            let p = TreeNode(values: input.0)
            let q = TreeNode(values: input.1)
            print(isSameTree(p, q))
        }
    }
}
