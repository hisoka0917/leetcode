import unittest
from Trees import SameTree
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1, 2, 3], [1, 2, 3], True),
            ([1, 2], [1, None, 2], False),
            ([1, 2, 1], [1, 1, 2], False)
        ]
        solution = SameTree.Solution()
        for l1, l2, expected in cases:
            p = helper.array_to_binary_tree(l1)
            q = helper.array_to_binary_tree(l2)
            res = solution.isSameTree(p, q)
            self.assertEqual(expected, res)


if __name__ == '__main__':
    unittest.main()
