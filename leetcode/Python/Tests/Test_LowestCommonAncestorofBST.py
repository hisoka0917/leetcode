import unittest
from Trees import LowestCommonAncestorofaBinarySearchTree
import helper
from datastructure.binarytree import TreeNode


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([6, 2, 8, 0, 4, 7, 9, None, None, 3, 5], 2, 8, 6),
            ([6, 2, 8, 0, 4, 7, 9, None, None, 3, 5], 2, 4, 2),
            ([2, 1], 2, 1, 2)
        ]
        solution = LowestCommonAncestorofaBinarySearchTree.Solution()
        for arr, p, q, expected in cases:
            tree = helper.array_to_binary_tree(arr)
            ans = solution.lowestCommonAncestor(tree, TreeNode(p), TreeNode(q))
            self.assertEqual(expected, ans.val)


if __name__ == '__main__':
    unittest.main()
