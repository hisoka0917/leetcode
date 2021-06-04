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

    public convenience init?(values: [Int?]) {
        guard !values.isEmpty else {
            return nil
        }

        guard let first = values[0] else {
            return nil
        }
        self.init(first)
        var nodes = [TreeNode?]()
        nodes.append(self)
        var childrenNodes = [TreeNode?]()

        for (index, _) in values.enumerated() {
            let left = index * 2 + 1
            let right = index * 2 + 2
            if left < values.count {
                // left child
                if let leftValue = values[left] {
                    childrenNodes.append(TreeNode(leftValue))
                } else {
                    childrenNodes.append(nil)
                }
            } else {
                childrenNodes.append(nil)
            }
            if right < values.count {
                // right child
                if let rightValue = values[right] {
                    childrenNodes.append(TreeNode(rightValue))
                } else {
                    childrenNodes.append(nil)
                }
            } else {
                childrenNodes.append(nil)
            }
            if let root = nodes.removeFirst() {
                let leftNode = childrenNodes.removeFirst()
                root.left = leftNode
                nodes.append(leftNode)
                let rightNode = childrenNodes.removeFirst()
                root.right = rightNode
                nodes.append(rightNode)
            }
        }
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
