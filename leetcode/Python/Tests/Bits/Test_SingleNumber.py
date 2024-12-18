import unittest
from Bits import SingleNumber


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([2, 2, 1], 1),
            ([4, 1, 2, 1, 2], 4),
            ([1], 1)
        ]
        solution = SingleNumber.Solution()
        for nums, expected in cases:
            self.assertEqual(expected, solution.singleNumber(nums))


if __name__ == '__main__':
    unittest.main()
