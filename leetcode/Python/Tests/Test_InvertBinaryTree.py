import unittest

from Trees import InvertBinaryTree
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([4, 2, 7, 1, 3, 6, 9], [4, 7, 2, 9, 6, 3, 1]),
            ([2, 1, 3], [2, 3, 1]),
            ([], [])
        ]
        solution = InvertBinaryTree.Solution()
        for case, expected in cases:
            tree = helper.array_to_binary_tree(case)
            res = solution.invertTree(tree)
            self.assertEqual(expected, helper.tree_to_array(res))


if __name__ == '__main__':
    unittest.main()
