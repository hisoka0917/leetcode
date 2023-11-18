import unittest
from Heap import LastStoneWeight


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([2, 7, 4, 1, 8, 1], 1),
            ([1], 1)
        ]
        solution = LastStoneWeight.Solution()
        for arr, expected in cases:
            res = solution.lastStoneWeight(arr)
            self.assertEqual(expected, res)


if __name__ == '__main__':
    unittest.main()
