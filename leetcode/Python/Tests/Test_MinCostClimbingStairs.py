import unittest
from DynamicProgrammingI import MinCostClimbingStairs


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([10, 15, 20], 15),
            ([1, 100, 1, 1, 1, 100, 1, 1, 100, 1], 6)
        ]
        solution = MinCostClimbingStairs.Solution()
        for arr, expected in cases:
            self.assertEqual(expected, solution.minCostClimbingStairs(arr))


if __name__ == '__main__':
    unittest.main()
