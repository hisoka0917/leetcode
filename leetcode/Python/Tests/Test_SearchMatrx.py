import unittest
from BinarySearch import Search2DMatrix


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]], 3, True),
            ([[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]], 13, False),
            ([[1]], 2, False)
        ]
        solution = Search2DMatrix.Solution()
        for matrix, target, expected in cases:
            self.assertEqual(expected, solution.searchMatrix(matrix, target))


if __name__ == '__main__':
    unittest.main()
