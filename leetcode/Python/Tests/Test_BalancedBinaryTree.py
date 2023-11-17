import unittest
from Trees import BalancedBinaryTree
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 9, 20, None, None, 15, 7], True),
            ([1, 2, 2, 3, 3, None, None, 4, 4], False),
            ([], True)
        ]
        solution = BalancedBinaryTree.Solution()
        for arr, expected in cases:
            tree = helper.array_to_binary_tree(arr)
            res = solution.isBalanced(tree)
            self.assertEqual(expected, res)


if __name__ == '__main__':
    unittest.main()
