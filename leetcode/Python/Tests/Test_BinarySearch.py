import unittest
from BinarySearch import BinarySearch


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            (([-1, 0, 3, 5, 9, 12], 9), 4),
            (([[-1, 0, 3, 5, 9, 12], 2]), -1)
        ]
        solution = BinarySearch.Solution()
        for case, expected in cases:
            self.assertEqual(expected, solution.search(case[0], case[1]))


if __name__ == '__main__':
    unittest.main()
