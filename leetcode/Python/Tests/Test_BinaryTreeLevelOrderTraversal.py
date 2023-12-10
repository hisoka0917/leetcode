import unittest
from Trees import BinaryTreeLevelOrderTraversal
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 9, 20, None, None, 15, 7], [[3], [9, 20], [15, 7]]),
            ([1], [[1]]),
            ([], [])
        ]
        solution = BinaryTreeLevelOrderTraversal.Solution()
        for arr, expected in cases:
            tree = helper.array_to_binary_tree(arr)
            self.assertEqual(expected, solution.levelOrder(tree))


if __name__ == '__main__':
    unittest.main()
