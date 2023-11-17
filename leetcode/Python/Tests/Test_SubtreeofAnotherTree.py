import unittest
from Trees import SubtreeofAnotherTree
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 4, 5, 1, 2], [4, 1, 2], True),
            ([3, 4, 5, 1, 2, None, None, None, None, 0], [4, 1, 2], False)
        ]
        solution = SubtreeofAnotherTree.Solution()
        for l1, l2, expected in cases:
            root = helper.array_to_binary_tree(l1)
            sub = helper.array_to_binary_tree(l2)
            res = solution.isSubtree(root, sub)
            self.assertEqual(expected, res)


if __name__ == '__main__':
    unittest.main()
