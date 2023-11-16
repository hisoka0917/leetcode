import unittest
from SlidingWindow import BestTimetoBuyandSellStock


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([7, 1, 5, 3, 6, 4], 5),
            ([7, 6, 4, 3, 1], 0)
        ]
        solution = BestTimetoBuyandSellStock.Solution()
        for case, expected in cases:
            self.assertEqual(expected, solution.maxProfit(case))


if __name__ == '__main__':
    unittest.main()
