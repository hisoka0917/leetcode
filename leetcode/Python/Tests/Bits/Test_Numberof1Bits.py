import unittest
from Bits import Numberof1Bits


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            (0b00000000000000000000000000001011, 3),
            (0b00000000000000000000000010000000, 1),
            (0b11111111111111111111111111111101, 31)
        ]
        solution = Numberof1Bits.Solution()
        for n, expected in cases:
            self.assertEqual(expected, solution.hammingWeight(n))


if __name__ == '__main__':
    unittest.main()
