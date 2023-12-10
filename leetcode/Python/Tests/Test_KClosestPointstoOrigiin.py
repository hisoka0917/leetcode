import unittest
from Heap import KClosestPointstoOrigin


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([[1, 3], [-2, 2]], 1, [[-2, 2]]),
            ([[3, 3], [5, -1], [-2, 4]], 2, [[3, 3], [-2, 4]])
        ]
        solution = KClosestPointstoOrigin.Solution()
        for points, k, expected in cases:
            self.assertEqual(expected, solution.kClosest(points, k))


if __name__ == '__main__':
    unittest.main()
