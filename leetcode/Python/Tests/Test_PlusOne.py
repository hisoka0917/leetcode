import unittest
from Math import PlusOne


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1, 2, 3], [1, 2, 4]),
            ([4, 3, 2, 1], [4, 3, 2, 2]),
            ([9], [1, 0])
        ]
        solution = PlusOne.Solution()
        for nums, expected in cases:
            self.assertEqual(expected, solution.plusOne(nums))


if __name__ == '__main__':
    unittest.main()
