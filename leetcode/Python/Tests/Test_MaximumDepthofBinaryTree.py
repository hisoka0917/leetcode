import unittest

from Trees import MaximumDepthofBinaryTree
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 9, 20, None, None, 15, 7], 3),
            ([1, None, 2], 2)
        ]
        solution = MaximumDepthofBinaryTree.Solution()
        for arr, expected in cases:
            tree = helper.array_to_binary_tree(arr)
            res = solution.maxDepth(tree)
            self.assertEqual(expected, res)
            res = solution.maxDepth_iterative(tree)
            self.assertEqual(expected, res)


if __name__ == '__main__':
    unittest.main()
