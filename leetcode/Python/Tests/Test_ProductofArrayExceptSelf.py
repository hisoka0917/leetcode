import unittest
from ArrayAndHashing import ProductofArrayExceptSelf


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1, 2, 3, 4], [24, 12, 8, 6]),
            ([-1, 1, 0, -3, 3], [0, 0, 9, 0, 0])
        ]
        solution = ProductofArrayExceptSelf.Solution()
        for nums, expected in cases:
            self.assertEqual(expected, solution.productExceptSelf(nums))


if __name__ == '__main__':
    unittest.main()
