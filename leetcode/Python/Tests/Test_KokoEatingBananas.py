import unittest
from BinarySearch import KokoEatingBananas


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 6, 7, 11], 8, 4),
            ([30, 11, 23, 4, 20], 5, 30),
            ([30, 11, 23, 4, 20], 6, 23)
        ]
        solution = KokoEatingBananas.Solution()
        for piles, h, expected in cases:
            self.assertEqual(expected, solution.minEatingSpeed(piles, h))


if __name__ == '__main__':
    unittest.main()
