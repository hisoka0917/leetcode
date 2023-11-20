import unittest
from Math import HappyNumber


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            (19, True),
            (2, False)
        ]
        solution = HappyNumber.Solution()
        for n, expected in cases:
            self.assertEqual(expected, solution.isHappy(n))


if __name__ == '__main__':
    unittest.main()
