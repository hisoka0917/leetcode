import unittest
from Trees import DiameterofBinaryTree
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1, 2, 3, 4, 5], 3),
            ([1, 2], 1)
        ]
        solution = DiameterofBinaryTree.Solution()
        for arr, expected in cases:
            tree = helper.array_to_binary_tree(arr)
            res = solution.diameterOfBinaryTree(tree)
            self.assertEqual(expected, res)


if __name__ == '__main__':
    unittest.main()
