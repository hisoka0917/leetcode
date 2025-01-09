import unittest
from TwoPointers import ThreeSum


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([-1, 0, 1, 2, -1, -4], [[-1, -1, 2], [-1, 0, 1]]),
            ([0, 1, 1], []),
            ([0, 0, 0], [[0, 0, 0]])
        ]
        solution = ThreeSum.Solution()
        for nums, expected in cases:
            self.assertEqual(expected, solution.threeSum(nums))


if __name__ == '__main__':
    unittest.main()
