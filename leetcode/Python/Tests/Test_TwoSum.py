import unittest
from ArrayAndHashing import TwoSum


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        solution = TwoSum.Solution()
        cases = [
            (([2,7,11,15], 9), [0, 1]),
            (([3,2,4], 6), [1, 2]),
            (([3,3], 6), [0, 1])
        ]
        for case, expected in cases:
            self.assertEqual(expected, solution.twoSum(case[0], case[1]))


if __name__ == '__main__':
    unittest.main()
