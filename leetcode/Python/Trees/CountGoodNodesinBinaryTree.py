from datastructure.binarytree import TreeNode


class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        def dfs(node: TreeNode, max_in_path: int) -> int:
            if not node:
                return 0
            res = 1 if node.val >= max_in_path else 0
            max_val = max(node.val, max_in_path)
            res += dfs(node.left, max_val)
            res += dfs(node.right, max_val)
            return res

        return dfs(root, root.val)
