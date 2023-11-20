import unittest
from Bits import CountingBits


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            (2, [0, 1, 1]),
            (5, [0, 1, 1, 2, 1, 2])
        ]
        solution = CountingBits.Solution()
        for n, expected in cases:
            self.assertEqual(expected, solution.countBits(n))


if __name__ == '__main__':
    unittest.main()
