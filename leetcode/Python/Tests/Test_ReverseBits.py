import unittest
from Bits import ReverseBits


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            (0b00000010100101000001111010011100, 0b00111001011110000010100101000000),
            (0b11111111111111111111111111111101, 0b10111111111111111111111111111111)
        ]
        solution = ReverseBits.Solution()
        for n, expected in cases:
            self.assertEqual(expected, solution.reverseBits(n))


if __name__ == '__main__':
    unittest.main()
