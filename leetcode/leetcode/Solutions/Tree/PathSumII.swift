//
//  PathSumII.swift
//  leetcode
//
//  Created by Kai Wang on 8/4/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class PathSumII {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var result = [[Int]]()
        dfs(root, targetSum: targetSum, sum: 0, path: [], result: &result)
        return result
    }

    func dfs(_ node: TreeNode, targetSum: Int, sum: Int, path: [Int], result: inout [[Int]]) {
        if node.left == nil && node.right == nil {
            // leaf
            if targetSum == sum + node.val {
                var path = path
                path.append(node.val)
                result.append(path)
            }
        } else {
            var path = path
            path.append(node.val)
            if let left = node.left {
                dfs(left, targetSum: targetSum, sum: sum + node.val, path: path, result: &result)
            }
            if let right = node.right {
                dfs(right, targetSum: targetSum, sum: sum + node.val, path: path, result: &result)
            }
        }
    }

    func test() {
        let case1 = DataModel(root: [5,4,8,11,nil,13,4,7,2,nil,nil,5,1], targetSum: 22)
        let case2 = DataModel(root: [1,2,3], targetSum: 5)
        let case3 = DataModel(root: [1,2], targetSum: 0)
        let case4 = DataModel(root: [-2,nil,-3], targetSum: -5)
        let cases = [case1, case2, case3, case4]
        for input in cases {
            let root = TreeNode(values: input.root)
            print(pathSum(root, input.targetSum))
        }
    }

    struct DataModel {
        var root: [Int?]
        var targetSum: Int
    }
}
