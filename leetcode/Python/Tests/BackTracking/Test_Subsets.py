import unittest
from Backtracking import Subsets


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1,2,3], [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]),
            ([0], [[],[0]])
        ]
        solution = Subsets.Solution()
        for nums, expected in cases:
            res = solution.subsets(nums)
            self.assertEqual(expected, res)


if __name__ == '__main__':
    unittest.main()
