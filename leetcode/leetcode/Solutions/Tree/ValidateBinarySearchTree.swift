//
//  ValidateBinarySearchTree.swift
//  leetcode
//
//  Created by Kai Wang on 8/29/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ValidateBinarySearchTree {
    func isValidBST(_ root: TreeNode?) -> Bool {

        func validate(node: TreeNode?, min: Int, max: Int) -> Bool {
            guard let node = node else {
                return true
            }
            guard node.val > min && node.val < max else {
                return false
            }
            let leftValid = validate(node: node.left, min: min, max: node.val)
            let rightValid = validate(node: node.right, min: node.val, max: max)
            return leftValid && rightValid
        }

        return validate(node: root, min: Int.min, max: Int.max)
    }

    func test() {
        let case1 = [2,1,3]
        let case2 = [5,1,4,nil,nil,3,6]
        let cases = [case1, case2]
        for input in cases {
            let tree = TreeNode(values: input)
            print(isValidBST(tree))
        }
    }
}
