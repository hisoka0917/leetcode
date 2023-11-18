import unittest
from DynamicProgrammingI import ClimbingStairs


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            (1, 1),
            (2, 2),
            (3, 3),
            (4, 5)
        ]
        solution = ClimbingStairs.Solution()
        for n, expected in cases:
            self.assertEqual(expected, solution.climbStairs(n))


if __name__ == '__main__':
    unittest.main()
