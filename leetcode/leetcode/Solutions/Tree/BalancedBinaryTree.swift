//  Given a binary tree, determine if it is height-balanced.
//
//  For this problem, a height-balanced binary tree is defined as:
//
//  a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

//  Example 1:
//
//            3
//          /   \
//         9    20
//             /  \
//            15   7
//
//  Input: root = [3,9,20,nil,nil,15,7]
//  Output: true

//    Example 2:
//
//                1
//              /   \
//             2     2
//            / \
//           3   3
//          / \
//         4   4
//
//    Input: root = [1,2,2,3,3,nil,nil,4,4]
//    Output: false

import Foundation

class BalancedBinaryTree {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let leftDepth = depth(root.left)
        let rightDepth = depth(root.right)
        guard abs(leftDepth - rightDepth) <= 1 else {
            return false
        }
        return isBalanced(root.left) && isBalanced(root.right)
    }

    func depth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let subTreeDepth = max(depth(root.left), depth(root.right))
        return 1 + subTreeDepth
    }

//    func validateHeight(for node: TreeNode?) throws -> Int {
//        guard let node = node else { return 0 }
//
//        if node.isLeaf {
//            return 1
//        }
//
//        let leftHeight = try validateHeight(for: node.left)
//        let rightHeight = try validateHeight(for: node.right)
//
//        if abs(leftHeight - rightHeight) > 1 {
//            throw "Not balanced"
//        }
//
//        return max(leftHeight, rightHeight) + 1
//    }
//
//
//    func isBalanced(_ root: TreeNode?) -> Bool {
//        guard let root = root else { return true }
//
//        do {
//            try validateHeight(for: root)
//            return true
//        } catch {
//            return false
//        }
//    }

    func test() {
        let case1: [Int?] = [3,9,20,nil,nil,15,7]
        let case2: [Int?] = [1,2,2,3,3,nil,nil,4,4]
        let case3 = [Int?]()
        let cases = [case1, case2, case3]
        for input in cases {
            let tree = TreeNode(values: input)
            print(isBalanced(tree))
            if let array = tree?.toArray() {
                print(array)
            }
        }
    }
}
