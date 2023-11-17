from typing import Optional

from datastructure.binarytree import TreeNode


class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0
        return 1 + max(self.maxDepth(root.left), self.maxDepth(root.right))

    def maxDepth_iterative(self, root: Optional[TreeNode]) -> int:
        res = 0
        stack = [(root, 1)]
        while stack:
            node, depth = stack.pop()
            if node:
                res = max(res, depth)
                stack.append((node.left, depth + 1))
                stack.append((node.right, depth + 1))

        return res
