//
//  TreeNode.swift
//  leetcode
//
//  Created by Kai Wang on 11/18/20.
//  Copyright © 2020 Pirate. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }

    public convenience init?(values: [Int?], offset: Int = 0) {
        guard offset < values.count, let value = values[offset] else {
            return nil
        }
        self.init(value)
        self.left = TreeNode(values: values, offset: 2 * offset + 1)
        self.right = TreeNode(values: values, offset: 2 * offset + 2)
    }

    public func toArray() -> [Int?] {
        var queue = [TreeNode?]()
        var result = [Int?]()
        queue.append(self)
        var nextLevel = [TreeNode?]()
        while !queue.isEmpty {
            let root = queue.removeFirst()
            nextLevel.append(root?.left)
            nextLevel.append(root?.right)
            result.append(root?.val)
            if queue.isEmpty {
                let compact = nextLevel.compactMap({ $0 })
                guard !compact.isEmpty else {
                    break
                }
                queue = nextLevel
                nextLevel.removeAll()
            }
        }
        if let lastNode = result.lastIndex(where: { $0 != nil }) {
            result.removeLast(result.count - lastNode - 1)
        }
        return result
    }
 }
