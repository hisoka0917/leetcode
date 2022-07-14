//
//  BinaryTreeRightSideView.swift
//  leetcode
//
//  Created by Kai Wang on 7/14/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class BinaryTreeRightSideView {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res = [Int]()
        var queue = [root]
        while !queue.isEmpty {
            let count = queue.count
            res.append(queue[count - 1].val)
            for _ in 0 ..< count {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return res
    }

    func test() {
        let case1 = [1,2,3,nil,5,nil,4]
        let case2 = [1,nil,3]
        let case3 = [Int?]()
        let cases = [case1, case2, case3]
        for input in cases {
            let root = TreeNode(values: input)
            print(rightSideView(root))
        }
    }
}
