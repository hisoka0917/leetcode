import unittest
from Bits import SumOfTwoIntegers


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            [1, 2, 3],
            [2, 3, 5]
        ]
        solution = SumOfTwoIntegers.Solution()
        for a, b, expected in cases:
            res = solution.getSum(a, b)
            self.assertEqual(expected, res)



if __name__ == '__main__':
    unittest.main()
