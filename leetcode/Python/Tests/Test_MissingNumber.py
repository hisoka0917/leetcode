import unittest
from Bits import MissingNumber


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 0, 1], 2),
            ([0, 1], 2),
            ([9, 6, 4, 2, 3, 5, 7, 0, 1], 8)
        ]
        solution = MissingNumber.Solution()
        for nums, expected in cases:
            self.assertEqual(expected, solution.missingNumber(nums))


if __name__ == '__main__':
    unittest.main()
