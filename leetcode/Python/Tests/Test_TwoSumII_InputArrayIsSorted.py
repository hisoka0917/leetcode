import unittest
from TwoPointers import TwoSumII


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([2, 7, 11, 15], 9, [1, 2]),
            ([2, 3, 4], 6, [1, 3]),
            ([-1, 0], -1, [1, 2])
        ]
        solution = TwoSumII.Solution()
        for nums, target, expected in cases:
            self.assertEqual(expected, solution.twoSum(nums, target))


if __name__ == '__main__':
    unittest.main()
