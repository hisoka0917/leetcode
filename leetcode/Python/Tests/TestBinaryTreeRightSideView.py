import unittest
from Trees import BinaryTreeRightSideView
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1, 2, 3, None, 5, None, 4], [1, 3, 4]),
            ([1, None, 3], [1, 3]),
            ([], [])
        ]
        solution = BinaryTreeRightSideView.Solution()
        for arr, expected in cases:
            tree = helper.array_to_binary_tree(arr)
            self.assertEqual(expected, solution.rightSideView(tree))


if __name__ == '__main__':
    unittest.main()
