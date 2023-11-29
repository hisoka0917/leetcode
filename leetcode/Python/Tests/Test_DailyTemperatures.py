import unittest
from Stack import DailyTemperatures


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([73, 74, 75, 71, 69, 72, 76, 73], [1, 1, 4, 2, 1, 1, 0, 0]),
            ([30, 40, 50, 60], [1, 1, 1, 0]),
            ([30, 60, 90], [1, 1, 0])
        ]
        solution = DailyTemperatures.Solution()
        for temp, expected in cases:
            self.assertEqual(expected, solution.dailyTemperatures(temp))


if __name__ == '__main__':
    unittest.main()
