import unittest
from Trees import CountGoodNodesinBinaryTree
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 1, 4, 3, None, 1, 5], 4),
            ([3, 3, None, 4, 2], 3),
            ([1], 1)
        ]
        solution = CountGoodNodesinBinaryTree.Solution()
        for arr, expected in cases:
            tree = helper.array_to_binary_tree(arr)
            self.assertEqual(expected, solution.goodNodes(tree))


if __name__ == '__main__':
    unittest.main()
